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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _265 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_36.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = precise::max(_89, _93);
    float _97 = _57 * _73;
    float _99 = _57 * _85;
    float _101 = precise::max(_95, _97);
    float _103 = _57 * _79;
    bool _105 = _101 != 0.0;
    bool _107 = isnan(_101);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    bool _115 = !_113;
    if (!_115)
    {
        float _117 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _119 = fma(_101, _117, 1.0);
        float _121 = log2(_119);
        float _123 = _121 + (-1.0);
        float _125 = exp2(_123);
        float _127 = _125 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _129 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _131 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _133 = -_127;
        float _135 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _137 = -_127;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _141 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _143 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _145 = -_127;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _423 = float2(_129, _131);
        float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_423, float2(0.0), isnan(_423)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_423, float2(0.0), isnan(_423)), level(_123)).xyz;
        float _153 = _151.x;
        float _155 = _151.y;
        float _157 = _151.z;
        float _159 = -_127;
        float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _445 = float2(_135, _139);
        float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_445, float2(0.0), isnan(_445)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_445, float2(0.0), isnan(_445)), level(_123)).xyz;
        float _165 = _163.x;
        float _167 = _163.y;
        float _169 = _163.z;
        float2 _460 = float2(_141, _143);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_460, float2(0.0), isnan(_460)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_460, float2(0.0), isnan(_460)), level(_123)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _475 = float2(_147, _161);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_475, float2(0.0), isnan(_475)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_475, float2(0.0), isnan(_475)), level(_123)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float _187 = 0.0 + _121;
        float _189 = precise::clamp(_187, 0.0, 1.0);
        float _191 = fma(_99, _189, _103);
        float _193 = 1.0 / _191;
        float _195 = _153 + _165;
        float _197 = _155 + _167;
        float _199 = _157 + _169;
        float _201 = _99 * _193;
        float _203 = _195 + _173;
        float _205 = _197 + _175;
        float _207 = _199 + _177;
        float _209 = _203 + _181;
        float _211 = _205 + _183;
        float _213 = _207 + _185;
        float _215 = _189 * _209;
        float _217 = _215 * 0.25;
        float _219 = _189 * _211;
        float _221 = _219 * 0.25;
        float _223 = _189 * _213;
        float _225 = _223 * 0.25;
        float _227 = _217 * _201;
        float _229 = _221 * _201;
        float _231 = _225 * _201;
        out.m_34.x = _227;
        out.m_34.y = _229;
        out.m_34.z = _231;
        out.m_34.w = _191;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _103;
    return out;
}

