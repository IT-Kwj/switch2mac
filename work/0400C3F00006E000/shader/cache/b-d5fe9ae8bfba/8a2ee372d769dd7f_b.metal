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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _59;
    float _105 = _103 * _65;
    float _107 = _103 * _71;
    float _109 = _103 * _77;
    float _111 = _103 * _89;
    float _113 = 1.0 / _105;
    float _115 = _103 * _95;
    float _117 = _107 * _113;
    float _119 = _109 * _113;
    float _121 = _103 * _83;
    float _123 = _103 * _101;
    float2 _476 = float2(_117, _119);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_476, float2(0.0), isnan(_476))).x;
    float2 _487 = float2(_121, _111);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_487, float2(0.0), isnan(_487))).w;
    float2 _495 = float2(_115, _123);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).w;
    float _131 = in.m_37.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_41.x;
    float _139 = in.m_43.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_45.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _103 * _135;
    float _153 = in.m_47.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _151 * _113;
    float _161 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _161);
    float _165 = _137 + (-0.300000011920928955078125);
    float _167 = 1.0 / _163;
    float _169 = _103 * _149;
    float _171 = in.m_43.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _179 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _177);
    float _181 = precise::max(_165, _127);
    float _183 = 1.0 / _179;
    float _185 = precise::min(_137, _181);
    float _187 = _103 * _143;
    float _189 = -_187;
    float _191 = _129 + _189;
    float _193 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _195 = -_165;
    float _197 = _195 + _185;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _201 = _167 * _199;
    float _203 = _169 * _191;
    float _205 = _197 * 3.3333332538604736328125;
    float _207 = _103 * _157;
    float _209 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _211 = -_201;
    float _213 = fma(_183, _209, _211);
    float _215 = _203 * _205;
    float _217 = 0.0 + _215;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _213 * _193;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _219 * _223;
    float _227 = _225 * _207;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_45.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_45.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_45.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_43.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_43.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _201;
    if (!_239)
    {
        discard_fragment();
    }
    float _273 = -_129;
    float _275 = _273 + 1.0;
    float _277 = _103 * _245;
    float _279 = _103 * _251;
    float _281 = _103 * _257;
    float _283 = _277 * _275;
    float _285 = _279 * _275;
    float _287 = _281 * _275;
    float _289 = _103 * _263;
    float _291 = _103 * _175;
    float _293 = _103 * _269;
    float _295 = fma(_129, _289, _285);
    float _297 = fma(_129, _291, _283);
    float _299 = fma(_129, _293, _287);
    if (!_239)
    {
        out.m_50.x = _295;
        out.m_50.y = _297;
        out.m_50.z = _299;
        out.m_50.w = _215;
        return out;
    }
    float _301 = _297 * 0.715200006961822509765625;
    float _303 = in.m_52.w;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_52.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_52.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = fma(_295, 0.2125999927520751953125, _301);
    float _323 = in.m_52.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = fma(_299, 0.072200000286102294921875, _321);
    bool _331 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _333 = 1.0 / _329;
    float _335 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_331)
    {
        float _337 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _339 = _201 + _337;
        _271 = _339;
    }
    float _341 = _271;
    float _343 = _333 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_345, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _349 = _103 * _307;
    if (_331)
    {
        float _351 = _341 * 8.0;
        float _353 = precise::clamp(_351, 0.0, 1.0);
        _335 = _353;
    }
    float _355 = _335;
    float _357 = _103 * _319;
    float _359 = _347 * _349;
    float _361 = 0.0 + _227;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _103 * _313;
    float _367 = _103 * _327;
    float _369 = fma(_297, _359, _357);
    float _371 = _363;
    if (_331)
    {
        float _373 = _363 * _355;
        _371 = _373;
    }
    float _375 = _371;
    float _377 = fma(_295, _359, _365);
    float _379 = fma(_299, _359, _367);
    float _381 = 0.0 + _375;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    out.m_50.x = _377;
    out.m_50.y = _369;
    out.m_50.z = _379;
    out.m_50.w = _383;
    return out;
}

