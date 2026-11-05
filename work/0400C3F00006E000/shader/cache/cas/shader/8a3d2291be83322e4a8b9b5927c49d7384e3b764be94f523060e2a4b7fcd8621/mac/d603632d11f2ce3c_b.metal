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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_35 [[user(locn3), flat]];
    float4 m_31 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_31.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_31.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_31.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = 1.0 / _73;
    float _81 = _75 * _79;
    float _83 = _77 * _79;
    float _85 = fma(_81, 0.5, 0.5);
    float _87 = fma(_83, -0.5, 0.5);
    float2 _658 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).x;
    float _91 = in.m_33.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_33.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_33.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_35.x;
    float _111 = in.m_37.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_37.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_37.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _71 * _95;
    float _131 = _71 * _101;
    float _133 = _71 * _107;
    int _136 = as_type<int>(_109) * 96;
    float _138 = _129 * _129;
    float _140 = _71 * _115;
    float _142 = _71 * _121;
    int _144 = _136 + 12;
    uint _147 = uint(int(uint(_144) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.fp_c4)._m0[int(_149)][_151];
    float _155 = fma(_131, _131, _138);
    float _157 = _140 * _140;
    float _159 = _71 * _127;
    float _161 = fma(_133, _133, _155);
    float _163 = fma(_142, _142, _157);
    float _165 = fma(_159, _159, _163);
    float _167 = rsqrt(_161);
    float _169 = -_153;
    float _171 = fma(_169, _153, _165);
    float _173 = _129 * _167;
    float _175 = _131 * _167;
    float _177 = _133 * _167;
    float _179 = _140 * _173;
    float _181 = _173 * _173;
    float _183 = fma(_142, _175, _179);
    float _185 = fma(_175, _175, _181);
    float _187 = fma(_159, _177, _183);
    float _189 = fma(_177, _177, _185);
    float _191 = _187 * 2.0;
    float _193 = _189 * _171;
    float _195 = _193 * 4.0;
    float _197 = _189 * 2.0;
    int _199 = _136 + 80;
    uint _201 = uint(int(uint(_199) >> uint(2)));
    uint _203 = uint(int(uint(int(_201)) >> uint(2)));
    int _205 = int(_201) & 3;
    float _207 = (*spvDescriptorSet0.fp_c4)._m0[int(_203)][_205];
    int _209 = int(_201) + 1;
    uint _211 = uint(int(uint(_209) >> uint(2)));
    int _213 = _209 & 3;
    float _215 = (*spvDescriptorSet0.fp_c4)._m0[int(_211)][_213];
    float _217 = -_195;
    float _219 = fma(_191, _191, _217);
    float _221 = _83 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _223 = _83 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _225 = 1.0 / _197;
    float _227 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[6].x, _221);
    float _229 = sqrt(_219);
    float _231 = -_191;
    float _233 = -_229;
    float _235 = _231 + _233;
    float _237 = -_191;
    float _239 = _237 + _229;
    float _241 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, _223);
    int _243 = _136 + 88;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    uint _247 = uint(int(uint(int(_245)) >> uint(2)));
    int _249 = int(_245) & 3;
    float _251 = (*spvDescriptorSet0.fp_c4)._m0[int(_247)][_249];
    int _253 = int(_245) + 1;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    int _257 = _253 & 3;
    float _259 = (*spvDescriptorSet0.fp_c4)._m0[int(_255)][_257];
    float _261 = _239 * _225;
    float _263 = _235 * _225;
    float _265 = precise::max(_261, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _267 = precise::max(_263, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _269 = fma(_173, _267, _140);
    float _271 = _269 * _215;
    float _273 = fma(_89, 2.0, -1.0);
    float _275 = fma(_173, _265, _140);
    float _277 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[7].z, _241);
    float _279 = _275 * _215;
    float _281 = fma(_175, _265, _142);
    float _283 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[6].z, _227);
    float _285 = _277 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _287 = fma(_175, _267, _142);
    float _289 = fma(_177, _267, _159);
    float _291 = fma(_281, _207, _279);
    float _293 = fma(_177, _265, _159);
    float _295 = fma(_287, _207, _271);
    float _297 = 1.0 / _285;
    float _299 = _283 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _301 = fma(_293, _251, _291);
    float _303 = fma(_289, _251, _295);
    float _305 = _303 + _259;
    float _307 = _301 + _259;
    float _309 = _299 * _297;
    bool _313 = _305 >= _309;
    bool _315 = isnan(_305);
    bool _317 = _313 || _315;
    bool _319 = isnan(_309);
    bool _321 = _317 || _319;
    bool _323 = _307 < _309;
    bool _325 = !_321;
    bool _327 = _323 && _325;
    float _329 = in.m_39.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_39.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_39.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    if (_327)
    {
        discard_fragment();
    }
    float _347 = 1.0 / _153;
    bool _349 = _307 < _309;
    float _351 = _71 * _333;
    float _353 = _71 * _339;
    float _355 = _71 * _345;
    float _357 = _351 * _351;
    float _359 = fma(_353, _353, _357);
    float _361 = fma(_355, _355, _359);
    float _363 = -_142;
    float _365 = -_179;
    float _367 = fma(_363, _175, _365);
    float _369 = rsqrt(_361);
    float _371 = -_159;
    float _373 = fma(_371, _177, _367);
    float _375 = _351 * _369;
    float _377 = 1.0 / _189;
    float _379 = _373 * _377;
    float _381 = in.m_41.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = precise::max(0.0, _379);
    float _389 = fma(_173, _387, _140);
    float _391 = fma(_175, _387, _142);
    float _393 = fma(_177, _387, _159);
    float _395 = _389 * _389;
    float _397 = fma(_391, _391, _395);
    float _399 = fma(_393, _393, _397);
    float _401 = sqrt(_399);
    float _403 = fma((*spvDescriptorSet0.fp_c3)._m0[12].x, 0.07999999821186065673828125, 0.0199999995529651641845703125);
    float _405 = _403 * 100.0;
    float _407 = 1.0 / _403;
    float _409 = _71 * _385;
    float _411 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _413 = _409 + _411;
    float _415 = _401 * _347;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = exp2(_405);
    float _421 = _403 * 5115.0;
    float _423 = fma(_419, 512.0, -512.0);
    float _425 = precise::max(0.0, _413);
    float _427 = 1.0 / _423;
    float _429 = _421 * _427;
    float _431 = log2(_429);
    float _433 = fma(_431, _407, 100.0);
    float _435 = -_433;
    float _437 = _435 + _425;
    if (!_321)
    {
        if (_349)
        {
            out.m_44.x = 0.0;
            out.m_44.y = 0.0;
            out.m_44.z = 0.0;
            out.m_44.w = 0.0;
            return out;
        }
    }
    float _439 = precise::min(_305, _307);
    float _441 = _403 * _437;
    float _443 = precise::max(_305, _307);
    float _445 = -_417;
    float _447 = _445 + 1.0;
    float _449 = precise::max(_309, _439);
    float _451 = precise::max(_309, _443);
    float _453 = -_441;
    float _455 = exp2(_453);
    float _457 = -_449;
    float _459 = _457 + _451;
    float _461 = _375 * _459;
    int _463 = as_type<int>(_109) * 96;
    int _465 = _463 + 28;
    float _467 = fma((*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].y, 1.0);
    float _469 = abs(_447);
    float _471 = log2(_469);
    float _473 = abs(_461);
    bool _475 = _473 > 0.00999999977648258209228515625;
    uint _477 = uint(int(uint(_465) >> uint(2)));
    uint _479 = uint(int(uint(int(_477)) >> uint(2)));
    int _481 = int(_477) & 3;
    float _483 = (*spvDescriptorSet0.fp_c4)._m0[int(_479)][_481];
    float _485 = _475 ? _461 : 0.00999999977648258209228515625;
    float _487 = fma((*spvDescriptorSet0.fp_c3)._m0[12].y, -2.0, _467);
    float _489 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _491 = fma(_489, (*spvDescriptorSet0.fp_c3)._m0[12].y, 1.0);
    float _493 = _403 * _485;
    float _495 = abs(_487);
    float _497 = log2(_495);
    float _499 = precise::max(_493, -127.0);
    float _501 = -_499;
    float _503 = exp2(_501);
    float _505 = fma((*spvDescriptorSet0.fp_c3)._m0[11].w, -0.99447572231292724609375, 1.0);
    float _507 = 1.0 / _499;
    float _509 = _497 * 1.5;
    float _511 = log2(_505);
    float _513 = -_503;
    float _515 = _513 + 1.0;
    float _517 = _455 * _515;
    float _519 = exp2(_509);
    float _521 = _517 * _507;
    int _523 = _465 + (-12);
    uint _525 = uint(int(uint(_523) >> uint(2)));
    uint _527 = uint(int(uint(int(_525)) >> uint(2)));
    int _529 = int(_525) & 3;
    float _531 = (*spvDescriptorSet0.fp_c4)._m0[int(_527)][_529];
    float _533 = _511 * (-0.0199999995529651641845703125);
    int _535 = _465 + (-4);
    uint _537 = uint(int(uint(_535) >> uint(2)));
    uint _539 = uint(int(uint(int(_537)) >> uint(2)));
    int _541 = int(_537) & 3;
    float _543 = (*spvDescriptorSet0.fp_c4)._m0[int(_539)][_541];
    float _545 = _533 * _521;
    float _547 = _459 * _545;
    float _549 = _519 * 12.56637096405029296875;
    float _551 = _471 * _483;
    int _553 = _465 + (-8);
    uint _555 = uint(int(uint(_553) >> uint(2)));
    uint _557 = uint(int(uint(int(_555)) >> uint(2)));
    int _559 = int(_555) & 3;
    float _561 = (*spvDescriptorSet0.fp_c4)._m0[int(_557)][_559];
    float _563 = -_547;
    float _565 = exp2(_563);
    float _567 = 1.0 / _549;
    float _569 = exp2(_551);
    float _571 = -_565;
    float _573 = _571 + 1.0;
    float _575 = precise::min(_573, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _577 = _491 * _567;
    float _579 = _575 * _577;
    float _581 = _561 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _583 = 0.0 + _569;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _579 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _589 = _543 * (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _591 = _587 * _585;
    float _593 = _531 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _595 = _581 * _591;
    float _597 = _593 * _591;
    float _599 = _589 * _591;
    out.m_44.x = _597;
    out.m_44.y = _595;
    out.m_44.z = _599;
    out.m_44.w = 0.0;
    return out;
}

