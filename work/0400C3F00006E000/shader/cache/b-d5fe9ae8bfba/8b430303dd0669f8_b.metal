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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
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
    float2 _241 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_241, float2(0.0), isnan(_241))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_69)
    {
        discard_fragment();
    }
    float2 _261 = float2(_61, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_261, float2(0.0), isnan(_261))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_261, float2(0.0), isnan(_261))).x;
    if (_69)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _73 = in.m_38.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_38.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_38.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = precise::max(_71, _93);
    float _97 = _59 * _77;
    float _99 = _59 * _83;
    float _101 = precise::max(_95, _97);
    bool _103 = _101 != 0.0;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.0);
    bool _111 = _107 || _109;
    float _113 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _59 * _89;
    float _123 = precise::min(_115, _119);
    bool _125 = !_111;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_101, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float2 _370 = float2(_61, _63);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370)), level(_133)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float _145 = 0.0 + _131;
        float _147 = precise::clamp(_145, 0.0, 1.0);
        float _149 = fma(_121, _147, _99);
        float _151 = _147 * _121;
        float _153 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _155 = 1.0 / _149;
        float _157 = _141 * 0.586600005626678466796875;
        float _159 = fma(_139, 0.29890000820159912109375, _157);
        float _161 = fma(_143, 0.1143999993801116943359375, _159);
        float _163 = -_143;
        float _165 = _163 + _161;
        float _167 = -_139;
        float _169 = _167 + _161;
        float _171 = -_141;
        float _173 = _171 + _161;
        float _175 = fma(_153, _165, _143);
        float _177 = fma(_153, _169, _139);
        float _179 = fma(_153, _173, _141);
        float _181 = _155 * _151;
        float _183 = -_175;
        float _185 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[13].z, _183);
        float _187 = -_177;
        float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[13].x, _187);
        float _191 = -_179;
        float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[13].y, _191);
        float _195 = fma(_123, _185, _175);
        float _197 = fma(_123, _189, _177);
        float _199 = fma(_123, _193, _179);
        float _201 = _195 * _151;
        float _203 = _197 * _181;
        float _205 = _199 * _181;
        float _207 = _201 * _155;
        out.m_36.x = _203;
        out.m_36.y = _205;
        out.m_36.z = _207;
        out.m_36.w = _149;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _99;
    return out;
}

