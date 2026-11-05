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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c10 [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_1ESmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_58 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_54 [[user(locn5), flat]];
    float4 m_35 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_39 [[user(locn9)]];
    float4 m_56 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_41.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_37.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_37.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_41.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_43.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_39.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = 1.0 / _65;
    float _141 = _139 * _71;
    float _143 = _139 * _77;
    float _145 = _139 * _83;
    float _147 = _139 * _125;
    float _149 = _141 * _141;
    float _151 = fma(_143, _143, _149);
    float _153 = fma(_145, _145, _151);
    float _155 = rsqrt(_153);
    float _157 = _141 * _155;
    float _159 = _143 * _155;
    float _161 = _145 * _155;
    float _163 = _157 * _157;
    float _165 = fma(_159, _159, _163);
    float _167 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _169 = fma(_161, _161, _165);
    float _171 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _167);
    float _173 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _171);
    float _175 = rsqrt(_169);
    float _177 = _139 * _101;
    float _179 = rsqrt(_173);
    float _181 = _157 * _175;
    float _183 = _159 * _175;
    float _185 = _161 * _175;
    float _187 = _139 * _113;
    float _189 = _181 * _181;
    float _191 = fma(_183, _183, _189);
    float _193 = _179 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _195 = fma(_185, _185, _191);
    float _197 = rsqrt(_195);
    float _199 = _181 * _197;
    float _201 = _185 * _197;
    float _203 = _183 * _197;
    float _205 = _139 * _89;
    float _207 = _199 * (-0.816474258899688720703125);
    float _209 = -_205;
    float _211 = _209 + _177;
    float _213 = -_207;
    float _215 = fma(_201, 0.577381789684295654296875, _213);
    float _217 = _139 * _107;
    float _219 = _139 * _119;
    float _221 = _199 * _193;
    float _223 = fma(_215, 0.5, 0.5);
    float _225 = _139 * _95;
    float _227 = -_217;
    float _229 = _227 + _187;
    float _231 = -_219;
    float _233 = _231 + _147;
    float _235 = _223 * _223;
    bool _239 = _225 != 1.0;
    bool _241 = isnan(_225);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = fma(_235, _211, _205);
    float _251 = fma(_235, _229, _217);
    float _253 = fma(_235, _233, _219);
    float _255 = _179 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _257 = _139 * _131;
    bool _259 = !_247;
    if (!_259)
    {
        float _261 = gl_FragCoord.x;
        float _263 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _265 = _261 / _263;
        float _267 = gl_FragCoord.y;
        float _269 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _271 = _267 / _269;
        float _273 = _225 * 256.0;
        float _275 = trunc(_273);
        int _278 = int(_275);
        uint _281 = uint(int(uint(_278) >> uint(7)));
        int _283 = int(_281) + _278;
        float _285 = trunc(_265);
        int _287 = int(_285);
        float _289 = trunc(_271);
        int _291 = int(_289);
        int _293 = _287 + 2;
        int _295 = _293 >> 1;
        uint _297 = uint(int(uint(_291) >> uint(1)));
        int _299 = _295 ^ int(_297);
        int _301 = _299 << 16;
        int _303 = _301 ^ _295;
        int _305 = 983055 & _303;
        int _307 = _305 << 6;
        int _309 = _307 + _305;
        int _311 = _309 & 13369548;
        uint _313 = uint(int(uint(_311) >> uint(3)));
        int _315 = _311 | int(_313);
        int _317 = _315 & 5570560;
        int _319 = _315 & 85;
        uint _321 = uint(int(uint(_317) >> uint(15)));
        int _323 = int(_321) + _319;
        bool _325 = uint(_283) > uint(_323);
        if (!_325)
        {
            discard_fragment();
        }
        if (!_325)
        {
            out.m_46.x = _249;
            out.m_46.y = _251;
            out.m_46.z = _253;
            out.m_46.w = _257;
            return out;
        }
    }
    float _327 = abs(_159);
    float _329 = abs(_157);
    float _331 = precise::max(_327, _329);
    float _333 = fma(_203, _255, _221);
    float _335 = _179 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _337 = -_235;
    float _339 = _337 + 1.0;
    float _341 = abs(_161);
    float _343 = precise::max(_341, _331);
    float _345 = fma(_201, _335, _333);
    float _347 = _139 * _137;
    float _349 = -_339;
    float _351 = fma(_349, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _353 = fma(_345, -0.5, 0.5);
    float _355 = 1.0 / _343;
    float _357 = fma(_353, (*spvDescriptorSet0.fp_c9)._m0[191].z, _351);
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = -_359;
    float _363 = _361 + 1.0;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _347 + _365;
    float _369 = _159 * _355;
    float _371 = _157 * _355;
    float _373 = -_355;
    float _375 = _161 * _373;
    float _377 = precise::min(_367, 1.0);
    float3 _1108 = float3(_369, _371, _375);
    float3 _381 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1108, float3(0.0), isnan(_1108)), level(_377)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1108, float3(0.0), isnan(_1108)), level(_377)).xyz;
    float _383 = _381.x;
    float _385 = _381.y;
    float _387 = _381.z;
    float _389 = in.m_48.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_48.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_48.z;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_50.x;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_50.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_50.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_52.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_52.z;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_52.y;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    bool _443 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _445 = _139 * _393;
    float _447 = _139 * _399;
    float _449 = -_445;
    float _451 = _449 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _453 = _139 * _405;
    float _455 = -_447;
    float _457 = _455 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _459 = _451 * _451;
    float _461 = -_453;
    float _463 = _461 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _465 = in.m_54.x;
    float _467 = fma(_457, _457, _459);
    float _469 = fma(_463, _463, _467);
    float _471 = rsqrt(_469);
    float _473 = _451 * _471;
    float _475 = _457 * _471;
    float _477 = _463 * _471;
    float _479 = _139 * _423;
    float _481 = _199 * _473;
    float _483 = fma(_203, _475, _481);
    float _485 = in.m_56.w;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = fma(_201, _477, _483);
    float _493 = in.m_56.z;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = fma(_491, 0.5, 0.5);
    float _501 = precise::max(_499, 0.20000000298023223876953125);
    float _503 = precise::min(_501, 1.0);
    float _505 = fma(_503, 1.25, -0.25);
    float _507 = in.m_56.x;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = _465 * _505;
    float _515 = _513 * 0.56862747669219970703125;
    float _517 = _515 * 0.715200006961822509765625;
    float _519 = _139 * _489;
    float _521 = fma(_513, 0.2125999927520751953125, _517);
    float _523 = in.m_56.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = 1.0 / _521;
    float _531 = _529 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _533 = precise::clamp(_531, 0.0, 1.0);
    float _535 = fma(_533, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _537 = _139 * _411;
    float _539 = _139 * _417;
    float _541 = _513 * _535;
    float _543 = _515 * _535;
    float _545 = _139 * _429;
    float _547 = _139 * _435;
    float _549 = _139 * _527;
    float _551 = fma(_383, 0.20999999344348907470703125, _537);
    float _553 = fma(_385, 0.20999999344348907470703125, _539);
    float _555 = fma(_387, 0.20999999344348907470703125, _479);
    float _557 = _139 * _441;
    float _559 = _551 + _545;
    float _561 = _555 + _547;
    float _563 = _553 + _557;
    float _565 = 0.0 + _257;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    float _569 = fma(_249, _559, _541);
    float _571 = _139 * _511;
    float _573 = _253 * _561;
    float _575 = fma(_251, _563, _543);
    float _577 = _139 * _497;
    float _579 = fma(_569, _519, _571);
    float _581 = _571;
    if (!_443)
    {
        _581 = _567;
    }
    float _583 = _581;
    float _585 = fma(_575, _519, _549);
    float _587 = fma(_573, _519, _577);
    bool _589 = !_443;
    float _591 = _583;
    if (!_589)
    {
        float _593 = in.m_58.w;
        float _595 = gl_FragCoord.w;
        float _597 = _593 * _595;
        float _599 = in.m_58.z;
        float _601 = gl_FragCoord.w;
        float _603 = _599 * _601;
        float _605 = _139 * _597;
        float _607 = _139 * _603;
        float _609 = 1.0 / _605;
        float _611 = _607 * _609;
        float _613 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _615 = fma(_611, (*spvDescriptorSet0.fp_c8)._m0[30].w, _613);
        float _617 = 1.0 / _615;
        float _619 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _621 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _623 = fma(_617, _619, _621);
        float _625 = _623 * 8.0;
        float _627 = precise::clamp(_625, 0.0, 1.0);
        float _629 = _567 * _627;
        _591 = _629;
    }
    float _631 = _591;
    float _633 = 0.0 + _631;
    float _635 = precise::clamp(_633, 0.0, 1.0);
    out.m_46.x = _579;
    out.m_46.y = _585;
    out.m_46.z = _587;
    out.m_46.w = _635;
    return out;
}

