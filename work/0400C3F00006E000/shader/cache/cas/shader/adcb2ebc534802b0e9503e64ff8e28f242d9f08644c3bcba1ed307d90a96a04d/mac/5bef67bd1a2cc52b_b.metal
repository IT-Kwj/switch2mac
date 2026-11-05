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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_33.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _59;
    float _81 = _79 * _65;
    float _83 = _79 * _71;
    float _85 = _79 * _77;
    float _87 = 1.0 / _81;
    float _89 = _83 * _87;
    float _91 = _85 * _87;
    float2 _513 = float2(_89, _91);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_513, float2(0.0), isnan(_513))).x;
    float _95 = in.m_35.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_35.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_35.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_37.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_37.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_37.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_33.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_39.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_43.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _157 = _79 * _99;
    float _159 = _79 * _105;
    float _161 = _79 * _111;
    float _163 = _157 * _157;
    float _165 = fma(_159, _159, _163);
    float _167 = fma(_161, _161, _165);
    float _169 = _79 * _117;
    float _171 = rsqrt(_167);
    float _173 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _175 = _173 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _177 = 1.0 / _175;
    float _179 = _157 * _171;
    float _181 = _79 * _123;
    float _183 = _161 * _171;
    float _185 = _169 * _179;
    float _187 = _159 * _171;
    float _189 = _79 * _135;
    float _191 = in.m_45.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = fma(_181, _187, _185);
    float _199 = _79 * _129;
    float _201 = _189 * _87;
    float _203 = _79 * _147;
    float _205 = fma(_199, _183, _197);
    float _207 = _79 * _141;
    float _209 = abs(_205);
    float _211 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_201, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = _207 * _203;
    float _221 = _213 * _177;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _79 * _153;
    float _227 = 1.0 / _217;
    float _229 = fma(_223, -2.0, 3.0);
    float _231 = _223 * _223;
    float _233 = _225 * _225;
    float _235 = _229 * _231;
    float _237 = _219 * _233;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _79 * _195;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _245 = _227 * _243;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _249 = fma(_93, (*spvDescriptorSet0.fp_c8)._m0[30].w, _247);
    float _251 = 1.0 / _249;
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _255 = -_245;
    float _257 = fma(_251, _253, _255);
    float _259 = _257 * _155;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _239 * _261;
    float _265 = _263 * _235;
    float _267 = _265 * _241;
    bool _271 = _267 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _273 = isnan(_267);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _279 = _275 || _277;
    float _281 = in.m_47.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_47.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = _245;
    if (!_279)
    {
        discard_fragment();
    }
    float _295 = in.m_41.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = _79 * _285;
    float _303 = _79 * _291;
    float _305 = in.m_41.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _301 * _301;
    float _313 = fma(_303, _303, _311);
    float _315 = in.m_47.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _79 * _319;
    float _323 = fma(_321, _321, _313);
    float _325 = _79 * _309;
    float _327 = in.m_39.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_39.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = _79 * _331;
    float _341 = -_339;
    float _343 = _341 + _325;
    float _345 = fma(_323, _343, _339);
    float _347 = _79 * _337;
    float _349 = _79 * _299;
    float _351 = in.m_41.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = -_347;
    float _359 = _357 + _349;
    float _361 = fma(_323, _359, _347);
    float _363 = in.m_39.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = _79 * _355;
    float _371 = _79 * _367;
    float _373 = -_371;
    float _375 = _373 + _369;
    float _377 = fma(_323, _375, _371);
    if (!_279)
    {
        out.m_50.x = _345;
        out.m_50.y = _361;
        out.m_50.z = _377;
        out.m_50.w = _239;
        return out;
    }
    float _379 = _361 * 0.715200006961822509765625;
    float _381 = in.m_52.w;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_52.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_52.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = fma(_345, 0.2125999927520751953125, _379);
    float _401 = in.m_52.z;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_377, 0.072200000286102294921875, _399);
    bool _409 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _411 = 1.0 / _407;
    float _413 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_409)
    {
        float _415 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _417 = _245 + _415;
        _293 = _417;
    }
    float _419 = _293;
    float _421 = _411 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = fma(_423, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _427 = _79 * _385;
    if (_409)
    {
        float _429 = _419 * 8.0;
        float _431 = precise::clamp(_429, 0.0, 1.0);
        _413 = _431;
    }
    float _433 = _413;
    float _435 = _79 * _397;
    float _437 = _425 * _427;
    float _439 = 0.0 + _267;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = _79 * _391;
    float _445 = _79 * _405;
    float _447 = fma(_361, _437, _435);
    float _449 = _441;
    if (_409)
    {
        float _451 = _441 * _433;
        _449 = _451;
    }
    float _453 = _449;
    float _455 = fma(_345, _437, _443);
    float _457 = fma(_377, _437, _445);
    float _459 = 0.0 + _453;
    float _461 = precise::clamp(_459, 0.0, 1.0);
    out.m_50.x = _455;
    out.m_50.y = _447;
    out.m_50.z = _457;
    out.m_50.w = _461;
    return out;
}

