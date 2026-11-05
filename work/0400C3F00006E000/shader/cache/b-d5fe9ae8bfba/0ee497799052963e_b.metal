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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
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
    float2 _378 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _396 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).x;
    float2 _404 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_404, float2(0.0), isnan(_404))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_40.y;
    float _80 = in.m_38.x;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _76 * _92;
    float _102 = _80 * _92;
    float _104 = -_100;
    float _106 = fma(_98, _78, _104);
    float _108 = -_64;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[46].z, _110);
    float _114 = -_102;
    float _116 = fma(_98, _84, _114);
    float _118 = -_92;
    float _120 = _118 + _98;
    float _122 = _106 * _106;
    float _124 = -_100;
    float _126 = fma(_112, _82, _124);
    float _128 = -_102;
    float _130 = fma(_112, _86, _128);
    float _132 = -_92;
    float _134 = _132 + _112;
    float _136 = fma(_116, _116, _122);
    float _138 = _126 * _126;
    float _140 = -_66;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[46].z, _142);
    float _146 = fma(_120, _120, _136);
    float _148 = fma(_130, _130, _138);
    float _150 = fma(_134, _134, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _116 * _152;
    float _158 = _120 * _152;
    float _160 = _106 * _152;
    float _162 = _134 * _154;
    float _164 = _126 * _154;
    float _166 = _130 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_168;
    float _176 = fma(_158, _166, _174);
    float _178 = -_170;
    float _180 = fma(_160, _162, _178);
    float _182 = -_172;
    float _184 = fma(_156, _164, _182);
    float _186 = fma(_72, 2.0, -1.0);
    float _188 = _176 * _176;
    float _190 = fma(_74, 2.0, -1.0);
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _194 = fma(_180, _180, _188);
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _198 = fma(_192, 2.0, _52);
    float _200 = fma(_184, _184, _194);
    float _202 = fma(_196, 2.0, _54);
    float _204 = rsqrt(_200);
    float _206 = _176 * _204;
    float _208 = _180 * _204;
    float _210 = _184 * _204;
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
    float _232 = exp2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _236 = _206 * _234;
    float _238 = _208 * _234;
    float _240 = fma(_210, _234, _144);
    float _242 = fma(_144, _76, _236);
    float _244 = fma(_144, _80, _238);
    float _246 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _248 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _246);
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].z, _248);
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _250);
    float _258 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _260 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _262 = 1.0 / _254;
    float _264 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].z, _256);
    float _266 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _258);
    float _268 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].z, _266);
    float _274 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _276 = _272 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _278 = _270 * _262;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _274 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _284 = _276 * _262;
    float _286 = _282 * _262;
    float _288 = rint(_280);
    float _290 = precise::max(_288, 0.0);
    uint _293 = uint(_290);
    uint _295 = clamp(_293, 0u, 65535u);
    float _297 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _284);
    float _299 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _286);
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _303 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _301, _284);
    float _305 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _307 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _305, _286);
    float3 _812 = float3(_284, _299, float(int(_295)));
    float3 _816 = select(_812, float3(0.0), isnan(_812));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _816.xy, uint(rint(_816.z)), 1.0);
    float3 _824 = float3(_297, _299, float(int(_295)));
    float3 _826 = select(_824, float3(0.0), isnan(_824));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _826.xy, uint(rint(_826.z)), 1.0);
    float3 _834 = float3(_303, _299, float(int(_295)));
    float3 _836 = select(_834, float3(0.0), isnan(_834));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _836.xy, uint(rint(_836.z)), 1.0);
    float3 _844 = float3(_297, _286, float(int(_295)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _846.xy, uint(rint(_846.z)), 1.0);
    float3 _854 = float3(_284, _286, float(int(_295)));
    float3 _856 = select(_854, float3(0.0), isnan(_854));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _856.xy, uint(rint(_856.z)), 1.0);
    float3 _864 = float3(_303, _286, float(int(_295)));
    float3 _866 = select(_864, float3(0.0), isnan(_864));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _866.xy, uint(rint(_866.z)), 1.0);
    float3 _874 = float3(_297, _307, float(int(_295)));
    float3 _876 = select(_874, float3(0.0), isnan(_874));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _876.xy, uint(rint(_876.z)), 1.0);
    float3 _884 = float3(_284, _307, float(int(_295)));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _886.xy, uint(rint(_886.z)), 1.0);
    float3 _894 = float3(_303, _307, float(int(_295)));
    float3 _896 = select(_894, float3(0.0), isnan(_894));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _896.xy, uint(rint(_896.z)), 1.0);
    float2 _901 = float2(_198, _202);
    float _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_901, float2(0.0), isnan(_901))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_901, float2(0.0), isnan(_901))).x;
    float _329 = _311 + _309;
    float _331 = _329 + _313;
    float _333 = _331 + _315;
    float _335 = _333 + _317;
    float _337 = _335 + _319;
    float _339 = _337 + _321;
    float _341 = _339 + _323;
    float _343 = -_144;
    float _345 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _347 = _343 + _345;
    float _349 = -_144;
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _353 = _349 + _351;
    float _355 = _341 + _325;
    float _357 = _347 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _353 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[48].w, _359);
    float _367 = fma(_355, 0.111111111938953399658203125, _363);
    out.m_45.x = _327;
    out.m_45.y = _367;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _365;
    return out;
}

