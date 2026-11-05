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
    float2 _486 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _503 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).x;
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
    float _164 = _148 * _154;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = _162 * _162;
    float _172 = -_164;
    float _174 = fma(_144, _152, _172);
    float _176 = fma(_168, _168, _170);
    float _178 = fma(_174, _174, _176);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _168 * _180;
    float _186 = _174 * _180;
    float _188 = _182 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].x, _188);
    float _192 = -_68;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _196 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[46].z, _194);
    float _198 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _200 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _202 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].z, _190);
    float _204 = _196 * _70;
    float _206 = _196 * _72;
    float _208 = abs(_202);
    float _210 = -_208;
    float _212 = _210 + 1.0;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = abs(_214);
    float _218 = log2(_216);
    float _220 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _222 = exp2(_220);
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _226 = fma(_182, _224, _204);
    float _228 = fma(_184, _224, _206);
    float _230 = fma(_186, _224, _196);
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _234 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].x, _232);
    float _236 = _226 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].z, _234);
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _244 = _226 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _246 = _226 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _248 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[2].z, _242);
    float _250 = 1.0 / _240;
    float _252 = _248 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _254 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].x, _244);
    float _256 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].x, _246);
    float _258 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].z, _254);
    float _260 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[1].z, _256);
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _264 = _260 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _266 = _252 * _250;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _262 * _250;
    float _272 = _264 * _250;
    float _274 = fma(_198, 1.5, _270);
    float _276 = rint(_268);
    float _278 = precise::max(_276, 0.0);
    uint _281 = uint(_278);
    uint _283 = clamp(_281, 0u, 65535u);
    float _285 = fma(_200, 1.5, _272);
    float _287 = fma(_198, 0.5, _270);
    float _289 = fma(_198, -0.5, _270);
    float _291 = fma(_198, -1.5, _270);
    float3 _887 = float3(_274, _285, float(int(_283)));
    float3 _891 = select(_887, float3(0.0), isnan(_887));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _891.xy, uint(rint(_891.z)), 1.0);
    float3 _899 = float3(_287, _285, float(int(_283)));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _901.xy, uint(rint(_901.z)), 1.0);
    float3 _909 = float3(_289, _285, float(int(_283)));
    float3 _911 = select(_909, float3(0.0), isnan(_909));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _911.xy, uint(rint(_911.z)), 1.0);
    float3 _919 = float3(_291, _285, float(int(_283)));
    float3 _921 = select(_919, float3(0.0), isnan(_919));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _921.xy, uint(rint(_921.z)), 1.0);
    float2 _926 = float2(_54, _56);
    float2 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_926, float2(0.0), isnan(_926))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_926, float2(0.0), isnan(_926))).xy;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _204 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _311 = _204 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _313 = fma(_200, 0.5, _272);
    float _315 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[15].x, _309);
    float _317 = _204 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _319 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[13].x, _311);
    float _321 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].z, _315);
    float _323 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].z, _319);
    float _325 = _321 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _327 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[12].x, _317);
    float _329 = fma(_200, -0.5, _272);
    float _331 = fma(_200, -1.5, _272);
    float _333 = _323 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _335 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[12].z, _327);
    float _337 = 1.0 / _325;
    float _339 = _335 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _341 = _339 * _337;
    float _343 = _333 * _337;
    float _345 = _293 + _295;
    float _347 = _345 + _297;
    float _349 = fma(_305, 2.0, -1.0);
    float _351 = fma(_307, 2.0, -1.0);
    float _353 = _347 + _299;
    float3 _1030 = float3(_287, _313, float(int(_283)));
    float3 _1032 = select(_1030, float3(0.0), isnan(_1030));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1032.xy, uint(rint(_1032.z)), 1.0);
    float3 _1040 = float3(_274, _313, float(int(_283)));
    float3 _1042 = select(_1040, float3(0.0), isnan(_1040));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1042.xy, uint(rint(_1042.z)), 1.0);
    float3 _1050 = float3(_289, _313, float(int(_283)));
    float3 _1052 = select(_1050, float3(0.0), isnan(_1050));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1052.xy, uint(rint(_1052.z)), 1.0);
    float3 _1060 = float3(_291, _313, float(int(_283)));
    float3 _1062 = select(_1060, float3(0.0), isnan(_1060));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1062.xy, uint(rint(_1062.z)), 1.0);
    float3 _1070 = float3(_274, _329, float(int(_283)));
    float3 _1072 = select(_1070, float3(0.0), isnan(_1070));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1072.xy, uint(rint(_1072.z)), 1.0);
    float3 _1080 = float3(_287, _329, float(int(_283)));
    float3 _1082 = select(_1080, float3(0.0), isnan(_1080));
    float _365 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1082.xy, uint(rint(_1082.z)), 1.0);
    float3 _1090 = float3(_289, _329, float(int(_283)));
    float3 _1092 = select(_1090, float3(0.0), isnan(_1090));
    float _367 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1092.xy, uint(rint(_1092.z)), 1.0);
    float2 _1097 = float2(_341, _343);
    float2 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1097, float2(0.0), isnan(_1097))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1097, float2(0.0), isnan(_1097))).xy;
    float _371 = _369.x;
    float _373 = _369.y;
    float _375 = _349 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _377 = _351 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _379 = fma(_375, 2.0, _54);
    float _381 = fma(_377, 2.0, _56);
    float3 _1127 = float3(_291, _329, float(int(_283)));
    float3 _1129 = select(_1127, float3(0.0), isnan(_1127));
    float _383 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1129.xy, uint(rint(_1129.z)), 1.0);
    float3 _1137 = float3(_274, _331, float(int(_283)));
    float3 _1139 = select(_1137, float3(0.0), isnan(_1137));
    float _385 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1139.xy, uint(rint(_1139.z)), 1.0);
    float3 _1147 = float3(_287, _331, float(int(_283)));
    float3 _1149 = select(_1147, float3(0.0), isnan(_1147));
    float _387 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1149.xy, uint(rint(_1149.z)), 1.0);
    float3 _1157 = float3(_289, _331, float(int(_283)));
    float3 _1159 = select(_1157, float3(0.0), isnan(_1157));
    float _389 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1159.xy, uint(rint(_1159.z)), 1.0);
    float3 _1167 = float3(_291, _331, float(int(_283)));
    float3 _1169 = select(_1167, float3(0.0), isnan(_1167));
    float _391 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1169.xy, uint(rint(_1169.z)), 1.0);
    float2 _1174 = float2(_379, _381);
    float _393 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1174, float2(0.0), isnan(_1174))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1174, float2(0.0), isnan(_1174))).x;
    float _395 = _204 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _397 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[14].x, _395);
    float _399 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[14].z, _397);
    float _401 = _399 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _403 = precise::min(_401, 1.0);
    float _405 = -_196;
    float _407 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _409 = _405 + _407;
    float _411 = -_196;
    float _413 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _415 = _411 + _413;
    float _417 = _409 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _415 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _353 + _357;
    float _427 = _425 + _355;
    float _429 = _427 + _359;
    float _431 = -_371;
    float _433 = fma(_431, _371, _373);
    float _435 = -_371;
    float _437 = _403 + _435;
    float _439 = _429 + _361;
    float _441 = fma(_437, _437, _433);
    float _443 = _439 + _363;
    bool _447 = _437 <= 0.001000000047497451305389404296875;
    float _449 = float(_447);
    float _451 = _443 + _365;
    float _453 = 1.0 / _441;
    float _455 = _451 + _367;
    float _457 = _455 + _383;
    float _459 = _457 + _385;
    float _461 = _459 + _387;
    float _463 = _433 * _453;
    float _465 = _461 + _389;
    float _467 = precise::max(_463, _449);
    float _469 = _465 + _391;
    float _471 = precise::min(_467, 1.0);
    float _473 = fma(_469, 0.0625, _419);
    float _475 = _423 + _471;
    out.m_47.x = _393;
    out.m_47.y = _473;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _475;
    return out;
}

