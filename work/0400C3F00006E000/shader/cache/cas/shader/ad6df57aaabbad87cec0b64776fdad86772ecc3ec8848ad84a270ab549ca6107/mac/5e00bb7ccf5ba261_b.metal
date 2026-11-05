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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _57;
    float _91 = _89 * _63;
    float _93 = _89 * _69;
    float _95 = _89 * _75;
    float _97 = _89 * _87;
    float _99 = 1.0 / _91;
    float _101 = _93 * _99;
    float _103 = _95 * _99;
    float _105 = _89 * _81;
    float2 _387 = float2(_101, _103);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_387, float2(0.0), isnan(_387))).x;
    float2 _398 = float2(_105, _97);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).w;
    float _111 = in.m_35.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_43.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _89 * _115;
    float _137 = in.m_45.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _135 * _99;
    float _145 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c8)._m0[30].w, _145);
    float _149 = 1.0 / _147;
    float _151 = _89 * _121;
    float _153 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _155 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _157 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _155);
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _161 = _149 * _159;
    float _163 = _109 * _151;
    float _165 = _89 * _127;
    float _167 = 1.0 / _157;
    float _169 = _165 * _163;
    float _171 = _89 * _133;
    float _173 = _171 * _169;
    float _175 = 0.0 + _173;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _181 = -_161;
    float _183 = fma(_167, _179, _181);
    float _185 = _89 * _141;
    float _187 = _183 * _153;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _177 * _189;
    float _193 = _191 * _185;
    bool _197 = _193 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _199 = isnan(_193);
    bool _201 = _197 || _199;
    bool _203 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _205 = _201 || _203;
    float _207 = in.m_41.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_41.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_41.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = _161;
    if (!_205)
    {
        discard_fragment();
    }
    float _227 = _89 * _211;
    float _229 = _89 * _217;
    float _231 = _89 * _223;
    if (!_205)
    {
        out.m_48.x = _229;
        out.m_48.y = _227;
        out.m_48.z = _231;
        out.m_48.w = _173;
        return out;
    }
    float _233 = _227 * 0.715200006961822509765625;
    float _235 = in.m_50.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_50.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_50.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_229, 0.2125999927520751953125, _233);
    float _255 = in.m_50.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_231, 0.072200000286102294921875, _253);
    bool _263 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _265 = 1.0 / _261;
    float _267 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_263)
    {
        float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _271 = _161 + _269;
        _225 = _271;
    }
    float _273 = _225;
    float _275 = _265 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_277, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _281 = _89 * _239;
    if (_263)
    {
        float _283 = _273 * 8.0;
        float _285 = precise::clamp(_283, 0.0, 1.0);
        _267 = _285;
    }
    float _287 = _267;
    float _289 = _89 * _251;
    float _291 = _279 * _281;
    float _293 = 0.0 + _193;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _89 * _245;
    float _299 = _89 * _259;
    float _301 = fma(_227, _291, _289);
    float _303 = _295;
    if (_263)
    {
        float _305 = _295 * _287;
        _303 = _305;
    }
    float _307 = _303;
    float _309 = fma(_229, _291, _297);
    float _311 = fma(_231, _291, _299);
    float _313 = 0.0 + _307;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    out.m_48.x = _309;
    out.m_48.y = _301;
    out.m_48.z = _311;
    out.m_48.w = _315;
    return out;
}

