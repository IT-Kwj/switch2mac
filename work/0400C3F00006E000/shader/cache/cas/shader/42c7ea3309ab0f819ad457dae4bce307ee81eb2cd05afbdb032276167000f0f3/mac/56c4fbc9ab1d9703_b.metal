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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
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
    float2 _373 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _391 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
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
    float _94 = 1.0 / _88;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = _90 * _96;
    float _100 = _66 * _98;
    float _102 = _68 * _98;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _92 * _104;
    float _108 = -_100;
    float _110 = fma(_106, _70, _108);
    float _112 = -_102;
    float _114 = fma(_106, _74, _112);
    float _116 = -_98;
    float _118 = _116 + _106;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _122 = _94 * _120;
    float _124 = _110 * _110;
    float _126 = -_100;
    float _128 = fma(_122, _72, _126);
    float _130 = -_102;
    float _132 = fma(_122, _76, _130);
    float _134 = -_98;
    float _136 = _134 + _122;
    float _138 = fma(_114, _114, _124);
    float _140 = _128 * _128;
    float _142 = -_64;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _146 = fma(_118, _118, _138);
    float _148 = fma(_132, _132, _140);
    float _150 = 1.0 / _144;
    float _152 = fma(_136, _136, _148);
    float _154 = rsqrt(_146);
    float _156 = rsqrt(_152);
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _160 = _150 * _158;
    float _162 = _114 * _154;
    float _164 = _118 * _154;
    float _166 = _110 * _154;
    float _168 = _136 * _156;
    float _170 = _128 * _156;
    float _172 = _132 * _156;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = -_176;
    float _184 = fma(_166, _168, _182);
    float _186 = _166 * _172;
    float _188 = _180 * _180;
    float _190 = -_186;
    float _192 = fma(_162, _170, _190);
    float _194 = fma(_184, _184, _188);
    float _196 = fma(_192, _192, _194);
    float _198 = rsqrt(_196);
    float _200 = _180 * _198;
    float _202 = _184 * _198;
    float _204 = _192 * _198;
    float _206 = _200 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].x, _206);
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].z, _208);
    float _212 = abs(_210);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = abs(_218);
    float _222 = log2(_220);
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _226 = exp2(_224);
    float _228 = _226 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _230 = _200 * _228;
    float _232 = _202 * _228;
    float _234 = fma(_204, _228, _160);
    float _236 = fma(_160, _66, _230);
    float _238 = fma(_160, _68, _232);
    float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _242 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _240);
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[3].z, _242);
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _250 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _252 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _254 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _256 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].z, _250);
    float _258 = 1.0 / _248;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _252);
    float _264 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _254);
    float _266 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].z, _262);
    float _268 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].z, _264);
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _272 = _268 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _274 = _260 * _258;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _272 * _258;
    float _280 = _270 * _258;
    float _282 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _278);
    float _284 = rint(_276);
    float _286 = precise::max(_284, 0.0);
    uint _289 = uint(_286);
    uint _291 = clamp(_289, 0u, 65535u);
    float _293 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _280);
    float _295 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _297 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _295, _280);
    float _299 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _301 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _299, _278);
    float3 _790 = float3(_280, _282, float(int(_291)));
    float3 _794 = select(_790, float3(0.0), isnan(_790));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _794.xy, uint(rint(_794.z)), 1.0);
    float3 _802 = float3(_293, _282, float(int(_291)));
    float3 _804 = select(_802, float3(0.0), isnan(_802));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _804.xy, uint(rint(_804.z)), 1.0);
    float3 _812 = float3(_297, _282, float(int(_291)));
    float3 _814 = select(_812, float3(0.0), isnan(_812));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _814.xy, uint(rint(_814.z)), 1.0);
    float3 _822 = float3(_293, _278, float(int(_291)));
    float3 _824 = select(_822, float3(0.0), isnan(_822));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _824.xy, uint(rint(_824.z)), 1.0);
    float3 _832 = float3(_280, _278, float(int(_291)));
    float3 _834 = select(_832, float3(0.0), isnan(_832));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _834.xy, uint(rint(_834.z)), 1.0);
    float3 _842 = float3(_297, _278, float(int(_291)));
    float3 _844 = select(_842, float3(0.0), isnan(_842));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _844.xy, uint(rint(_844.z)), 1.0);
    float3 _852 = float3(_293, _301, float(int(_291)));
    float3 _854 = select(_852, float3(0.0), isnan(_852));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _854.xy, uint(rint(_854.z)), 1.0);
    float3 _862 = float3(_280, _301, float(int(_291)));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _864.xy, uint(rint(_864.z)), 1.0);
    float3 _872 = float3(_297, _301, float(int(_291)));
    float3 _874 = select(_872, float3(0.0), isnan(_872));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _874.xy, uint(rint(_874.z)), 1.0);
    float2 _879 = float2(_50, _52);
    float _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_879, float2(0.0), isnan(_879))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_879, float2(0.0), isnan(_879))).x;
    float _323 = _305 + _303;
    float _325 = _323 + _307;
    float _327 = _325 + _309;
    float _329 = _327 + _311;
    float _331 = _329 + _313;
    float _333 = _331 + _315;
    float _335 = _333 + _317;
    float _337 = -_160;
    float _339 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _341 = _337 + _339;
    float _343 = -_160;
    float _345 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _347 = _343 + _345;
    float _349 = _335 + _319;
    float _351 = _341 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = _347 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[48].w, _353);
    float _361 = fma(_349, 0.111111111938953399658203125, _357);
    out.m_43.x = _321;
    out.m_43.y = _361;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _359;
    return out;
}

