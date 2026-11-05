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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_31.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_31.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _45;
    float _85 = _83 * _51;
    float _87 = _83 * _57;
    float _89 = _83 * _63;
    float _91 = _83 * _69;
    float _93 = _83 * _75;
    float _95 = _83 * _81;
    float _97 = 1.0 / _85;
    float _99 = 1.0 / _87;
    float _101 = _89 * _97;
    float _103 = _91 * _97;
    float _105 = _93 * _99;
    float _107 = _95 * _99;
    float2 _309 = float2(_101, _103);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _328 = float2(_107, _105);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_328, float2(0.0), isnan(_328))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float _130 = in.m_35.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_35.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_35.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_35.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    int _155 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _159 = _155 != 0;
    float _161 = precise::max(_118, _128);
    float _163 = -_128;
    float _165 = _163 + 1.0;
    float _167 = _161;
    if (_159)
    {
        float _169 = precise::min(_118, _128);
        _167 = _169;
    }
    float _171 = _167;
    float _173 = _112 * _165;
    float _175 = _83 * _134;
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _179 = _114 * _165;
    float _181 = _116 * _165;
    float _183 = _177 * _175;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma(_124, _128, _179);
    float _189 = fma(_122, _128, _173);
    float _191 = fma(_126, _128, _181);
    bool _193 = _185 != 0.0;
    bool _195 = isnan(_185);
    bool _197 = _193 || _195;
    bool _199 = isnan(0.0);
    bool _201 = _197 || _199;
    float _203 = _83 * _140;
    float _205 = _83 * _146;
    float _207 = _83 * _152;
    float _209 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _211 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _213 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _215 = _209 * _203;
    float _217 = _211 * _205;
    float _219 = _213 * _207;
    if (_201)
    {
        out.m_38.x = _215;
        out.m_38.y = _217;
        out.m_38.z = _219;
        out.m_38.w = _185;
        return out;
    }
    discard_fragment();
    return out;
}

