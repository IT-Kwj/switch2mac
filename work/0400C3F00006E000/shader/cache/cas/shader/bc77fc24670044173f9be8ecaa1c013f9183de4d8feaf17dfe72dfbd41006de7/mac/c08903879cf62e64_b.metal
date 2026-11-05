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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
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
    float2 _422 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _439 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _84;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _70 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _68, _114);
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
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = _112 * _148;
    float _152 = fma(_124, _124, _140);
    float _154 = fma(_138, _138, _146);
    float _156 = _150 * _66;
    float _158 = _150 * _70;
    float _160 = fma(_144, _144, _154);
    float _162 = rsqrt(_152);
    float _164 = _156 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _166 = rsqrt(_160);
    float _168 = _120 * _162;
    float _170 = _124 * _162;
    float _172 = _116 * _162;
    float _174 = _144 * _166;
    float _176 = _134 * _166;
    float _178 = _138 * _166;
    float _180 = _168 * _174;
    float _182 = _170 * _176;
    float _184 = -_180;
    float _186 = fma(_170, _178, _184);
    float _188 = -_182;
    float _190 = fma(_172, _174, _188);
    float _192 = _172 * _178;
    float _194 = _186 * _186;
    float _196 = -_192;
    float _198 = fma(_168, _176, _196);
    float _200 = fma(_190, _190, _194);
    float _202 = fma(_198, _198, _200);
    float _204 = rsqrt(_202);
    float _206 = _186 * _204;
    float _208 = _190 * _204;
    float _210 = _198 * _204;
    float _212 = _206 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _214 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].x, _212);
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].z, _214);
    float _218 = abs(_216);
    float _220 = -_218;
    float _222 = _220 + 1.0;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = abs(_224);
    float _228 = log2(_226);
    float _230 = _228 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _232 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _234 = exp2(_230);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = fma(_206, _236, _156);
    float _240 = fma(_208, _236, _158);
    float _242 = fma(_210, _236, _150);
    float _244 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _164);
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _246);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].z, _252);
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _254);
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _262 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _264 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _266 = 1.0 / _260;
    float _268 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _262);
    float _270 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _264);
    float _272 = _250 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _274 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _276 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _278 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].z, _270);
    float _280 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _282 = 1.0 / _272;
    float _284 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _274);
    float _286 = _278 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _288 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _280);
    float _290 = _258 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _292 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _284);
    float _294 = _276 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _296 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _288);
    float _298 = _286 * _266;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _292 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _304 = _290 * _266;
    float _306 = _296 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _308 = rint(_300);
    float _310 = precise::max(_308, 0.0);
    uint _313 = uint(_310);
    uint _315 = clamp(_313, 0u, 65535u);
    float _317 = _294 * _266;
    float _319 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _321 = fma(_232, -0.5, _304);
    float _323 = _306 * _282;
    float _325 = _302 * _282;
    float _327 = fma(_232, 0.5, _304);
    float _329 = fma(_319, -0.5, _317);
    float _331 = fma(_319, 0.5, _317);
    float2 _896 = float2(_323, _325);
    float2 _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_896, float2(0.0), isnan(_896))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_896, float2(0.0), isnan(_896))).xy;
    float _337 = _335.x;
    float _339 = _335.y;
    float3 _911 = float3(_327, _331, float(int(_315)));
    float3 _915 = select(_911, float3(0.0), isnan(_911));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _915.xy, uint(rint(_915.z)), 1.0);
    float3 _923 = float3(_321, _331, float(int(_315)));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _925.xy, uint(rint(_925.z)), 1.0);
    float3 _933 = float3(_327, _329, float(int(_315)));
    float3 _935 = select(_933, float3(0.0), isnan(_933));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _935.xy, uint(rint(_935.z)), 1.0);
    float3 _943 = float3(_321, _329, float(int(_315)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _945.xy, uint(rint(_945.z)), 1.0);
    float _349 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _351 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _349);
    float _353 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _351);
    float _355 = _353 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _357 = precise::min(_355, 1.0);
    float _359 = -_337;
    float _361 = fma(_359, _337, _339);
    float _363 = -_337;
    float _365 = _357 + _363;
    float _367 = -_150;
    float _369 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _371 = _367 + _369;
    float _373 = fma(_365, _365, _361);
    bool _377 = _365 <= 0.001000000047497451305389404296875;
    float _379 = float(_377);
    float _381 = _371 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = 1.0 / _373;
    float _387 = _341 + _343;
    float _389 = -_150;
    float _391 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _393 = _389 + _391;
    float _395 = _387 + _345;
    float _397 = _393 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = _361 * _385;
    float _403 = precise::max(_401, _379);
    float _405 = _395 + _347;
    float _407 = precise::min(_403, 1.0);
    float _409 = fma(_405, 0.25, _383);
    float _411 = _399 + _407;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _409;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _411;
    return out;
}

