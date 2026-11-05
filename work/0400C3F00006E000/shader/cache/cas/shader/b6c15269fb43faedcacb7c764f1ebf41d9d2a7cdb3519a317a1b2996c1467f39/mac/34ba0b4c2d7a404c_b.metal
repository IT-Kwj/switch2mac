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
    texture3d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture3d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _45;
    float _67 = _65 * _51;
    float _69 = _65 * _57;
    float _71 = _67 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _73 = _67 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _75 = _65 * _63;
    float _77 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, _71);
    float _79 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[6].x, _73);
    float _81 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[4].z, _77);
    float _83 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[6].z, _79);
    float _85 = _81 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = _83 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float3 _318 = float3(_87, _91, 0.0);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float3(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float3(0.0), isnan(_318))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float3 _337 = float3(_87, _91, 0.0);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_337, float3(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_337, float3(0.0), isnan(_337))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float3 _353 = float3(_87, _91, 0.0);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_353, float3(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_353, float3(0.0), isnan(_353))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = in.m_35.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_35.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_35.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = _65 * _128;
    float _144 = _65 * _134;
    float _146 = _65 * _140;
    float _148 = _142 * _142;
    float _150 = fma(_144, _144, _148);
    float _152 = fma(_146, _146, _150);
    float _154 = rsqrt(_152);
    float _156 = _142 * _154;
    float _158 = _144 * _154;
    float _160 = _146 * _154;
    float _162 = _156 * _98;
    float _164 = _156 * _108;
    float _166 = fma(_158, _102, _162);
    float _168 = _156 * _118;
    float _170 = fma(_160, _100, _166);
    float _172 = fma(_158, _112, _164);
    float _174 = fma(_158, _122, _168);
    float _176 = _170 * 0.3257299959659576416015625;
    float _178 = fma(_160, _110, _172);
    float _180 = fma(_160, _120, _174);
    float _182 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _184 = fma(_96, 0.2820999920368194580078125, _176);
    float _186 = _178 * 0.3257299959659576416015625;
    float _188 = _180 * 0.3257299959659576416015625;
    float _190 = fma(_106, 0.2820999920368194580078125, _186);
    float _192 = fma(_116, 0.2820999920368194580078125, _188);
    float _194 = precise::max(0.0, _184);
    float _196 = precise::max(0.0, _190);
    float _198 = precise::max(0.0, _192);
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _206 = abs(_200);
    float _208 = log2(_206);
    float _210 = abs(_202);
    float _212 = log2(_210);
    float _214 = abs(_204);
    float _216 = log2(_214);
    float _218 = _208 * _182;
    float _220 = _212 * _182;
    float _222 = exp2(_218);
    float _224 = _216 * _182;
    float _226 = exp2(_220);
    float _228 = exp2(_224);
    out.m_38.x = _222;
    out.m_38.y = _226;
    out.m_38.z = _228;
    out.m_38.w = 1.0;
    return out;
}

