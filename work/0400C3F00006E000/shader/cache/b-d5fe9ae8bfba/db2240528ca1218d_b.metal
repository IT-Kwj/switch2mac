#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _461 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _478 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = rsqrt(_134);
    float _140 = rsqrt(_136);
    float _142 = _112 * _138;
    float _144 = _124 * _138;
    float _146 = _104 * _138;
    float _148 = -_66;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[46].z, _150);
    float _154 = _152 * _70;
    float _156 = _128 * _140;
    float _158 = _108 * _140;
    float _160 = _116 * _140;
    float _162 = _142 * _156;
    float _164 = _144 * _158;
    float _166 = -_162;
    float _168 = fma(_144, _160, _166);
    float _170 = _146 * _160;
    float _172 = -_164;
    float _174 = fma(_146, _156, _172);
    float _176 = _168 * _168;
    float _178 = -_170;
    float _180 = fma(_142, _158, _178);
    float _182 = fma(_174, _174, _176);
    float _184 = fma(_180, _180, _182);
    float _186 = rsqrt(_184);
    float _188 = _168 * _186;
    float _190 = _174 * _186;
    float _192 = _180 * _186;
    float _194 = _152 * _68;
    float _196 = _188 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _216 = exp2(_214);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _220 = fma(_188, _218, _194);
    float _222 = fma(_190, _218, _154);
    float _224 = fma(_192, _218, _152);
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _226);
    float _232 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _236 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].z, _230);
    float _240 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _242 = _238 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _232);
    float _246 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _236);
    float _248 = _240 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _254 = 1.0 / _242;
    float _256 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _258 = _252 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = _248 * _254;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _258 * _254;
    float _268 = _260 * _254;
    float _270 = _264 * _250;
    float _272 = fma(_270, 1.5, _266);
    float _274 = fma(_270, 0.5, _266);
    float _276 = fma(_270, -0.5, _266);
    float _278 = fma(_270, -1.5, _266);
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _282 = _264 * _280;
    float _284 = fma(_282, 0.5, _268);
    float _286 = fma(_282, 1.5, _268);
    float3 _859 = float3(_272, _286, float(0));
    float3 _863 = select(_859, float3(0.0), isnan(_859));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _863.xy, uint(rint(_863.z)), _264);
    float3 _870 = float3(_274, _286, float(0));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _872.xy, uint(rint(_872.z)), _264);
    float3 _879 = float3(_276, _286, float(0));
    float3 _881 = select(_879, float3(0.0), isnan(_879));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _881.xy, uint(rint(_881.z)), _264);
    float3 _888 = float3(_278, _286, float(0));
    float3 _890 = select(_888, float3(0.0), isnan(_888));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _890.xy, uint(rint(_890.z)), _264);
    float3 _897 = float3(_272, _284, float(0));
    float3 _899 = select(_897, float3(0.0), isnan(_897));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _899.xy, uint(rint(_899.z)), _264);
    float3 _906 = float3(_274, _284, float(0));
    float3 _908 = select(_906, float3(0.0), isnan(_906));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _908.xy, uint(rint(_908.z)), _264);
    float3 _915 = float3(_276, _284, float(0));
    float3 _917 = select(_915, float3(0.0), isnan(_915));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _917.xy, uint(rint(_917.z)), _264);
    float3 _924 = float3(_278, _284, float(0));
    float3 _926 = select(_924, float3(0.0), isnan(_924));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _926.xy, uint(rint(_926.z)), _264);
    float _304 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _306 = fma(_282, -1.5, _268);
    float _308 = fma(_282, -0.5, _268);
    float _310 = _194 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _312 = _194 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _314 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[13].x, _304);
    float _316 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[15].x, _310);
    float _318 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[12].x, _312);
    float _320 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].z, _314);
    float _322 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].z, _316);
    float _324 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].z, _318);
    float _326 = _320 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _328 = _322 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _330 = _324 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _332 = 1.0 / _328;
    float3 _998 = float3(_272, _308, float(0));
    float3 _1000 = select(_998, float3(0.0), isnan(_998));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1000.xy, uint(rint(_1000.z)), _264);
    float3 _1007 = float3(_274, _308, float(0));
    float3 _1009 = select(_1007, float3(0.0), isnan(_1007));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1009.xy, uint(rint(_1009.z)), _264);
    float3 _1016 = float3(_276, _308, float(0));
    float3 _1018 = select(_1016, float3(0.0), isnan(_1016));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1018.xy, uint(rint(_1018.z)), _264);
    float3 _1025 = float3(_278, _308, float(0));
    float3 _1027 = select(_1025, float3(0.0), isnan(_1025));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1027.xy, uint(rint(_1027.z)), _264);
    float _342 = _330 * _332;
    float _344 = _326 * _332;
    float2 _1039 = float2(_342, _344);
    float2 _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1039, float2(0.0), isnan(_1039))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1039, float2(0.0), isnan(_1039))).xy;
    float _350 = _348.x;
    float _352 = _348.y;
    float3 _1052 = float3(_272, _306, float(0));
    float3 _1054 = select(_1052, float3(0.0), isnan(_1052));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1054.xy, uint(rint(_1054.z)), _264);
    float3 _1061 = float3(_274, _306, float(0));
    float3 _1063 = select(_1061, float3(0.0), isnan(_1061));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1063.xy, uint(rint(_1063.z)), _264);
    float3 _1070 = float3(_276, _306, float(0));
    float3 _1072 = select(_1070, float3(0.0), isnan(_1070));
    float _358 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1072.xy, uint(rint(_1072.z)), _264);
    float3 _1079 = float3(_278, _306, float(0));
    float3 _1081 = select(_1079, float3(0.0), isnan(_1079));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1081.xy, uint(rint(_1081.z)), _264);
    float2 _1087 = float2(_52, _54);
    float _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1087, float2(0.0), isnan(_1087))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1087, float2(0.0), isnan(_1087))).x;
    float _364 = _194 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _366 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[14].x, _364);
    float _368 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].z, _366);
    float _370 = _368 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _372 = precise::min(_370, 1.0);
    float _374 = -_152;
    float _376 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _378 = _374 + _376;
    float _380 = _378 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = _288 + _290;
    float _386 = _384 + _292;
    float _388 = _386 + _294;
    float _390 = _388 + _296;
    float _392 = _390 + _298;
    float _394 = _392 + _300;
    float _396 = _394 + _302;
    float _398 = _396 + _334;
    float _400 = _398 + _336;
    float _402 = _400 + _338;
    float _404 = _402 + _340;
    float _406 = -_350;
    float _408 = fma(_406, _350, _352);
    float _410 = -_350;
    float _412 = _372 + _410;
    float _414 = _404 + _354;
    float _416 = fma(_412, _412, _408);
    float _418 = _414 + _356;
    bool _422 = _412 <= 0.001000000047497451305389404296875;
    float _424 = float(_422);
    float _426 = _418 + _358;
    float _428 = 1.0 / _416;
    float _430 = -_152;
    float _432 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _434 = _430 + _432;
    float _436 = _426 + _360;
    float _438 = _434 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = fma(_436, 0.0625, _382);
    float _444 = _408 * _428;
    float _446 = precise::max(_444, _424);
    float _448 = precise::min(_446, 1.0);
    float _450 = _440 + _448;
    out.m_45.x = _362;
    out.m_45.y = _442;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _450;
    return out;
}

