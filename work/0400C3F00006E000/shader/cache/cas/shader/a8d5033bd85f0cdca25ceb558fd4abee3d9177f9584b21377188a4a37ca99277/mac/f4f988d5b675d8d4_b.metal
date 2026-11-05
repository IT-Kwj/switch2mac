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
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _239 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).x;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = -_65;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    float _79 = in.m_35.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    bool _87 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_87)
    {
        discard_fragment();
    }
    float _89 = _59 * _83;
    float _91 = _59 * _71;
    float _93 = fma(_89, _77, _91);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    if (_87)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    bool _97 = _95 != 0.0;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    bool _107 = !_105;
    if (!_107)
    {
        float _109 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _111 = fma(_95, _109, 1.0);
        float _113 = log2(_111);
        float _115 = _113 + (-1.0);
        float _117 = exp2(_115);
        float _119 = _117 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _123 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _125 = -_119;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _129 = -_119;
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _133 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _135 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _137 = -_119;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _141 = -_119;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _387 = float2(_121, _123);
        float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_387, float2(0.0), isnan(_387)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_387, float2(0.0), isnan(_387)), level(_115)).xyz;
        float _149 = _147.x;
        float _151 = _147.y;
        float _153 = _147.z;
        float2 _402 = float2(_127, _131);
        float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_402, float2(0.0), isnan(_402)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_402, float2(0.0), isnan(_402)), level(_115)).xyz;
        float _157 = _155.x;
        float _159 = _155.y;
        float _161 = _155.z;
        float2 _417 = float2(_133, _135);
        float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417)), level(_115)).xyz;
        float _165 = _163.x;
        float _167 = _163.y;
        float _169 = _163.z;
        float2 _432 = float2(_139, _143);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_432, float2(0.0), isnan(_432)), level(_115)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_432, float2(0.0), isnan(_432)), level(_115)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float _179 = 0.0 + _113;
        float _181 = precise::clamp(_179, 0.0, 1.0);
        float _183 = _149 + _157;
        float _185 = _151 + _159;
        float _187 = _153 + _161;
        float _189 = _183 + _165;
        float _191 = _185 + _167;
        float _193 = _187 + _169;
        float _195 = _189 + _173;
        float _197 = _191 + _175;
        float _199 = _193 + _177;
        float _201 = _195 * 0.25;
        float _203 = _197 * 0.25;
        float _205 = _199 * 0.25;
        out.m_38.x = _201;
        out.m_38.y = _203;
        out.m_38.z = _205;
        out.m_38.w = _181;
        return out;
    }
    discard_fragment();
    return out;
}

