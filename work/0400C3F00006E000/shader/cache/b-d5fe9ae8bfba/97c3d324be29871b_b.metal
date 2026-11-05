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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _437 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _454 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_60;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _88;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _84;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _68 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _70, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = -_102;
    float _142 = _140 + _128;
    float _144 = fma(_120, _120, _130);
    float _146 = _134 * _134;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = _112 * _148;
    float _152 = fma(_124, _124, _144);
    float _154 = fma(_138, _138, _146);
    float _156 = _150 * _66;
    float _158 = _150 * _68;
    float _160 = fma(_142, _142, _154);
    float _162 = rsqrt(_152);
    float _164 = _156 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _166 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _164);
    float _168 = rsqrt(_160);
    float _170 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _166);
    float _172 = _120 * _162;
    float _174 = _124 * _162;
    float _176 = _116 * _162;
    float _178 = _142 * _168;
    float _180 = _134 * _168;
    float _182 = _138 * _168;
    float _184 = _172 * _178;
    float _186 = _174 * _180;
    float _188 = -_184;
    float _190 = fma(_174, _182, _188);
    float _192 = -_186;
    float _194 = fma(_176, _178, _192);
    float _196 = _176 * _182;
    float _198 = _190 * _190;
    float _200 = -_196;
    float _202 = fma(_172, _180, _200);
    float _204 = fma(_194, _194, _198);
    float _206 = fma(_202, _202, _204);
    float _208 = rsqrt(_206);
    float _210 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _212 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _210);
    float _214 = _190 * _208;
    float _216 = _194 * _208;
    float _218 = _202 * _208;
    float _220 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _212);
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _224 = _220 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _226 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].x, _222);
    float _228 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].z, _226);
    float _230 = abs(_228);
    float _232 = -_230;
    float _234 = _232 + 1.0;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = abs(_236);
    float _240 = log2(_238);
    float _242 = _240 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _244 = exp2(_242);
    float _246 = _244 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _248 = fma(_214, _246, _156);
    float _250 = fma(_216, _246, _158);
    float _252 = fma(_218, _246, _150);
    float _254 = _170 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _256 = _248 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _258 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _260 = _248 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _262 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].x, _256);
    float _264 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _258);
    float _266 = 1.0 / _254;
    float _268 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _260);
    float _270 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].z, _262);
    float _272 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _264);
    float _274 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].z, _268);
    float _276 = _270 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _278 = _248 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _280 = _248 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _282 = _274 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _284 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _286 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].x, _278);
    float _288 = 1.0 / _276;
    float _290 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
    float _292 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
    float _294 = _224 * _266;
    float _296 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].z, _290);
    float _298 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _302 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _306 = _284 * _266;
    float _308 = _282 * _288;
    float _310 = _304 * _288;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _300 * _288;
    float _316 = fma(_312, _298, _308);
    float _318 = -_298;
    float _320 = fma(_312, _318, _308);
    float _322 = fma(_312, _302, _314);
    float _324 = -_302;
    float _326 = fma(_312, _324, _314);
    float3 _908 = float3(_316, _322, float(0));
    float3 _912 = select(_908, float3(0.0), isnan(_908));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _912.xy, uint(rint(_912.z)), _312);
    float3 _919 = float3(_308, _322, float(0));
    float3 _921 = select(_919, float3(0.0), isnan(_919));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _921.xy, uint(rint(_921.z)), _312);
    float3 _928 = float3(_320, _322, float(0));
    float3 _930 = select(_928, float3(0.0), isnan(_928));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _930.xy, uint(rint(_930.z)), _312);
    float3 _937 = float3(_316, _314, float(0));
    float3 _939 = select(_937, float3(0.0), isnan(_937));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _939.xy, uint(rint(_939.z)), _312);
    float2 _945 = float2(_306, _294);
    float2 _338 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_945, float2(0.0), isnan(_945))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_945, float2(0.0), isnan(_945))).xy;
    float _340 = _338.x;
    float _342 = _338.y;
    float3 _958 = float3(_308, _314, float(0));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _960.xy, uint(rint(_960.z)), _312);
    float3 _967 = float3(_320, _314, float(0));
    float3 _969 = select(_967, float3(0.0), isnan(_967));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _969.xy, uint(rint(_969.z)), _312);
    float3 _976 = float3(_316, _326, float(0));
    float3 _978 = select(_976, float3(0.0), isnan(_976));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _978.xy, uint(rint(_978.z)), _312);
    float3 _985 = float3(_308, _326, float(0));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _987.xy, uint(rint(_987.z)), _312);
    float3 _994 = float3(_320, _326, float(0));
    float3 _996 = select(_994, float3(0.0), isnan(_994));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _996.xy, uint(rint(_996.z)), _312);
    float _354 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _356 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _354);
    float _358 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _362 = -_150;
    float _364 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _366 = _362 + _364;
    float _368 = _366 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _328 + _330;
    float _374 = _372 + _332;
    float _376 = precise::min(_360, 1.0);
    float _378 = -_340;
    float _380 = fma(_378, _340, _342);
    float _382 = -_340;
    float _384 = _376 + _382;
    float _386 = _374 + _334;
    float _388 = -_150;
    float _390 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _392 = _388 + _390;
    float _394 = fma(_384, _384, _380);
    float _396 = _386 + _344;
    bool _400 = _384 <= 0.001000000047497451305389404296875;
    float _402 = float(_400);
    float _404 = _392 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = 1.0 / _394;
    float _410 = _396 + _346;
    float _412 = _410 + _348;
    float _414 = _412 + _350;
    float _416 = _380 * _408;
    float _418 = precise::max(_416, _402);
    float _420 = _414 + _352;
    float _422 = precise::min(_418, 1.0);
    float _424 = fma(_420, 0.111111111938953399658203125, _406);
    float _426 = _370 + _422;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _424;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _426;
    return out;
}

