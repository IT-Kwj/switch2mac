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
    float2 _462 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _479 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_479, float2(0.0), isnan(_479))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_479, float2(0.0), isnan(_479))).x;
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
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _116 * _146;
    float _152 = _128 * _146;
    float _154 = _108 * _146;
    float _156 = _138 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _158 = _132 * _148;
    float _160 = _112 * _148;
    float _162 = _120 * _148;
    float _164 = _150 * _158;
    float _166 = _152 * _160;
    float _168 = -_164;
    float _170 = fma(_152, _162, _168);
    float _172 = _154 * _162;
    float _174 = -_166;
    float _176 = fma(_154, _158, _174);
    float _178 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[15].x, _156);
    float _180 = _170 * _170;
    float _182 = -_172;
    float _184 = fma(_150, _160, _182);
    float _186 = _138 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _188 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _178);
    float _190 = fma(_176, _176, _180);
    float _192 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _194 = fma(_184, _184, _190);
    float _196 = rsqrt(_194);
    float _198 = _170 * _196;
    float _200 = _176 * _196;
    float _202 = _184 * _196;
    float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _206 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].x, _204);
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].z, _206);
    float _210 = abs(_208);
    float _212 = -_210;
    float _214 = _212 + 1.0;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = abs(_216);
    float _220 = log2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _228 = fma(_198, _226, _138);
    float _230 = fma(_200, _226, _140);
    float _232 = fma(_202, _226, _104);
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _236 = _228 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].x, _234);
    float _240 = _228 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _242 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _244 = _228 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].z, _238);
    float _248 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].z, _242);
    float _250 = _246 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _252 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].x, _240);
    float _254 = _248 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _256 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[1].x, _244);
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].z, _252);
    float _262 = 1.0 / _250;
    float _264 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].z, _256);
    float _266 = _260 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _268 = _264 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _270 = _254 * _262;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _266 * _262;
    float _276 = _268 * _262;
    float _278 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _280 = rint(_272);
    float _282 = precise::max(_280, 0.0);
    uint _285 = uint(_282);
    uint _287 = clamp(_285, 0u, 65535u);
    float _289 = fma(_258, 0.5, _274);
    float _291 = fma(_258, 1.5, _274);
    float _293 = fma(_258, -0.5, _274);
    float _295 = fma(_258, -1.5, _274);
    float _297 = _138 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _299 = fma(_278, 1.5, _276);
    float _301 = fma(_278, 0.5, _276);
    float _303 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[12].x, _297);
    float3 _901 = float3(_291, _299, float(int(_287)));
    float3 _905 = select(_901, float3(0.0), isnan(_901));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _905.xy, uint(rint(_905.z)), 1.0);
    float3 _913 = float3(_289, _299, float(int(_287)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _915.xy, uint(rint(_915.z)), 1.0);
    float3 _923 = float3(_293, _299, float(int(_287)));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _925.xy, uint(rint(_925.z)), 1.0);
    float3 _933 = float3(_295, _299, float(int(_287)));
    float3 _935 = select(_933, float3(0.0), isnan(_933));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _935.xy, uint(rint(_935.z)), 1.0);
    float3 _943 = float3(_289, _301, float(int(_287)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _945.xy, uint(rint(_945.z)), 1.0);
    float _315 = _188 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _317 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _303);
    float _319 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _192);
    float _321 = 1.0 / _315;
    float _323 = _317 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _325 = _319 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _327 = fma(_278, -0.5, _276);
    float3 _980 = float3(_293, _301, float(int(_287)));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _982.xy, uint(rint(_982.z)), 1.0);
    float3 _990 = float3(_291, _301, float(int(_287)));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _992.xy, uint(rint(_992.z)), 1.0);
    float3 _1000 = float3(_295, _301, float(int(_287)));
    float3 _1002 = select(_1000, float3(0.0), isnan(_1000));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1002.xy, uint(rint(_1002.z)), 1.0);
    float3 _1010 = float3(_291, _327, float(int(_287)));
    float3 _1012 = select(_1010, float3(0.0), isnan(_1010));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1012.xy, uint(rint(_1012.z)), 1.0);
    float3 _1020 = float3(_289, _327, float(int(_287)));
    float3 _1022 = select(_1020, float3(0.0), isnan(_1020));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1022.xy, uint(rint(_1022.z)), 1.0);
    float3 _1030 = float3(_293, _327, float(int(_287)));
    float3 _1032 = select(_1030, float3(0.0), isnan(_1030));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1032.xy, uint(rint(_1032.z)), 1.0);
    float _341 = _323 * _321;
    float _343 = _325 * _321;
    float _345 = fma(_278, -1.5, _276);
    float2 _1046 = float2(_341, _343);
    float2 _349 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1046, float2(0.0), isnan(_1046))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1046, float2(0.0), isnan(_1046))).xy;
    float _351 = _349.x;
    float _353 = _349.y;
    float3 _1061 = float3(_295, _327, float(int(_287)));
    float3 _1063 = select(_1061, float3(0.0), isnan(_1061));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1063.xy, uint(rint(_1063.z)), 1.0);
    float3 _1071 = float3(_291, _345, float(int(_287)));
    float3 _1073 = select(_1071, float3(0.0), isnan(_1071));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1073.xy, uint(rint(_1073.z)), 1.0);
    float3 _1081 = float3(_289, _345, float(int(_287)));
    float3 _1083 = select(_1081, float3(0.0), isnan(_1081));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1083.xy, uint(rint(_1083.z)), 1.0);
    float3 _1091 = float3(_293, _345, float(int(_287)));
    float3 _1093 = select(_1091, float3(0.0), isnan(_1091));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1093.xy, uint(rint(_1093.z)), 1.0);
    float3 _1101 = float3(_295, _345, float(int(_287)));
    float3 _1103 = select(_1101, float3(0.0), isnan(_1101));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1103.xy, uint(rint(_1103.z)), 1.0);
    float _365 = _138 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _367 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[14].x, _365);
    float _369 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _367);
    float _371 = _369 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _373 = precise::min(_371, 1.0);
    float _375 = -_104;
    float _377 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _379 = _375 + _377;
    float _381 = _379 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _305 + _307;
    float _387 = _385 + _309;
    float _389 = _387 + _311;
    float _391 = _389 + _331;
    float _393 = _391 + _313;
    float _395 = _393 + _329;
    float _397 = _395 + _333;
    float _399 = -_351;
    float _401 = fma(_399, _351, _353);
    float _403 = -_351;
    float _405 = _373 + _403;
    float _407 = _397 + _335;
    float _409 = fma(_405, _405, _401);
    float _411 = _407 + _337;
    bool _415 = _405 <= 0.001000000047497451305389404296875;
    float _417 = float(_415);
    float _419 = _411 + _339;
    float _421 = 1.0 / _409;
    float _423 = _419 + _355;
    float _425 = _423 + _357;
    float _427 = _425 + _359;
    float _429 = _401 * _421;
    float _431 = _427 + _361;
    float _433 = -_104;
    float _435 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _437 = _433 + _435;
    float _439 = precise::max(_429, _417);
    float _441 = _431 + _363;
    float _443 = _437 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = precise::min(_439, 1.0);
    float _449 = fma(_441, 0.0625, _445);
    float _451 = _383 + _447;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _449;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _451;
    return out;
}

