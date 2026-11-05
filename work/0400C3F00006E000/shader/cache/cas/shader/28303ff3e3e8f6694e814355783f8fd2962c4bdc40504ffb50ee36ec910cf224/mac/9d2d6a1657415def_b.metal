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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _402 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _419 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_419, float2(0.0), isnan(_419))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _72 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _70, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = _116 * _150;
    float _156 = _120 * _150;
    float _158 = _112 * _150;
    float _160 = _140 * _152;
    float _162 = _130 * _152;
    float _164 = _134 * _152;
    float _166 = _154 * _160;
    float _168 = _156 * _162;
    float _170 = -_166;
    float _172 = fma(_156, _164, _170);
    float _174 = _158 * _164;
    float _176 = -_168;
    float _178 = fma(_158, _160, _176);
    float _180 = _172 * _172;
    float _182 = -_174;
    float _184 = fma(_154, _162, _182);
    float _186 = fma(_178, _178, _180);
    float _188 = fma(_184, _184, _186);
    float _190 = rsqrt(_188);
    float _192 = _172 * _190;
    float _194 = _178 * _190;
    float _196 = _184 * _190;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = -_66;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _220 = 1.0 / _218;
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _228 = _220 * _226;
    float _230 = _228 * _68;
    float _232 = _228 * _72;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _238 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[15].x, _234);
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[12].x, _236);
    float _242 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _244 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[15].z, _238);
    float _246 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[12].z, _240);
    float _248 = fma(_192, _242, _230);
    float _250 = fma(_194, _242, _232);
    float _252 = _244 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = fma(_196, _242, _228);
    float _256 = _248 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _258 = _230 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _260 = _248 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _262 = _248 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _264 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].x, _256);
    float _266 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[13].x, _258);
    float _268 = 1.0 / _252;
    float _270 = _248 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _272 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].z, _264);
    float _274 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _276 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[13].z, _266);
    float _278 = _246 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _282 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
    float _284 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _262);
    float _286 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _288 = 1.0 / _280;
    float _290 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, _282);
    float _292 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
    float _294 = _276 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _296 = _286 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _302 = _294 * _268;
    float _304 = _278 * _268;
    float _306 = _300 * _288;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _298 * _288;
    float _312 = _296 * _288;
    float2 _840 = float2(_304, _302);
    float2 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_840, float2(0.0), isnan(_840))).xy;
    float _318 = _316.x;
    float _320 = _316.y;
    float _322 = rint(_308);
    float _324 = precise::max(_322, 0.0);
    uint _327 = uint(_324);
    uint _329 = clamp(_327, 0u, 65535u);
    float3 _865 = float3(_310, _312, float(int(_329)));
    float3 _869 = select(_865, float3(0.0), isnan(_865));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _869.xy, uint(rint(_869.z)), 1.0);
    float2 _874 = float2(_52, _54);
    float _333 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_874, float2(0.0), isnan(_874))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_874, float2(0.0), isnan(_874))).x;
    float _335 = _230 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _337 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[14].x, _335);
    float _339 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[14].z, _337);
    float _341 = _339 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _343 = precise::min(_341, 1.0);
    float _345 = -_228;
    float _347 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _349 = _345 + _347;
    float _351 = -_228;
    float _353 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _355 = _351 + _353;
    float _357 = _349 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _355 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = -_318;
    float _367 = fma(_365, _318, _320);
    float _369 = -_318;
    float _371 = _343 + _369;
    float _373 = fma(_371, _371, _367);
    bool _377 = _371 <= 0.001000000047497451305389404296875;
    float _379 = float(_377);
    float _381 = 1.0 / _373;
    float _383 = _359 + _331;
    float _385 = _367 * _381;
    float _387 = precise::max(_385, _379);
    float _389 = precise::min(_387, 1.0);
    float _391 = _363 + _389;
    out.m_45.x = _333;
    out.m_45.y = _383;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _391;
    return out;
}

