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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
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
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _236 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_236, float2(0.0), isnan(_236))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _61 * _73;
    float _95 = _61 * _79;
    bool _99 = _67 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_99)
    {
        discard_fragment();
    }
    float _101 = fma(_67, _93, _95);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    if (_99)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = _61 * _85;
    float _117 = _61 * _91;
    bool _119 = !_113;
    if (!_119)
    {
        float2 _327 = float2(_115, _117);
        float2 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_327, float2(0.0), isnan(_327))).xy;
        float _125 = _123.x;
        float _127 = _123.y;
        float _129 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _131 = _127 + (-0.5);
        float _133 = _125 + (-0.5);
        float _135 = _131 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _137 = _133 * _129;
        float _139 = _135 * _135;
        float _141 = _103 * _137;
        float _143 = _103 * _135;
        float _145 = fma(_137, _137, _139);
        float _147 = rsqrt(_145);
        float _149 = _137 * _147;
        float _151 = _135 * _147;
        float _153 = _149 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        float _155 = _151 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
        float _157 = fma(_153, 4.0, _141);
        float _159 = fma(_155, 4.0, _143);
        float _161 = _63 + _157;
        float _163 = _65 + _159;
        float2 _398 = float2(_161, _163);
        float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
        float _167 = _67 + (-0.001000000047497451305389404296875);
        float _169 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _171 = fma(_103, _169, 1.0);
        float _173 = log2(_171);
        bool _175 = _165 >= _167;
        bool _177 = isnan(_165);
        bool _179 = _175 || _177;
        bool _181 = isnan(_167);
        bool _183 = _179 || _181;
        float _185 = float(_183);
        float _187 = fma(_185, _141, _63);
        float _189 = precise::clamp(_187, 0.0, 1.0);
        float _191 = fma(_185, _143, _65);
        float _193 = precise::clamp(_191, 0.0, 1.0);
        float2 _445 = float2(_189, _193);
        float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_445, float2(0.0), isnan(_445)), bias(_173)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_445, float2(0.0), isnan(_445)), bias(_173)).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        out.m_40.x = _199;
        out.m_40.y = _201;
        out.m_40.z = _203;
        out.m_40.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

