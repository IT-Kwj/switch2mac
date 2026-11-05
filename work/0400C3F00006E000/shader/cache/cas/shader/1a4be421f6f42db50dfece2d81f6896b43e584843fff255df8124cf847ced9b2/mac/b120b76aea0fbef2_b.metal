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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_52 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_48 [[user(locn4), flat]];
    float4 m_44 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_50 [[user(locn7), flat]];
    float4 m_46 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _59;
    float _81 = _79 * _65;
    float _83 = _79 * _71;
    float _85 = _79 * _77;
    float _87 = _81 * _83;
    float _89 = 0.0 + _87;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = _91 * _85;
    bool _97 = _93 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _99 = isnan(_93);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _105 = _101 || _103;
    float _107 = in.m_37.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_35.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_35.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_37.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_35.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_37.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _93;
    if (!_105)
    {
        discard_fragment();
    }
    float _145 = _79 * _111;
    float _147 = _79 * _117;
    float _149 = _79 * _123;
    float _151 = _79 * _129;
    float _153 = _79 * _135;
    float _155 = _79 * _141;
    float _157 = _149 * _145;
    float _159 = _147 * _151;
    float _161 = _153 * _155;
    if (!_105)
    {
        out.m_42.x = _157;
        out.m_42.y = _159;
        out.m_42.z = _161;
        out.m_42.w = _87;
        return out;
    }
    float _163 = in.m_44.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_44.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_44.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _79 * _167;
    float _183 = _79 * _173;
    float _185 = _79 * _179;
    float _187 = 1.0 / _181;
    float _189 = _183 * _187;
    float _191 = _185 * _187;
    float2 _560 = float2(_189, _191);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_560, float2(0.0), isnan(_560))).x;
    float _195 = in.m_46.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_46.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_48.y;
    float _209 = in.m_48.x;
    float _211 = in.m_46.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_44.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_48.z;
    float _225 = in.m_50.x;
    float _227 = _159 * 0.715200006961822509765625;
    float _229 = fma(_157, 0.2125999927520751953125, _227);
    float _231 = fma(_161, 0.072200000286102294921875, _229);
    float _233 = 1.0 / _231;
    float _235 = _79 * _199;
    float _237 = _79 * _205;
    float _239 = -_207;
    float _241 = _235 + _239;
    float _243 = -_209;
    float _245 = _237 + _243;
    float _247 = _79 * _215;
    float _249 = _241 * _241;
    float _251 = _79 * _221;
    float _253 = -_223;
    float _255 = _247 + _253;
    float _257 = _233 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_245, _245, _249);
    float _263 = _251 * _187;
    float _265 = in.m_52.w;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = fma(_255, _255, _261);
    float _273 = _225 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _275 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _277 = fma(_263, (*spvDescriptorSet0.fp_c8)._m0[30].w, _275);
    float _279 = fma(_259, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _281 = -_271;
    float _283 = fma(_273, _273, _281);
    float _285 = _157 * _279;
    float _287 = 1.0 / _277;
    float _289 = _159 * _279;
    float _291 = precise::max(0.0, _283);
    float _293 = _161 * _279;
    float _295 = sqrt(_291);
    float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _299 = _287 * _297;
    float _301 = _79 * _269;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _305 = fma(_193, (*spvDescriptorSet0.fp_c8)._m0[30].w, _303);
    float _307 = 1.0 / _305;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _311 = -_299;
    float _313 = fma(_307, _309, _311);
    float _315 = _295 + _313;
    float _317 = -_301;
    float _319 = _315 + _317;
    float _321 = _319 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _323 = _321 * (-1.44269502162933349609375);
    bool _325 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _327 = exp2(_323);
    float _329 = _305;
    if (_325)
    {
        float _331 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _333 = _299 + _331;
        _329 = _333;
    }
    float _335 = _329;
    float _337 = -_327;
    float _339 = _337 + 1.0;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _93 * _341;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = _345;
    if (_325)
    {
        float _349 = _335 * 8.0;
        float _351 = precise::clamp(_349, 0.0, 1.0);
        _143 = _351;
    }
    float _353 = _143;
    if (_325)
    {
        float _355 = _345 * _353;
        _347 = _355;
    }
    float _357 = _347;
    float _359 = 0.0 + _357;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    out.m_42.x = _285;
    out.m_42.y = _289;
    out.m_42.z = _293;
    out.m_42.w = _361;
    return out;
}

