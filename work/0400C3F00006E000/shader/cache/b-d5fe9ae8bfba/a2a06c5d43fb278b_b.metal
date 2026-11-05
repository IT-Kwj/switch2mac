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
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _380 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_380, float2(0.0), isnan(_380))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_39.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_39.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _73 * _91;
    float _113 = _73 * _97;
    float _115 = _73 * _103;
    float _117 = _73 * _109;
    float2 _436 = float2(_111, _115);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_436, float2(0.0), isnan(_436))).w;
    float _121 = fma(_83, (*spvDescriptorSet0.fp_c9)._m0[191].x, _117);
    float _123 = fma(_85, (*spvDescriptorSet0.fp_c9)._m0[191].x, _113);
    float2 _457 = float2(_121, _123);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_457, float2(0.0), isnan(_457))).w;
    float _127 = in.m_41.w;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_43.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = -_119;
    float _141 = _139 + 1.0;
    float _143 = _141 * _141;
    float _145 = _73 * _131;
    float _147 = _73 * _137;
    float _149 = in.m_45.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_41.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_41.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_45.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_41.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _73 * _153;
    float _181 = _73 * _159;
    float _183 = _73 * _165;
    float _185 = _73 * _171;
    float _187 = -_179;
    float _189 = _187 + _181;
    float _191 = _125 * _143;
    float _193 = _145 * _191;
    float _195 = 0.0 + _193;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _147;
    bool _203 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _205 = isnan(_199);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _211 = _207 || _209;
    float _213 = in.m_45.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    if (!_211)
    {
        discard_fragment();
    }
    float _219 = fma(_125, _189, _179);
    float _221 = _73 * _217;
    float _223 = _73 * _177;
    float _225 = -_221;
    float _227 = _225 + _183;
    float _229 = -_185;
    float _231 = _229 + _223;
    float _233 = fma(_125, _227, _221);
    float _235 = fma(_125, _231, _185);
    if (!_211)
    {
        out.m_48.x = _219;
        out.m_48.y = _233;
        out.m_48.z = _235;
        out.m_48.w = _193;
        return out;
    }
    float _237 = _233 * 0.715200006961822509765625;
    float _239 = in.m_50.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_50.z;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_50.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = fma(_219, 0.2125999927520751953125, _237);
    float _259 = in.m_50.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = fma(_235, 0.072200000286102294921875, _257);
    bool _267 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _269 = 1.0 / _265;
    float _271 = _269 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_273, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _277 = _73 * _243;
    float _279 = 0.0 + _199;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _73 * _249;
    float _285 = _73 * _263;
    float _287 = _275 * _277;
    float _289 = _73 * _255;
    float _291 = fma(_235, _287, _283);
    float _293 = fma(_219, _287, _289);
    float _295 = fma(_233, _287, _285);
    float _297 = _283;
    if (!_267)
    {
        _297 = _281;
    }
    float _299 = _297;
    bool _301 = !_267;
    float _303 = _299;
    if (!_301)
    {
        float _305 = in.m_52.w;
        float _307 = gl_FragCoord.w;
        float _309 = _305 * _307;
        float _311 = in.m_52.z;
        float _313 = gl_FragCoord.w;
        float _315 = _311 * _313;
        float _317 = _73 * _309;
        float _319 = _73 * _315;
        float _321 = 1.0 / _317;
        float _323 = _319 * _321;
        float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _327 = fma(_323, (*spvDescriptorSet0.fp_c8)._m0[30].w, _325);
        float _329 = 1.0 / _327;
        float _331 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _333 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _335 = fma(_329, _331, _333);
        float _337 = _335 * 8.0;
        float _339 = precise::clamp(_337, 0.0, 1.0);
        float _341 = _281 * _339;
        _303 = _341;
    }
    float _343 = _303;
    float _345 = 0.0 + _343;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    out.m_48.x = _293;
    out.m_48.y = _295;
    out.m_48.z = _291;
    out.m_48.w = _347;
    return out;
}

