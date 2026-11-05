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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _481 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _498 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = -_158;
    float _166 = fma(_148, _150, _164);
    float _168 = _148 * _154;
    float _170 = _162 * _162;
    float _172 = -_168;
    float _174 = fma(_144, _152, _172);
    float _176 = fma(_166, _166, _170);
    float _178 = fma(_174, _174, _176);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _166 * _180;
    float _186 = _174 * _180;
    float _188 = -_68;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[46].z, _190);
    float _194 = _182 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _196 = _192 * _70;
    float _198 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].x, _194);
    float _200 = _192 * _72;
    float _202 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _218 = exp2(_216);
    float _220 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _222 = fma(_182, _220, _196);
    float _224 = fma(_184, _220, _200);
    float _226 = fma(_186, _220, _192);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _232 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _236 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _230);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _234);
    float _242 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _238);
    float _244 = _240 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _246 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _236);
    float _248 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _232);
    float _250 = _242 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _252 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _246);
    float _254 = 1.0 / _244;
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _262 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _264 = _256 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _266 = _250 * _254;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _260 * _254;
    float _272 = _264 * _254;
    float _274 = _268 * _258;
    float _276 = fma(_274, 1.5, _270);
    float _278 = fma(_274, 0.5, _270);
    float _280 = fma(_274, -0.5, _270);
    float _282 = fma(_274, -1.5, _270);
    float _284 = _268 * _262;
    float _286 = fma(_284, 1.5, _272);
    float _288 = fma(_284, 0.5, _272);
    float3 _879 = float3(_276, _286, float(0));
    float3 _883 = select(_879, float3(0.0), isnan(_879));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _883.xy, uint(rint(_883.z)), _268);
    float3 _890 = float3(_278, _286, float(0));
    float3 _892 = select(_890, float3(0.0), isnan(_890));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _892.xy, uint(rint(_892.z)), _268);
    float3 _899 = float3(_280, _286, float(0));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _901.xy, uint(rint(_901.z)), _268);
    float3 _908 = float3(_282, _286, float(0));
    float3 _910 = select(_908, float3(0.0), isnan(_908));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _910.xy, uint(rint(_910.z)), _268);
    float3 _917 = float3(_276, _288, float(0));
    float3 _919 = select(_917, float3(0.0), isnan(_917));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _919.xy, uint(rint(_919.z)), _268);
    float3 _926 = float3(_278, _288, float(0));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _928.xy, uint(rint(_928.z)), _268);
    float3 _935 = float3(_280, _288, float(0));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _937.xy, uint(rint(_937.z)), _268);
    float _304 = _196 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _306 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _308 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].x, _304);
    float _310 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[13].x, _306);
    float _312 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[15].z, _308);
    float _314 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].z, _310);
    float _316 = _312 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _318 = fma(_284, -0.5, _272);
    float _320 = fma(_284, -1.5, _272);
    float3 _984 = float3(_282, _288, float(0));
    float3 _986 = select(_984, float3(0.0), isnan(_984));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _986.xy, uint(rint(_986.z)), _268);
    float _324 = _196 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _326 = 1.0 / _316;
    float _328 = _290 + _292;
    float _330 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[12].x, _324);
    float _332 = _314 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _334 = _328 + _294;
    float _336 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[12].z, _330);
    float _338 = _332 * _326;
    float _340 = _334 + _296;
    float _342 = _336 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _344 = _340 + _298;
    float _346 = _342 * _326;
    float2 _1035 = float2(_54, _56);
    float2 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1035, float2(0.0), isnan(_1035))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1035, float2(0.0), isnan(_1035))).xy;
    float _352 = _350.x;
    float _354 = _350.y;
    float _356 = _344 + _300;
    float _358 = _356 + _302;
    float3 _1054 = float3(_276, _318, float(0));
    float3 _1056 = select(_1054, float3(0.0), isnan(_1054));
    float _360 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1056.xy, uint(rint(_1056.z)), _268);
    float3 _1063 = float3(_278, _318, float(0));
    float3 _1065 = select(_1063, float3(0.0), isnan(_1063));
    float _362 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1065.xy, uint(rint(_1065.z)), _268);
    float3 _1072 = float3(_280, _318, float(0));
    float3 _1074 = select(_1072, float3(0.0), isnan(_1072));
    float _364 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1074.xy, uint(rint(_1074.z)), _268);
    float3 _1081 = float3(_282, _318, float(0));
    float3 _1083 = select(_1081, float3(0.0), isnan(_1081));
    float _366 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1083.xy, uint(rint(_1083.z)), _268);
    float _368 = _358 + _322;
    float2 _1092 = float2(_346, _338);
    float2 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1092, float2(0.0), isnan(_1092))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1092, float2(0.0), isnan(_1092))).xy;
    float _372 = _370.x;
    float _374 = _370.y;
    float _376 = fma(_352, 2.0, -1.0);
    float _378 = fma(_354, 2.0, -1.0);
    float _380 = _376 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _382 = _378 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _384 = fma(_380, 2.0, _54);
    float _386 = fma(_382, 2.0, _56);
    float3 _1126 = float3(_276, _320, float(0));
    float3 _1128 = select(_1126, float3(0.0), isnan(_1126));
    float _388 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1128.xy, uint(rint(_1128.z)), _268);
    float3 _1135 = float3(_278, _320, float(0));
    float3 _1137 = select(_1135, float3(0.0), isnan(_1135));
    float _390 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1137.xy, uint(rint(_1137.z)), _268);
    float3 _1144 = float3(_280, _320, float(0));
    float3 _1146 = select(_1144, float3(0.0), isnan(_1144));
    float _392 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1146.xy, uint(rint(_1146.z)), _268);
    float3 _1153 = float3(_282, _320, float(0));
    float3 _1155 = select(_1153, float3(0.0), isnan(_1153));
    float _394 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1155.xy, uint(rint(_1155.z)), _268);
    float2 _1161 = float2(_384, _386);
    float _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1161, float2(0.0), isnan(_1161))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1161, float2(0.0), isnan(_1161))).x;
    float _398 = _196 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _400 = _368 + _360;
    float _402 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[14].x, _398);
    float _404 = -_372;
    float _406 = fma(_404, _372, _374);
    float _408 = _400 + _362;
    float _410 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[14].z, _402);
    float _412 = _408 + _364;
    float _414 = _410 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _416 = _412 + _366;
    float _418 = precise::min(_414, 1.0);
    float _420 = -_372;
    float _422 = _418 + _420;
    float _424 = -_192;
    float _426 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _428 = _424 + _426;
    float _430 = fma(_422, _422, _406);
    bool _434 = _422 <= 0.001000000047497451305389404296875;
    float _436 = float(_434);
    float _438 = _428 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = 1.0 / _430;
    float _444 = _406 * _442;
    float _446 = precise::max(_444, _436);
    float _448 = precise::min(_446, 1.0);
    float _450 = _416 + _388;
    float _452 = _450 + _390;
    float _454 = _452 + _392;
    float _456 = -_192;
    float _458 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _460 = _456 + _458;
    float _462 = _454 + _394;
    float _464 = _460 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = fma(_462, 0.0625, _440);
    float _470 = _466 + _448;
    out.m_47.x = _396;
    out.m_47.y = _468;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _470;
    return out;
}

