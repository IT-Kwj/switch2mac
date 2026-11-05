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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _47;
    float _75 = _73 * _53;
    float _77 = _73 * _59;
    float _79 = _73 * _65;
    float _81 = _75 * _75;
    float _83 = in.m_35.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = fma(_77, _77, _81);
    float _91 = fma(_79, _79, _89);
    float _93 = rsqrt(_91);
    float _95 = _75 * _93;
    float _97 = _77 * _93;
    float _99 = _79 * _93;
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].x, _101);
    float _105 = _95 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _107 = _73 * _87;
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[2].z, _103);
    float _111 = fma(_105, 0.5, 0.5);
    float _113 = fma(_109, 0.5, 0.5);
    float _115 = _73 * _71;
    float2 _329 = float2(_113, _111);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float2(0.0), isnan(_329))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float2 _349 = float2(_107, _115);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_349, float2(0.0), isnan(_349))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = 0.0 + _105;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = in.m_37.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = abs(_140);
    float _150 = log2(_148);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _156 = _150 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _158 = exp2(_156);
    float _160 = fma(_158, _154, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _162 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _164 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _162);
    float _166 = _126 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _172 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[13].x, _170);
    float _174 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _176 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _178 = fma(_168, _164, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _180 = fma(_168, _172, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _182 = fma(_168, _176, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _184 = _73 * _146;
    float _186 = _178 * _136;
    float _188 = _180 * _136;
    float _190 = _182 * _136;
    float _192 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[13].y, _186);
    float _194 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[13].y, _188);
    float _196 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[13].y, _190);
    float _198 = _160 * _184;
    float _200 = -_192;
    float _202 = _200 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _204 = -_194;
    float _206 = _204 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _208 = -_196;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _212 = fma(_198, _202, _192);
    float _214 = fma(_198, _206, _194);
    float _216 = fma(_198, _210, _196);
    out.m_40.x = _212;
    out.m_40.y = _214;
    out.m_40.z = _216;
    out.m_40.w = 1.0;
    return out;
}

