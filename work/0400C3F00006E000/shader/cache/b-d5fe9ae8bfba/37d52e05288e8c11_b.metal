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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
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
    float2 _430 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _447 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).x;
    float2 _455 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_455, float2(0.0), isnan(_455))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_42.y;
    float _82 = in.m_40.x;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _78 * _94;
    float _104 = _82 * _94;
    float _106 = -_102;
    float _108 = fma(_100, _80, _106);
    float _110 = -_66;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[46].z, _112);
    float _116 = -_104;
    float _118 = fma(_100, _86, _116);
    float _120 = -_94;
    float _122 = _120 + _100;
    float _124 = _108 * _108;
    float _126 = -_102;
    float _128 = fma(_114, _84, _126);
    float _130 = -_104;
    float _132 = fma(_114, _88, _130);
    float _134 = -_94;
    float _136 = _134 + _114;
    float _138 = fma(_118, _118, _124);
    float _140 = _128 * _128;
    float _142 = fma(_122, _122, _138);
    float _144 = fma(_132, _132, _140);
    float _146 = fma(_136, _136, _144);
    float _148 = rsqrt(_142);
    float _150 = rsqrt(_146);
    float _152 = _118 * _148;
    float _154 = _122 * _148;
    float _156 = _108 * _148;
    float _158 = _136 * _150;
    float _160 = _132 * _150;
    float _162 = _128 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _162;
    float _168 = -_164;
    float _170 = fma(_154, _160, _168);
    float _172 = _156 * _160;
    float _174 = -_166;
    float _176 = fma(_156, _158, _174);
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_152, _162, _180);
    float _184 = fma(_176, _176, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _176 * _188;
    float _194 = _182 * _188;
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _216 = exp2(_214);
    float _218 = -_68;
    float _220 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _222 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[46].z, _220);
    float _224 = _222 * _78;
    float _226 = _222 * _82;
    float _228 = _224 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _232 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[15].z, _230);
    float _236 = fma(_190, _232, _224);
    float _238 = fma(_192, _232, _226);
    float _240 = fma(_194, _232, _222);
    float _242 = _234 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _246 = _224 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _248 = _224 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _250 = 1.0 / _242;
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _244);
    float _254 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[12].x, _246);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[13].x, _248);
    float _258 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _260 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].z, _252);
    float _262 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[12].z, _254);
    float _264 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[13].z, _256);
    float _266 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _258);
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _270 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _272 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _274 = _262 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _276 = 1.0 / _268;
    float _278 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
    float _280 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
    float _282 = _264 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _284 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].z, _266);
    float _286 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].z, _278);
    float _288 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
    float _290 = _274 * _250;
    float _292 = _282 * _250;
    float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _298 = _284 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _300 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _302 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _304 = _294 * _276;
    float _306 = fma(_74, 2.0, -1.0);
    float _308 = _296 * _276;
    float _310 = fma(_76, 2.0, -1.0);
    float _312 = _298 * _276;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = fma(_300, 0.5, _304);
    float _318 = fma(_300, -0.5, _304);
    float _320 = _306 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _322 = _310 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _324 = fma(_302, 0.5, _308);
    float _326 = fma(_302, -0.5, _308);
    float _328 = rint(_314);
    float _330 = precise::max(_328, 0.0);
    uint _333 = uint(_330);
    uint _335 = clamp(_333, 0u, 65535u);
    float2 _915 = float2(_290, _292);
    float2 _337 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_915, float2(0.0), isnan(_915))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_915, float2(0.0), isnan(_915))).xy;
    float _339 = _337.x;
    float _341 = _337.y;
    float _343 = fma(_322, 2.0, _56);
    float _345 = fma(_320, 2.0, _54);
    float3 _936 = float3(_316, _324, float(int(_335)));
    float3 _940 = select(_936, float3(0.0), isnan(_936));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _940.xy, uint(rint(_940.z)), 1.0);
    float3 _948 = float3(_318, _324, float(int(_335)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _950.xy, uint(rint(_950.z)), 1.0);
    float3 _958 = float3(_316, _326, float(int(_335)));
    float3 _960 = select(_958, float3(0.0), isnan(_958));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _960.xy, uint(rint(_960.z)), 1.0);
    float3 _968 = float3(_318, _326, float(int(_335)));
    float3 _970 = select(_968, float3(0.0), isnan(_968));
    float _353 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _970.xy, uint(rint(_970.z)), 1.0);
    float2 _975 = float2(_345, _343);
    float _355 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_975, float2(0.0), isnan(_975))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_975, float2(0.0), isnan(_975))).x;
    float _357 = _224 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _359 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[14].x, _357);
    float _361 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[14].z, _359);
    float _363 = _361 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _365 = precise::min(_363, 1.0);
    float _367 = -_222;
    float _369 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _371 = _367 + _369;
    float _373 = -_222;
    float _375 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _377 = _373 + _375;
    float _379 = _371 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _377 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = -_339;
    float _389 = fma(_387, _339, _341);
    float _391 = -_339;
    float _393 = _365 + _391;
    float _395 = fma(_393, _393, _389);
    bool _399 = _393 <= 0.001000000047497451305389404296875;
    float _401 = float(_399);
    float _403 = 1.0 / _395;
    float _405 = _347 + _349;
    float _407 = _389 * _403;
    float _409 = _405 + _351;
    float _411 = precise::max(_407, _401);
    float _413 = _409 + _353;
    float _415 = precise::min(_411, 1.0);
    float _417 = fma(_413, 0.25, _381);
    float _419 = _385 + _415;
    out.m_47.x = _355;
    out.m_47.y = _417;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _419;
    return out;
}

