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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _59;
    float _93 = _91 * _65;
    float _95 = _91 * _71;
    float _97 = _91 * _77;
    float _99 = _91 * _89;
    float _101 = 1.0 / _93;
    float _103 = _95 * _101;
    float _105 = _97 * _101;
    float _107 = _91 * _83;
    float2 _501 = float2(_103, _105);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_501, float2(0.0), isnan(_501))).x;
    float2 _512 = float2(_107, _99);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).w;
    float _113 = in.m_39.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_39.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_41.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_41.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_35.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _91 * _117;
    float _157 = _91 * _123;
    float _159 = _91 * _129;
    float _161 = _155 * _155;
    float _163 = fma(_157, _157, _161);
    float _165 = fma(_159, _159, _163);
    float _167 = rsqrt(_165);
    float _169 = _91 * _135;
    float _171 = _155 * _167;
    float _173 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _175 = _173 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _177 = _157 * _167;
    float _179 = _159 * _167;
    float _181 = _169 * _171;
    float _183 = _91 * _141;
    float _185 = 1.0 / _175;
    float _187 = fma(_183, _177, _181);
    float _189 = _91 * _147;
    float _191 = in.m_43.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = fma(_189, _179, _187);
    float _199 = _91 * _153;
    float _201 = in.m_45.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = abs(_197);
    float _209 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _211 = _207 + _209;
    float _213 = _199 * _101;
    float _215 = _211 * _185;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _221 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
    float _223 = in.m_47.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = fma(_217, -2.0, 3.0);
    float _231 = _217 * _217;
    float _233 = 1.0 / _221;
    float _235 = _229 * _231;
    float _237 = _91 * _195;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _241 = _233 * _239;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _245 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[30].w, _243);
    float _247 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _249 = _111 * _237;
    float _251 = _91 * _205;
    float _253 = _251 * _249;
    float _255 = 1.0 / _245;
    float _257 = 0.0 + _253;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _263 = -_241;
    float _265 = fma(_255, _261, _263);
    float _267 = _91 * _227;
    float _269 = _265 * _247;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _259 * _271;
    float _275 = _273 * _235;
    float _277 = _275 * _267;
    bool _281 = _277 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _283 = isnan(_277);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _289 = _285 || _287;
    float _291 = in.m_43.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = _241;
    float _299 = _277;
    if (!_289)
    {
        discard_fragment();
    }
    float _301 = in.m_45.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_43.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _91 * _295;
    float _315 = in.m_45.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _91 * _305;
    float _323 = _321 * _313;
    float _325 = _91 * _319;
    float _327 = _91 * _311;
    float _329 = in.m_43.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = _325 * _327;
    float _337 = in.m_45.z;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = _91 * _333;
    float _345 = _91 * _341;
    float _347 = _345 * _343;
    if (!_289)
    {
        out.m_50.x = _323;
        out.m_50.y = _335;
        out.m_50.z = _347;
        out.m_50.w = _253;
        return out;
    }
    float _349 = _335 * 0.715200006961822509765625;
    float _351 = in.m_52.w;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_52.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_52.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = fma(_323, 0.2125999927520751953125, _349);
    float _371 = in.m_52.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = fma(_347, 0.072200000286102294921875, _369);
    bool _379 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _381 = 1.0 / _377;
    if (_379)
    {
        float _383 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _385 = _241 + _383;
        _297 = _385;
    }
    float _387 = _297;
    float _389 = _381 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = fma(_391, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _395 = _91 * _355;
    float _397 = _91 * _361;
    float _399 = _393 * _395;
    float _401 = 0.0 + _277;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = _403;
    if (_379)
    {
        float _407 = _387 * 8.0;
        float _409 = precise::clamp(_407, 0.0, 1.0);
        _299 = _409;
    }
    float _411 = _299;
    float _413 = _91 * _367;
    float _415 = _91 * _375;
    float _417 = fma(_323, _399, _397);
    if (_379)
    {
        float _419 = _403 * _411;
        _405 = _419;
    }
    float _421 = _405;
    float _423 = fma(_335, _399, _413);
    float _425 = fma(_347, _399, _415);
    float _427 = 0.0 + _421;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    out.m_50.x = _417;
    out.m_50.y = _423;
    out.m_50.z = _425;
    out.m_50.w = _429;
    return out;
}

