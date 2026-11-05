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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    sampler fp_t_tcb_10Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = 1.0 / _73;
    float _81 = _75 * _79;
    float _83 = _77 * _79;
    float2 _385 = float2(_81, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_385, float2(0.0), isnan(_385))).x;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_33.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_41.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _71 * _91;
    float _125 = _71 * _97;
    float _127 = _71 * _103;
    float _129 = _123 * _123;
    float _131 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _133 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _131;
    float _135 = fma(_125, _125, _129);
    float _137 = 1.0 / _133;
    float _139 = sqrt(_135);
    float _141 = _139 * 2.0;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _127 * _79;
    float _147 = _71 * _115;
    float _149 = -_143;
    float _151 = _149 + 1.0;
    float _153 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _155 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _153);
    float _157 = precise::max(_151, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _159 = 1.0 / _155;
    float _161 = precise::min(_157, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _163 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _165 = _161 + _163;
    float _167 = _165 * _137;
    float _169 = _71 * _109;
    float _171 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _173 = _167 * _169;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _177 = _159 * _175;
    float _179 = _147 * _173;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = in.m_39.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_39.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_37.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _167 * _167;
    float _203 = _71 * _199;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_85, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = 1.0 / _207;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = -_177;
    float _215 = fma(_209, _211, _213);
    float _217 = _215 * _171;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _71 * _121;
    float _223 = _181 * _219;
    float _225 = _223 * _221;
    bool _229 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _237 = _233 || _235;
    float _239 = in.m_39.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_37.y;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_37.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = _201;
    if (!_237)
    {
        discard_fragment();
    }
    float _259 = _71 * _187;
    float _261 = -_201;
    float _263 = _261 + 1.0;
    float _265 = _71 * _193;
    float _267 = _71 * _243;
    float _269 = _71 * _249;
    float _271 = _71 * _255;
    float _273 = _259 * _263;
    float _275 = _267 * _263;
    float _277 = _265 * _263;
    float _279 = fma(_201, _203, _273);
    float _281 = fma(_201, _269, _275);
    float _283 = fma(_201, _271, _277);
    if (!_237)
    {
        out.m_44.x = _279;
        out.m_44.y = _281;
        out.m_44.z = _283;
        out.m_44.w = _181;
        return out;
    }
    float _285 = _281 * 0.715200006961822509765625;
    float _287 = fma(_279, 0.2125999927520751953125, _285);
    float _289 = fma(_283, 0.072200000286102294921875, _287);
    bool _291 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _293 = 1.0 / _289;
    float _295 = 0.0 + _225;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _297;
    if (_291)
    {
        float _301 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _303 = _177 + _301;
        _257 = _303;
    }
    float _305 = _257;
    float _307 = _293 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _305;
    if (_291)
    {
        float _313 = _305 * 8.0;
        float _315 = precise::clamp(_313, 0.0, 1.0);
        _311 = _315;
    }
    float _317 = _311;
    float _319 = fma(_309, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_291)
    {
        float _321 = _297 * _317;
        _299 = _321;
    }
    float _323 = _299;
    float _325 = _279 * _319;
    float _327 = _281 * _319;
    float _329 = _283 * _319;
    float _331 = 0.0 + _323;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    out.m_44.x = _325;
    out.m_44.y = _327;
    out.m_44.z = _329;
    out.m_44.w = _333;
    return out;
}

