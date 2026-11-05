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
    float2 _442 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _459 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).x;
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
    float _166 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _168 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _166);
    float _170 = rsqrt(_160);
    float _172 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _168);
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _176 = _120 * _162;
    float _178 = _124 * _162;
    float _180 = _116 * _162;
    float _182 = _144 * _170;
    float _184 = _134 * _170;
    float _186 = _138 * _170;
    float _188 = _176 * _182;
    float _190 = _178 * _184;
    float _192 = -_188;
    float _194 = fma(_178, _186, _192);
    float _196 = -_190;
    float _198 = fma(_180, _182, _196);
    float _200 = _180 * _186;
    float _202 = _194 * _194;
    float _204 = -_200;
    float _206 = fma(_176, _184, _204);
    float _208 = fma(_198, _198, _202);
    float _210 = fma(_206, _206, _208);
    float _212 = rsqrt(_210);
    float _214 = _194 * _212;
    float _216 = _198 * _212;
    float _218 = _206 * _212;
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _222 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].x, _220);
    float _224 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].z, _222);
    float _226 = abs(_224);
    float _228 = -_226;
    float _230 = _228 + 1.0;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = abs(_232);
    float _236 = log2(_234);
    float _238 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _240 = exp2(_238);
    float _242 = _240 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _244 = fma(_214, _242, _156);
    float _246 = fma(_216, _242, _158);
    float _248 = fma(_218, _242, _150);
    float _250 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _164);
    float _252 = _244 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _254 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _250);
    float _256 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].x, _252);
    float _258 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _260 = _254 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].z, _256);
    float _264 = _244 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _266 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _258);
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _270 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].x, _264);
    float _272 = _244 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _274 = _244 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _276 = 1.0 / _268;
    float _278 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].z, _270);
    float _280 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
    float _282 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
    float _284 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _266);
    float _286 = _278 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _288 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
    float _290 = 1.0 / _260;
    float _292 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
    float _294 = _284 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _298 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _300 = _286 * _276;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = _296 * _276;
    float _306 = _298 * _276;
    float _308 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _304);
    float _310 = rint(_302);
    float _312 = precise::max(_310, 0.0);
    uint _315 = uint(_312);
    uint _317 = clamp(_315, 0u, 65535u);
    float _319 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _306);
    float _321 = _294 * _290;
    float _323 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _325 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _323, _306);
    float _327 = _174 * _290;
    float _329 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _331 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _329, _304);
    float3 _923 = float3(_306, _308, float(int(_317)));
    float3 _927 = select(_923, float3(0.0), isnan(_923));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _927.xy, uint(rint(_927.z)), 1.0);
    float3 _935 = float3(_319, _308, float(int(_317)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _937.xy, uint(rint(_937.z)), 1.0);
    float3 _945 = float3(_325, _308, float(int(_317)));
    float3 _947 = select(_945, float3(0.0), isnan(_945));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _947.xy, uint(rint(_947.z)), 1.0);
    float3 _955 = float3(_319, _304, float(int(_317)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _957.xy, uint(rint(_957.z)), 1.0);
    float2 _962 = float2(_321, _327);
    float2 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_962, float2(0.0), isnan(_962))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_962, float2(0.0), isnan(_962))).xy;
    float _345 = _343.x;
    float _347 = _343.y;
    float3 _977 = float3(_306, _304, float(int(_317)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _979.xy, uint(rint(_979.z)), 1.0);
    float3 _987 = float3(_325, _304, float(int(_317)));
    float3 _989 = select(_987, float3(0.0), isnan(_987));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _989.xy, uint(rint(_989.z)), 1.0);
    float3 _997 = float3(_319, _331, float(int(_317)));
    float3 _999 = select(_997, float3(0.0), isnan(_997));
    float _353 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _999.xy, uint(rint(_999.z)), 1.0);
    float3 _1007 = float3(_306, _331, float(int(_317)));
    float3 _1009 = select(_1007, float3(0.0), isnan(_1007));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1009.xy, uint(rint(_1009.z)), 1.0);
    float3 _1017 = float3(_325, _331, float(int(_317)));
    float3 _1019 = select(_1017, float3(0.0), isnan(_1017));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1019.xy, uint(rint(_1019.z)), 1.0);
    float _359 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _361 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _359);
    float _363 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _361);
    float _365 = _363 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _367 = precise::min(_365, 1.0);
    float _369 = -_345;
    float _371 = fma(_369, _345, _347);
    float _373 = -_345;
    float _375 = _367 + _373;
    float _377 = _335 + _333;
    float _379 = -_150;
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _383 = _379 + _381;
    float _385 = fma(_375, _375, _371);
    float _387 = _377 + _337;
    bool _391 = _375 <= 0.001000000047497451305389404296875;
    float _393 = float(_391);
    float _395 = _383 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = _387 + _339;
    float _401 = 1.0 / _385;
    float _403 = _399 + _349;
    float _405 = _403 + _351;
    float _407 = _405 + _353;
    float _409 = -_150;
    float _411 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _413 = _409 + _411;
    float _415 = _371 * _401;
    float _417 = _407 + _355;
    float _419 = _413 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = precise::max(_415, _393);
    float _425 = _417 + _357;
    float _427 = precise::min(_423, 1.0);
    float _429 = fma(_425, 0.111111111938953399658203125, _397);
    float _431 = _421 + _427;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _429;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _431;
    return out;
}

