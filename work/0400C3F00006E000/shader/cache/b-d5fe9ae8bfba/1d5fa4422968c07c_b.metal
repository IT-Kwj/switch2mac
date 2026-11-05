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
    float2 _425 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _442 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).x;
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
    float _148 = _128 * _140;
    float _150 = _108 * _140;
    float _152 = _116 * _140;
    float _154 = _142 * _148;
    float _156 = _144 * _150;
    float _158 = -_154;
    float _160 = fma(_144, _152, _158);
    float _162 = _146 * _152;
    float _164 = -_156;
    float _166 = fma(_146, _148, _164);
    float _168 = _160 * _160;
    float _170 = -_162;
    float _172 = fma(_142, _150, _170);
    float _174 = fma(_166, _166, _168);
    float _176 = fma(_172, _172, _174);
    float _178 = rsqrt(_176);
    float _180 = _160 * _178;
    float _182 = _166 * _178;
    float _184 = _172 * _178;
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[35].x, _186);
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].z, _188);
    float _192 = abs(_190);
    float _194 = -_192;
    float _196 = _194 + 1.0;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = abs(_198);
    float _202 = log2(_200);
    float _204 = _202 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _206 = exp2(_204);
    float _208 = -_66;
    float _210 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _212 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[46].z, _210);
    float _214 = _212 * _68;
    float _216 = _212 * _70;
    float _218 = _214 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _220 = _206 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _222 = fma(_180, _220, _214);
    float _224 = fma(_182, _220, _216);
    float _226 = fma(_184, _220, _212);
    float _228 = _214 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _232 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _234 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _236 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _230);
    float _240 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _232);
    float _242 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _234);
    float _244 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[15].z, _236);
    float _246 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _238);
    float _248 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _240);
    float _250 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _242);
    float _252 = _244 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = _246 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _256 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _258 = _248 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _260 = _250 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = _214 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _264 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _256);
    float _266 = 1.0 / _254;
    float _268 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[12].x, _262);
    float _270 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _264);
    float _272 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[12].z, _268);
    float _274 = _270 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _276 = 1.0 / _252;
    float _278 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _282 = _258 * _266;
    float _284 = _274 * _266;
    float _286 = _260 * _266;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[13].x, _218);
    float _292 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _294 = fma(_288, _278, _282);
    float _296 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[13].z, _290);
    float _298 = fma(_288, _292, _284);
    float _300 = _296 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _862 = float3(_294, _298, float(0));
    float3 _866 = select(_862, float3(0.0), isnan(_862));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _866.xy, uint(rint(_866.z)), _288);
    float _304 = -_292;
    float _306 = fma(_288, _304, _284);
    float _308 = _280 * _276;
    float _310 = _300 * _276;
    float _312 = -_278;
    float _314 = fma(_288, _312, _282);
    float3 _891 = float3(_282, _298, float(0));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _893.xy, uint(rint(_893.z)), _288);
    float3 _900 = float3(_314, _298, float(0));
    float3 _902 = select(_900, float3(0.0), isnan(_900));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _902.xy, uint(rint(_902.z)), _288);
    float3 _909 = float3(_294, _284, float(0));
    float3 _911 = select(_909, float3(0.0), isnan(_909));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _911.xy, uint(rint(_911.z)), _288);
    float3 _918 = float3(_282, _284, float(0));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _920.xy, uint(rint(_920.z)), _288);
    float2 _926 = float2(_308, _310);
    float2 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_926, float2(0.0), isnan(_926))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_926, float2(0.0), isnan(_926))).xy;
    float _328 = _326.x;
    float _330 = _326.y;
    float3 _939 = float3(_314, _284, float(0));
    float3 _941 = select(_939, float3(0.0), isnan(_939));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _941.xy, uint(rint(_941.z)), _288);
    float3 _948 = float3(_294, _306, float(0));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _950.xy, uint(rint(_950.z)), _288);
    float3 _957 = float3(_282, _306, float(0));
    float3 _959 = select(_957, float3(0.0), isnan(_957));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _959.xy, uint(rint(_959.z)), _288);
    float3 _966 = float3(_314, _306, float(0));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _968.xy, uint(rint(_968.z)), _288);
    float2 _974 = float2(_52, _54);
    float _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_974, float2(0.0), isnan(_974))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_974, float2(0.0), isnan(_974))).x;
    float _342 = _214 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _344 = -_212;
    float _346 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _348 = _344 + _346;
    float _350 = -_212;
    float _352 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _354 = _350 + _352;
    float _356 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[14].x, _342);
    float _358 = _348 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = _354 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[14].z, _356);
    float _368 = _366 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _370 = precise::min(_368, 1.0);
    float _372 = _302 + _316;
    float _374 = _372 + _318;
    float _376 = _374 + _320;
    float _378 = -_328;
    float _380 = fma(_378, _328, _330);
    float _382 = -_328;
    float _384 = _370 + _382;
    float _386 = _376 + _322;
    float _388 = fma(_384, _384, _380);
    bool _392 = _384 <= 0.001000000047497451305389404296875;
    float _394 = float(_392);
    float _396 = 1.0 / _388;
    float _398 = _386 + _332;
    float _400 = _398 + _334;
    float _402 = _380 * _396;
    float _404 = _400 + _336;
    float _406 = precise::max(_402, _394);
    float _408 = _404 + _338;
    float _410 = precise::min(_406, 1.0);
    float _412 = fma(_408, 0.111111111938953399658203125, _360);
    float _414 = _364 + _410;
    out.m_45.x = _340;
    out.m_45.y = _412;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _414;
    return out;
}

