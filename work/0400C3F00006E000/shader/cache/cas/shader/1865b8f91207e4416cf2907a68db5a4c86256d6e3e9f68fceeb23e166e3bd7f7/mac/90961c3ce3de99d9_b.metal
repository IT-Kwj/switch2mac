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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], float2 gl_PointCoord [[point_coord]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.y;
    float _53 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _55 = _51 / _53;
    float _57 = gl_FragCoord.x;
    float _59 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _61 = _57 / _59;
    float _63 = _55 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _65 = _61 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float2 _317 = float2(_65, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317))).x;
    float _69 = gl_FragCoord.w;
    float _71 = in.m_31.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = gl_PointCoord.y;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _69;
    float _87 = fma(_77, 2.0, -1.0);
    float _89 = _85 * _75;
    float _91 = gl_PointCoord.x;
    bool _95 = _89 > 0.5;
    bool _97 = isnan(_89);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.5);
    bool _103 = _99 || _101;
    float _105 = 0.0;
    float _107 = _65;
    float _109 = 2.0;
    float _111 = _87;
    if (_103)
    {
        float _113 = in.m_39.x;
        float _115 = gl_FragCoord.w;
        float _117 = _113 * _115;
        _105 = _117;
    }
    float _119 = _105;
    float _121 = 0.0;
    if (_103)
    {
        float _123 = 1.0 / _89;
        _121 = _123;
    }
    float _125 = _121;
    float _127 = fma(_91, 2.0, -1.0);
    float _129 = _127;
    if (_103)
    {
        float _131 = _85 * _119;
        _107 = _131;
    }
    float _133 = _107;
    float _135 = in.m_41.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _133;
    float _143 = _125;
    if (_103)
    {
        float _145 = _133 * _125;
        _141 = _145;
    }
    float _147 = _141;
    float _149 = _147;
    if (_103)
    {
        float _151 = _87 * _147;
        _109 = _151;
    }
    float _153 = _109;
    if (_103)
    {
        float _155 = _127 * _147;
        _149 = _155;
    }
    float _157 = _149;
    float _159 = _157;
    if (!_103)
    {
        float _161 = abs(_127);
        float _163 = -_161;
        float _165 = _89 + _163;
        _129 = _165;
    }
    float _167 = _129;
    float _169 = _167;
    if (!_103)
    {
        float _171 = abs(_87);
        float _173 = -_171;
        float _175 = _89 + _173;
        _111 = _175;
    }
    float _177 = _111;
    float _179 = _177;
    if (_103)
    {
        float _181 = _153 * _153;
        _143 = _181;
    }
    float _183 = _143;
    float _185 = _85 * _83;
    float _187 = _183;
    if (!_103)
    {
        float _189 = _167 + 0.5;
        float _191 = precise::clamp(_189, 0.0, 1.0);
        _169 = _191;
    }
    float _193 = _169;
    float _195 = _193;
    if (!_103)
    {
        float _197 = _177 + 0.5;
        float _199 = precise::clamp(_197, 0.0, 1.0);
        _179 = _199;
    }
    float _201 = _179;
    float _203 = _201;
    if (_103)
    {
        float _205 = fma(_157, _157, _183);
        _187 = _205;
    }
    float _207 = _187;
    if (!_103)
    {
        float _209 = _89 * 2.0;
        _159 = _209;
    }
    float _211 = _159;
    float _213 = _207;
    float _215 = _211;
    if (_103)
    {
        float _217 = sqrt(_207);
        _213 = _217;
    }
    float _219 = _213;
    if (!_103)
    {
        float _221 = precise::min(_193, _211);
        _195 = _221;
    }
    float _223 = _195;
    float _225 = _223;
    if (!_103)
    {
        float _227 = precise::min(_211, _201);
        _215 = _227;
    }
    float _229 = _215;
    if (!_103)
    {
        float _231 = _223 * _229;
        _225 = _231;
    }
    float _233 = _225;
    float _235 = _233;
    if (_103)
    {
        float _237 = _219 + (-1.0);
        _203 = _237;
    }
    float _239 = _203;
    float _241 = in.m_41.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    if (_103)
    {
        float _247 = -_89;
        float _249 = fma(_247, _239, 0.5);
        float _251 = precise::clamp(_249, 0.0, 1.0);
        _235 = _251;
    }
    float _253 = _235;
    float _255 = in.m_41.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = 0.0 + _67;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = abs(_263);
    float _267 = log2(_265);
    float _269 = _267 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _271 = _85 * _245;
    float _273 = exp2(_269);
    float _275 = -_273;
    float _277 = _275 + 1.0;
    float _279 = _277 * _253;
    float _281 = _85 * _259;
    float _283 = _85 * _139;
    float _285 = _279 * _185;
    out.m_44.x = _281;
    out.m_44.y = _271;
    out.m_44.z = _283;
    out.m_44.w = _285;
    return out;
}

