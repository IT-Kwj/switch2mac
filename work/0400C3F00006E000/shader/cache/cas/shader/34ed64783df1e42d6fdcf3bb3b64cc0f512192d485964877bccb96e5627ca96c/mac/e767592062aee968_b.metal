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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
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
    float4 m_52 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _405 = float2(_75, _77);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _73 * _85;
    float _101 = _73 * _91;
    float _103 = _73 * _97;
    float _105 = _99 * _99;
    float _107 = fma(_105, -0.070000000298023223876953125, 0.070000000298023223876953125);
    float _109 = fma(_79, _107, _101);
    float2 _458 = float2(_109, _103);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).w;
    float _113 = in.m_41.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_43.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = precise::max(_105, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _127 = sqrt(_99);
    float _129 = in.m_45.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _137 = (*spvDescriptorSet0.fp_c9)._m0[191].z + _135;
    float _139 = precise::min(_125, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _141 = 1.0 / _137;
    float _143 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _145 = _139 + _143;
    float _147 = sqrt(_127);
    float _149 = _145 * _141;
    float _151 = _73 * _117;
    float _153 = _149 * _149;
    float _155 = _73 * _123;
    float _157 = _151 + 0.1500000059604644775390625;
    float _159 = _155 * _153;
    float _161 = in.m_41.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_43.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_41.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _73 * _177;
    float _181 = precise::max(_151, _111);
    float _183 = precise::min(_157, _181);
    float _185 = -_151;
    float _187 = _185 + _183;
    float _189 = _147 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _191 = _187 * 6.666666507720947265625;
    float _193 = fma(_191, _189, _159);
    float _195 = _73 * _133;
    float _197 = 0.0 + _193;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = _199 * _195;
    bool _205 = _201 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _207 = isnan(_201);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _213 = _209 || _211;
    float _215 = in.m_41.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_43.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_43.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    if (!_213)
    {
        discard_fragment();
    }
    float _233 = _73 * _219;
    float _235 = _73 * _225;
    float _237 = _73 * _231;
    float _239 = _73 * _165;
    float _241 = _73 * _171;
    float _243 = -_237;
    float _245 = _243 + _233;
    float _247 = -_235;
    float _249 = _247 + _239;
    float _251 = -_241;
    float _253 = _251 + _179;
    float _255 = fma(_199, _245, _237);
    float _257 = fma(_199, _249, _235);
    float _259 = fma(_199, _253, _241);
    if (!_213)
    {
        out.m_48.x = _255;
        out.m_48.y = _257;
        out.m_48.z = _259;
        out.m_48.w = _193;
        return out;
    }
    float _261 = _257 * 0.715200006961822509765625;
    float _263 = in.m_50.w;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_50.z;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_50.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = fma(_255, 0.2125999927520751953125, _261);
    float _283 = in.m_50.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = fma(_259, 0.072200000286102294921875, _281);
    bool _291 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _293 = 1.0 / _289;
    float _295 = _293 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_297, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _301 = _73 * _267;
    float _303 = _73 * _273;
    float _305 = _299 * _301;
    float _307 = 0.0 + _201;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _73 * _279;
    float _313 = _73 * _287;
    float _315 = fma(_259, _305, _303);
    float _317 = fma(_255, _305, _311);
    float _319 = fma(_257, _305, _313);
    float _321 = _303;
    if (!_291)
    {
        _321 = _309;
    }
    float _323 = _321;
    bool _325 = !_291;
    float _327 = _323;
    if (!_325)
    {
        float _329 = in.m_52.w;
        float _331 = gl_FragCoord.w;
        float _333 = _329 * _331;
        float _335 = in.m_52.z;
        float _337 = gl_FragCoord.w;
        float _339 = _335 * _337;
        float _341 = _73 * _333;
        float _343 = _73 * _339;
        float _345 = 1.0 / _341;
        float _347 = _343 * _345;
        float _349 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _351 = fma(_347, (*spvDescriptorSet0.fp_c8)._m0[30].w, _349);
        float _353 = 1.0 / _351;
        float _355 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _357 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _359 = fma(_353, _355, _357);
        float _361 = _359 * 8.0;
        float _363 = precise::clamp(_361, 0.0, 1.0);
        float _365 = _309 * _363;
        _327 = _365;
    }
    float _367 = _327;
    float _369 = 0.0 + _367;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    out.m_48.x = _317;
    out.m_48.y = _319;
    out.m_48.z = _315;
    out.m_48.w = _371;
    return out;
}

