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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _239 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).x;
    float2 _250 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_250, float2(0.0), isnan(_250))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_250, float2(0.0), isnan(_250))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = precise::max(_67, _91);
    float _95 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = _59 * _85;
    float _101 = precise::max(_93, _87);
    bool _105 = _101 != 0.0;
    bool _107 = isnan(_101);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _59 * _79;
    float _121 = precise::min(_117, _97);
    bool _123 = !_113;
    if (!_123)
    {
        float _125 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _127 = fma(_101, _125, 1.0);
        float _129 = log2(_127);
        float _131 = _129 + (-1.0);
        float2 _353 = float2(_61, _63);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_353, float2(0.0), isnan(_353)), level(_131)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_353, float2(0.0), isnan(_353)), level(_131)).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float _143 = 0.0 + _129;
        float _145 = precise::clamp(_143, 0.0, 1.0);
        float _147 = fma(_99, _145, _119);
        float _149 = _145 * _99;
        float _151 = _121 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _153 = 1.0 / _147;
        float _155 = _139 * 0.586600005626678466796875;
        float _157 = fma(_137, 0.29890000820159912109375, _155);
        float _159 = fma(_141, 0.1143999993801116943359375, _157);
        float _161 = -_141;
        float _163 = _161 + _159;
        float _165 = -_137;
        float _167 = _165 + _159;
        float _169 = -_139;
        float _171 = _169 + _159;
        float _173 = fma(_151, _163, _141);
        float _175 = fma(_151, _167, _137);
        float _177 = fma(_151, _171, _139);
        float _179 = -_173;
        float _181 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].z, _179);
        float _183 = -_175;
        float _185 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[13].x, _183);
        float _187 = -_177;
        float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[13].y, _187);
        float _191 = fma(_121, _181, _173);
        float _193 = fma(_121, _185, _175);
        float _195 = _153 * _149;
        float _197 = fma(_121, _189, _177);
        float _199 = _191 * _149;
        float _201 = _193 * _195;
        float _203 = _197 * _195;
        float _205 = _199 * _153;
        out.m_38.x = _201;
        out.m_38.y = _203;
        out.m_38.z = _205;
        out.m_38.w = _147;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _119;
    return out;
}

