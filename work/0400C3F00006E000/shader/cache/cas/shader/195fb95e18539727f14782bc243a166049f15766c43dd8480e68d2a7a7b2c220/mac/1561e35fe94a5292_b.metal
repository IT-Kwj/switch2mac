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
    float2 _353 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _371 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).x;
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
    float _94 = 1.0 / _88;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = _90 * _96;
    float _100 = _66 * _98;
    float _102 = _70 * _98;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _92 * _104;
    float _108 = -_100;
    float _110 = fma(_106, _68, _108);
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
    float _134 = fma(_114, _114, _124);
    float _136 = -_98;
    float _138 = _136 + _122;
    float _140 = _128 * _128;
    float _142 = fma(_118, _118, _134);
    float _144 = fma(_132, _132, _140);
    float _146 = fma(_138, _138, _144);
    float _148 = rsqrt(_142);
    float _150 = rsqrt(_146);
    float _152 = _114 * _148;
    float _154 = _118 * _148;
    float _156 = _110 * _148;
    float _158 = _138 * _150;
    float _160 = _128 * _150;
    float _162 = _132 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _160;
    float _168 = -_164;
    float _170 = fma(_154, _162, _168);
    float _172 = -_166;
    float _174 = fma(_156, _158, _172);
    float _176 = _156 * _162;
    float _178 = _170 * _170;
    float _180 = -_176;
    float _182 = fma(_152, _160, _180);
    float _184 = fma(_174, _174, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _174 * _188;
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
    float _214 = -_64;
    float _216 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _218 = 1.0 / _216;
    float _220 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _222 = exp2(_220);
    float _224 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _226 = _218 * _224;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _230 = _190 * _228;
    float _232 = _192 * _228;
    float _234 = fma(_194, _228, _226);
    float _236 = fma(_226, _66, _230);
    float _238 = fma(_226, _70, _232);
    float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _244 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _240);
    float _246 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _242);
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[3].z, _244);
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _252 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _254 = 1.0 / _250;
    float _256 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _252);
    float _258 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].z, _256);
    float _260 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _264 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _260);
    float _266 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _270 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].z, _264);
    float _272 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _274 = _262 * _254;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _270 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _282 = rint(_276);
    float _284 = precise::max(_282, 0.0);
    uint _287 = uint(_284);
    uint _289 = clamp(_287, 0u, 65535u);
    float _291 = _278 * _254;
    float _293 = _280 * _254;
    float _295 = fma(_266, 0.5, _291);
    float _297 = fma(_266, -0.5, _291);
    float _299 = fma(_268, 0.5, _293);
    float _301 = fma(_268, -0.5, _293);
    float3 _766 = float3(_295, _299, float(int(_289)));
    float3 _770 = select(_766, float3(0.0), isnan(_766));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _770.xy, uint(rint(_770.z)), 1.0);
    float3 _778 = float3(_297, _299, float(int(_289)));
    float3 _780 = select(_778, float3(0.0), isnan(_778));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _780.xy, uint(rint(_780.z)), 1.0);
    float3 _788 = float3(_295, _301, float(int(_289)));
    float3 _790 = select(_788, float3(0.0), isnan(_788));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _790.xy, uint(rint(_790.z)), 1.0);
    float3 _798 = float3(_297, _301, float(int(_289)));
    float3 _800 = select(_798, float3(0.0), isnan(_798));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _800.xy, uint(rint(_800.z)), 1.0);
    float2 _805 = float2(_50, _52);
    float _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_805, float2(0.0), isnan(_805))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_805, float2(0.0), isnan(_805))).x;
    float _313 = -_226;
    float _315 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _317 = _313 + _315;
    float _319 = _317 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[48].w, _321);
    float _325 = _303 + _305;
    float _327 = _325 + _307;
    float _329 = -_226;
    float _331 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _333 = _329 + _331;
    float _335 = _327 + _309;
    float _337 = _333 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = fma(_335, 0.25, _339);
    out.m_43.x = _311;
    out.m_43.y = _341;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _323;
    return out;
}

