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
    float2 _421 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _438 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _66 * _82;
    float _98 = _68 * _82;
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_96;
    float _108 = fma(_88, _70, _106);
    float _110 = -_96;
    float _112 = fma(_94, _72, _110);
    float _114 = -_98;
    float _116 = fma(_88, _74, _114);
    float _118 = -_98;
    float _120 = fma(_94, _76, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_82;
    float _128 = _126 + _88;
    float _130 = -_82;
    float _132 = _130 + _94;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = _104 * _66;
    float _140 = _104 * _68;
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_132, _132, _136);
    float _146 = _138 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _148 = rsqrt(_142);
    float _150 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[15].x, _146);
    float _152 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _150);
    float _154 = rsqrt(_144);
    float _156 = _116 * _148;
    float _158 = _128 * _148;
    float _160 = _108 * _148;
    float _162 = _132 * _154;
    float _164 = _112 * _154;
    float _166 = _120 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = -_168;
    float _174 = fma(_158, _166, _172);
    float _176 = -_170;
    float _178 = fma(_160, _162, _176);
    float _180 = _160 * _166;
    float _182 = _174 * _174;
    float _184 = -_180;
    float _186 = fma(_156, _164, _184);
    float _188 = fma(_178, _178, _182);
    float _190 = fma(_186, _186, _188);
    float _192 = rsqrt(_190);
    float _194 = _138 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _196 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _194);
    float _198 = _174 * _192;
    float _200 = _178 * _192;
    float _202 = _186 * _192;
    float _204 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _196);
    float _206 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _208 = _204 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _210 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].x, _206);
    float _212 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].z, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = abs(_220);
    float _224 = log2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _228 = _152 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _230 = _138 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _232 = exp2(_226);
    float _234 = 1.0 / _228;
    float _236 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = fma(_198, _236, _138);
    float _240 = fma(_200, _236, _140);
    float _242 = fma(_202, _236, _104);
    float _244 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[12].x, _230);
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = _208 * _234;
    float _252 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _244);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _246);
    float _256 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _258 = _252 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _260 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].z, _254);
    float _262 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _264 = _258 * _234;
    float _266 = _260 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _268 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _270 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _272 = _262 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _274 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _268);
    float _276 = 1.0 / _266;
    float _278 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _270);
    float _280 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _282 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].z, _278);
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _286 = _280 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _288 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _290 = _282 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _292 = _272 * _276;
    float _294 = _290 * _276;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _286 * _276;
    float _300 = fma(_296, _284, _292);
    float _302 = -_284;
    float _304 = fma(_296, _302, _292);
    float _306 = fma(_296, _288, _298);
    float _308 = -_288;
    float _310 = fma(_296, _308, _298);
    float3 _876 = float3(_300, _306, float(0));
    float3 _880 = select(_876, float3(0.0), isnan(_876));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _880.xy, uint(rint(_880.z)), _296);
    float3 _887 = float3(_292, _306, float(0));
    float3 _889 = select(_887, float3(0.0), isnan(_887));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _889.xy, uint(rint(_889.z)), _296);
    float3 _896 = float3(_304, _306, float(0));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _898.xy, uint(rint(_898.z)), _296);
    float3 _905 = float3(_300, _298, float(0));
    float3 _907 = select(_905, float3(0.0), isnan(_905));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _907.xy, uint(rint(_907.z)), _296);
    float2 _913 = float2(_264, _250);
    float2 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_913, float2(0.0), isnan(_913))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_913, float2(0.0), isnan(_913))).xy;
    float _324 = _322.x;
    float _326 = _322.y;
    float3 _926 = float3(_292, _298, float(0));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _928.xy, uint(rint(_928.z)), _296);
    float3 _935 = float3(_304, _298, float(0));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _937.xy, uint(rint(_937.z)), _296);
    float3 _944 = float3(_300, _310, float(0));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _946.xy, uint(rint(_946.z)), _296);
    float3 _953 = float3(_292, _310, float(0));
    float3 _955 = select(_953, float3(0.0), isnan(_953));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _955.xy, uint(rint(_955.z)), _296);
    float3 _962 = float3(_304, _310, float(0));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _964.xy, uint(rint(_964.z)), _296);
    float _338 = _138 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _340 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[14].x, _338);
    float _342 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _340);
    float _344 = _342 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _346 = -_104;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _350 = _346 + _348;
    float _352 = _350 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _312 + _314;
    float _358 = _356 + _316;
    float _360 = precise::min(_344, 1.0);
    float _362 = -_324;
    float _364 = fma(_362, _324, _326);
    float _366 = -_324;
    float _368 = _360 + _366;
    float _370 = _358 + _318;
    float _372 = -_104;
    float _374 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _376 = _372 + _374;
    float _378 = fma(_368, _368, _364);
    float _380 = _370 + _328;
    bool _384 = _368 <= 0.001000000047497451305389404296875;
    float _386 = float(_384);
    float _388 = _376 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = 1.0 / _378;
    float _394 = _380 + _330;
    float _396 = _394 + _332;
    float _398 = _396 + _334;
    float _400 = _364 * _392;
    float _402 = precise::max(_400, _386);
    float _404 = _398 + _336;
    float _406 = precise::min(_402, 1.0);
    float _408 = fma(_404, 0.111111111938953399658203125, _390);
    float _410 = _354 + _406;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _408;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _410;
    return out;
}

