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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
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
    float2 _430 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _448 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
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
    float _104 = _70 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _72, _110);
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
    float _174 = -_168;
    float _176 = fma(_158, _160, _174);
    float _178 = _158 * _164;
    float _180 = _172 * _172;
    float _182 = -_178;
    float _184 = fma(_154, _162, _182);
    float _186 = fma(_176, _176, _180);
    float _188 = fma(_184, _184, _186);
    float _190 = rsqrt(_188);
    float _192 = _172 * _190;
    float _194 = _176 * _190;
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
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _232 = _192 * _230;
    float _234 = _194 * _230;
    float _236 = fma(_196, _230, _228);
    float _238 = fma(_228, _68, _232);
    float _240 = fma(_228, _70, _234);
    float _242 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _244 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _242);
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].z, _244);
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _254 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _256 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _258 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _260 = 1.0 / _250;
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _264 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _254);
    float _266 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _256);
    float _268 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].z, _264);
    float _270 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].z, _266);
    float _272 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _274 = _268 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _276 = _270 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = _262 * _260;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _274 * _260;
    float _284 = _276 * _260;
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _288 = rint(_280);
    float _290 = precise::max(_288, 0.0);
    uint _293 = uint(_290);
    uint _295 = clamp(_293, 0u, 65535u);
    float _297 = fma(_272, 1.5, _284);
    float _299 = fma(_286, 1.5, _282);
    float _301 = fma(_286, 0.5, _282);
    float _303 = fma(_286, -0.5, _282);
    float3 _844 = float3(_299, _297, float(int(_295)));
    float3 _848 = select(_844, float3(0.0), isnan(_844));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _848.xy, uint(rint(_848.z)), 1.0);
    float3 _856 = float3(_301, _297, float(int(_295)));
    float3 _858 = select(_856, float3(0.0), isnan(_856));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _858.xy, uint(rint(_858.z)), 1.0);
    float3 _866 = float3(_303, _297, float(int(_295)));
    float3 _868 = select(_866, float3(0.0), isnan(_866));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _868.xy, uint(rint(_868.z)), 1.0);
    float2 _873 = float2(_52, _54);
    float2 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_873, float2(0.0), isnan(_873))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_873, float2(0.0), isnan(_873))).xy;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = fma(_286, -1.5, _282);
    float _321 = fma(_272, 0.5, _284);
    float _323 = fma(_272, -0.5, _284);
    float _325 = fma(_272, -1.5, _284);
    float _327 = _305 + _307;
    float _329 = fma(_315, 2.0, -1.0);
    float _331 = fma(_317, 2.0, -1.0);
    float _333 = _327 + _309;
    float _335 = _329 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _918 = float3(_319, _297, float(int(_295)));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _920.xy, uint(rint(_920.z)), 1.0);
    float3 _928 = float3(_299, _321, float(int(_295)));
    float3 _930 = select(_928, float3(0.0), isnan(_928));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _930.xy, uint(rint(_930.z)), 1.0);
    float3 _938 = float3(_301, _321, float(int(_295)));
    float3 _940 = select(_938, float3(0.0), isnan(_938));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _940.xy, uint(rint(_940.z)), 1.0);
    float _343 = _331 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _952 = float3(_303, _321, float(int(_295)));
    float3 _954 = select(_952, float3(0.0), isnan(_952));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _954.xy, uint(rint(_954.z)), 1.0);
    float3 _962 = float3(_319, _321, float(int(_295)));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _964.xy, uint(rint(_964.z)), 1.0);
    float3 _972 = float3(_299, _323, float(int(_295)));
    float3 _974 = select(_972, float3(0.0), isnan(_972));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _974.xy, uint(rint(_974.z)), 1.0);
    float3 _982 = float3(_301, _323, float(int(_295)));
    float3 _984 = select(_982, float3(0.0), isnan(_982));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _984.xy, uint(rint(_984.z)), 1.0);
    float3 _992 = float3(_303, _323, float(int(_295)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _353 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _994.xy, uint(rint(_994.z)), 1.0);
    float _355 = fma(_335, 2.0, _52);
    float _357 = fma(_343, 2.0, _54);
    float3 _1008 = float3(_319, _323, float(int(_295)));
    float3 _1010 = select(_1008, float3(0.0), isnan(_1008));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1010.xy, uint(rint(_1010.z)), 1.0);
    float3 _1018 = float3(_299, _325, float(int(_295)));
    float3 _1020 = select(_1018, float3(0.0), isnan(_1018));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1020.xy, uint(rint(_1020.z)), 1.0);
    float3 _1028 = float3(_301, _325, float(int(_295)));
    float3 _1030 = select(_1028, float3(0.0), isnan(_1028));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1030.xy, uint(rint(_1030.z)), 1.0);
    float3 _1038 = float3(_303, _325, float(int(_295)));
    float3 _1040 = select(_1038, float3(0.0), isnan(_1038));
    float _365 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1040.xy, uint(rint(_1040.z)), 1.0);
    float3 _1048 = float3(_319, _325, float(int(_295)));
    float3 _1050 = select(_1048, float3(0.0), isnan(_1048));
    float _367 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1050.xy, uint(rint(_1050.z)), 1.0);
    float2 _1055 = float2(_355, _357);
    float _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1055, float2(0.0), isnan(_1055))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1055, float2(0.0), isnan(_1055))).x;
    float _371 = -_228;
    float _373 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _375 = _371 + _373;
    float _377 = _375 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[48].w, _379);
    float _383 = _333 + _337;
    float _385 = _383 + _339;
    float _387 = _385 + _341;
    float _389 = _387 + _345;
    float _391 = _389 + _347;
    float _393 = _391 + _349;
    float _395 = _393 + _351;
    float _397 = _395 + _353;
    float _399 = _397 + _359;
    float _401 = _399 + _361;
    float _403 = _401 + _363;
    float _405 = _403 + _365;
    float _407 = -_228;
    float _409 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _411 = _407 + _409;
    float _413 = _405 + _367;
    float _415 = _411 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = fma(_413, 0.0625, _417);
    out.m_45.x = _369;
    out.m_45.y = _419;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _381;
    return out;
}

