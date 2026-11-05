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
    float2 _275 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_275, float2(0.0), isnan(_275))).x;
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
    float _91 = _57 * _73;
    float _93 = _57 * _79;
    float _95 = _57 * _85;
    float _97 = precise::max(_89, _91);
    bool _99 = _97 != 0.0;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    bool _109 = !_107;
    if (!_109)
    {
        float _111 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _113 = fma(_97, _111, 1.0);
        float _115 = log2(_113);
        float _117 = _115 + (-1.0);
        float _119 = exp2(_117);
        float _121 = _119 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _125 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _127 = -_121;
        float _129 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _131 = -_121;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _135 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _137 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _139 = -_121;
        float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _143 = -_121;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _429 = float2(_123, _125);
        float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_429, float2(0.0), isnan(_429)), level(_117)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_429, float2(0.0), isnan(_429)), level(_117)).xyz;
        float _151 = _149.x;
        float _153 = _149.y;
        float _155 = _149.z;
        float2 _444 = float2(_129, _133);
        float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_444, float2(0.0), isnan(_444)), level(_117)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_444, float2(0.0), isnan(_444)), level(_117)).xyz;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float2 _459 = float2(_135, _137);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_459, float2(0.0), isnan(_459)), level(_117)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_459, float2(0.0), isnan(_459)), level(_117)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float2 _474 = float2(_141, _145);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_474, float2(0.0), isnan(_474)), level(_117)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_474, float2(0.0), isnan(_474)), level(_117)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float _181 = 0.0 + _115;
        float _183 = precise::clamp(_181, 0.0, 1.0);
        float _185 = fma(_95, _183, _93);
        float _187 = _151 + _159;
        float _189 = _153 + _161;
        float _191 = _155 + _163;
        float _193 = _187 + _167;
        float _195 = _189 + _169;
        float _197 = _191 + _171;
        float _199 = 1.0 / _185;
        float _201 = _193 + _175;
        float _203 = _195 + _177;
        float _205 = _197 + _179;
        float _207 = _183 * _201;
        float _209 = _207 * 0.25;
        float _211 = _183 * _203;
        float _213 = _211 * 0.25;
        float _215 = _183 * _205;
        float _217 = _215 * 0.25;
        float _219 = -_209;
        float _221 = _219 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _223 = -_213;
        float _225 = _223 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _227 = -_217;
        float _229 = _227 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _231 = fma(_93, _221, _209);
        float _233 = fma(_93, _225, _213);
        float _235 = fma(_93, _229, _217);
        float _237 = _231 * _199;
        float _239 = _233 * _199;
        float _241 = _235 * _199;
        out.m_34.x = _237;
        out.m_34.y = _239;
        out.m_34.z = _241;
        out.m_34.w = _185;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _93;
    return out;
}

