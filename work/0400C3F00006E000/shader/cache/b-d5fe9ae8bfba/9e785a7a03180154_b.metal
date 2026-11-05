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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1177 = false;
    bool _1071 = false;
    bool _951 = false;
    bool _713 = false;
    bool _469 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3240 = as_type<float>(_99);
        out.gl_Position.z = _3240;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    float _139 = as_type<float>(_137);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3310 = as_type<float>(_137);
        out.gl_Position.z = _3310;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _147;
    if (!_157)
    {
        float _161 = _147 * _147;
        float _163 = _161 * 0.5;
        _139 = _163;
    }
    float _165 = _139;
    float _167 = 0.0;
    float _169 = _165;
    if (!_157)
    {
        float _171 = _117 * _117;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    if (!_157)
    {
        float _177 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _177;
    }
    float _179 = _169;
    bool _181 = !_157;
    float _183 = _179;
    float _185 = 0.0;
    if (!_181)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _147 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _147);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _203;
        _183 = _215;
        _185 = _205;
    }
    float _217 = _121;
    float _219 = _183;
    float _221 = _185;
    bool _223 = !_157;
    float _225 = _217;
    float _227 = _221;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _147 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _225 = _241;
        _227 = _235;
        _159 = _247;
    }
    float _249 = _225;
    float _251 = _227;
    float _253 = _159;
    float _255 = _251;
    float _257 = _249;
    if (!_157)
    {
        _255 = _117;
    }
    float _259 = _255;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _259;
    if (!_157)
    {
        float _267 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _267;
    }
    float _269 = _257;
    bool _271 = !_157;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _117 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _117);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_157;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _117 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_253, _143, _263);
    float _335 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = fma(_253, _141, _261);
    float _339 = fma(_329, _143, _331);
    float _341 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_329, _141, _335);
    float _347 = -_339;
    float _349 = _333 + _347;
    float _351 = fma(_329, _145, _341);
    float _353 = fma(_253, _145, _343);
    float _355 = -_345;
    float _357 = _337 + _355;
    float _359 = _349 * _349;
    float _361 = in.m_49.w;
    float _363 = -_351;
    float _365 = _353 + _363;
    float _367 = _349 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = fma(_357, _357, _359);
    float _371 = _349 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = _349 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = in.m_42.x;
    float _383 = in.m_42.y;
    float _385 = in.m_42.z;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _391 = sqrt(_377);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _395 = _391 >= 9.9999999747524270787835121154785e-07;
    bool _397 = isnan(_391);
    bool _399 = _395 || _397;
    bool _401 = isnan(9.9999999747524270787835121154785e-07);
    bool _403 = _399 || _401;
    float _405 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _407 = fma(_337, _361, _381);
    float _409 = fma(_333, _361, _383);
    float _411 = fma(_353, _361, _385);
    float _413 = _379;
    float _415 = _365;
    float _417 = _393;
    float _419 = _351;
    float _421 = _339;
    if (_403)
    {
        _413 = _389;
    }
    float _423 = _413;
    float _425 = _423;
    if (_403)
    {
        _415 = _405;
    }
    float _427 = _415;
    float _429 = _427;
    if (!_403)
    {
        bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _433 = !_431;
        if (!_433)
        {
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _445);
            float _453 = _447 * _447;
            float _455 = fma(_449, _449, _453);
            float _457 = fma(_451, _451, _455);
            float _459 = rsqrt(_457);
            float _461 = _459 * 9.9999999747524270787835121154785e-07;
            float _463 = _449 * _461;
            float _465 = _447 * _461;
            float _467 = _451 * _461;
            _429 = _465;
            _425 = _463;
            _417 = _467;
            _469 = true;
        }
        else
        {
            float _471 = _143 * _143;
            float _473 = fma(_141, _141, _471);
            float _475 = fma(_145, _145, _473);
            float _477 = sqrt(_475);
            bool _479 = _477 >= 9.9999999747524270787835121154785e-07;
            bool _481 = isnan(_477);
            bool _483 = _479 || _481;
            bool _485 = isnan(9.9999999747524270787835121154785e-07);
            bool _487 = _483 || _485;
            if (!_487)
            {
                float _489 = _383 * _383;
                float _491 = fma(_381, _381, _489);
                float _493 = fma(_385, _385, _491);
                float _495 = sqrt(_493);
                bool _497 = _495 >= 9.9999999747524270787835121154785e-07;
                bool _499 = isnan(_495);
                bool _501 = _497 || _499;
                bool _503 = isnan(9.9999999747524270787835121154785e-07);
                bool _505 = _501 || _503;
                if (!_505)
                {
                    float _507 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _507);
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _509);
                    float _513 = rsqrt(_511);
                    float _515 = _513 * 9.9999999747524270787835121154785e-07;
                    float _517 = _515 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _519 = _515 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _521 = _515 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _429 = _519;
                    _425 = _517;
                    _417 = _521;
                    _469 = true;
                }
                else
                {
                    float _523 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _529 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
                    float _531 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _525);
                    float _533 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
                    float _535 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
                    float _537 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
                    float _539 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
                    float _541 = _535 * _535;
                    float _543 = fma(_537, _537, _541);
                    float _545 = fma(_539, _539, _543);
                    float _547 = rsqrt(_545);
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    float _551 = _537 * _549;
                    float _553 = _535 * _549;
                    float _555 = _539 * _549;
                    _429 = _553;
                    _425 = _551;
                    _417 = _555;
                    _469 = true;
                }
            }
            else
            {
                float _557 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _559 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _561 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _563 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
                float _565 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
                float _567 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _561);
                float _569 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _563);
                float _571 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _565);
                float _573 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _567);
                float _575 = _569 * _569;
                float _577 = fma(_571, _571, _575);
                float _579 = fma(_573, _573, _577);
                float _581 = rsqrt(_579);
                float _583 = _581 * 9.9999999747524270787835121154785e-07;
                float _585 = _571 * _583;
                float _587 = _569 * _583;
                float _589 = _573 * _583;
                _429 = _587;
                _425 = _585;
                _417 = _589;
            }
        }
    }
    _469 = false;
    float _591 = _429;
    float _593 = _425;
    float _595 = _417;
    float _597 = in.m_51.x;
    float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _601 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _609 = _607 != 0;
    int _611 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _613 = _611 != 0;
    float _615 = _601 * _599;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[20].x, _615);
    float _619 = _617 * 6.283185482025146484375;
    float _621 = floor(_617);
    float _623 = _619 * 0.15915493667125701904296875;
    bool _625 = !_605;
    int _627 = _625 ? 0 : 1;
    int _629 = abs(_627);
    float _631 = _623 * 6.283185482025146484375;
    float _633 = cos(_631);
    bool _635 = !_613;
    int _637 = _635 ? 0 : 1;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _641 = abs(_637);
    float _643 = -_621;
    float _645 = _617 + _643;
    bool _647 = !_609;
    int _649 = _647 ? 0 : 1;
    float _651 = float(_629);
    int _653 = abs(_649);
    float _655 = -_645;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _659 = _645 < 0.5;
    float _661 = float(_659);
    float _663 = fma(_633, 0.5, 0.5);
    float _665 = abs(_657);
    float _667 = _651 * _665;
    float _669 = float(_641);
    float _671 = -_661;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _679 = float(_653);
    float _681 = fma(_669, _677, _667);
    float _683 = abs(_673);
    float _685 = fma(_679, _683, _681);
    bool _687 = !_639;
    float _689 = _591;
    float _691 = _593;
    float _693 = _595;
    float _695 = _595;
    float _711;
    if (!_687)
    {
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _699 = _597 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _703 = _701 * _697;
        float _705 = floor(_703);
        float _707 = -_705;
        float _709 = _703 + _707;
        _711 = _709;
        _713 = true;
    }
    else
    {
        float _715 = float(_83);
        float _717 = 1.0 / _715;
        float _719 = _117 * _717;
        _711 = _719;
    }
    _713 = false;
    float _721 = _711;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _725 = _721 + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _729 = _721 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _733 = _721 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _751 = 1.0 / _737;
    bool _753 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _755 = 1.0 / _741;
    float _757 = 1.0 / _749;
    float _759 = _725 * _751;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _763 = _721 + _761;
    bool _765 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _767 = isnan(_721);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = 1.0 / _745;
    float _779 = _729 * _755;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = fma(_783, _759, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _787 = _763 * _757;
    bool _789 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _791 = isnan(_721);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_775;
    float _803 = _801 + 1.0;
    float _805 = -_799;
    float _807 = _805 + 1.0;
    float _809 = _799 * _803;
    float _811 = _733 * _777;
    bool _813 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _815 = isnan(_721);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    bool _829 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _831 = isnan(_721);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = fma(_827, _759, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _843 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _845 = isnan(_721);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _823 * _807;
    float _857 = -_823;
    float _859 = _857 + 1.0;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _869 = _853 * _859;
    float _871 = -_853;
    float _873 = _871 + 1.0;
    float _875 = -_839;
    float _877 = _875 + 1.0;
    float _879 = fma(_867, _779, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _881 = fma(_863, _779, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _883 = _839 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _889;
    float _893 = _785 * _883;
    float _895 = _841 * _883;
    float _897 = fma(_887, _811, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _899 = fma(_891, _811, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].x, _893);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].y, _895);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_879, _869, _901);
    float _915 = fma(_881, _869, _903);
    float _917 = fma(_907, _787, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _919 = fma(_911, _787, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _921 = fma(_897, _855, _913);
    float _923 = fma(_899, _855, _915);
    float _925 = fma(_917, _809, _921);
    float _927 = fma(_919, _809, _923);
    float _929 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[147].x, _925);
    float _931 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[147].y, _927);
    bool _933 = !_753;
    float _949;
    if (!_933)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _937 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _941 = _939 * _935;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = float(_83);
        float _955 = 1.0 / _953;
        float _957 = _117 * _955;
        _949 = _957;
    }
    _951 = false;
    float _959 = _949;
    float _961 = in.m_49.x;
    float _963 = in.m_49.y;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _967 = _959 + _965;
    bool _969 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _971 = isnan(_959);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _981;
    bool _985 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _987 = 1.0 / _983;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _989;
    float _993 = _931 * _963;
    float _995 = _967 * _987;
    bool _997 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _999 = isnan(_959);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = -_979;
    float _1011 = _1009 + 1.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1017;
    float _1021 = fma(_991, _995, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1023 = _1007 * _1011;
    float _1025 = fma(_1015, _995, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1027 = fma(_1019, _995, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1029 = -_1007;
    float _1031 = _1029 + 1.0;
    float _1033 = _1025 * _1023;
    float _1035 = _1027 * _1023;
    float _1037 = _1021 * _1023;
    float _1039 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1033);
    float _1041 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1035);
    float _1043 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1037);
    float _1045 = _929 * _961;
    float _1047 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1039);
    float _1049 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1041);
    float _1051 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1043);
    bool _1053 = !_985;
    float _1069;
    if (!_1053)
    {
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1057 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _1061 = _1059 * _1055;
        float _1063 = floor(_1061);
        float _1065 = -_1063;
        float _1067 = _1061 + _1065;
        _1069 = _1067;
        _1071 = true;
    }
    else
    {
        float _1073 = float(_83);
        float _1075 = 1.0 / _1073;
        float _1077 = _117 * _1075;
        _1069 = _1077;
    }
    _1071 = false;
    float _1079 = _1069;
    bool _1081 = _1079 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1083 = isnan(_1079);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1097 = _1079 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1099 = isnan(_1079);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _1079 + _1113;
    float _1117 = -_1091;
    float _1119 = _1117 + 1.0;
    bool _1121 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1123 = 1.0 / _1095;
    float _1125 = _1107 * _1119;
    float _1127 = -_1107;
    float _1129 = _1127 + 1.0;
    float _1131 = _1111 * _1123;
    float _1133 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = fma(_1131, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1137 = _1049 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1139 = _1135 * _1125;
    float _1141 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1139);
    float _1145 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1143);
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1147;
    out.m_53.y = _1149;
    out.m_53.z = _1151;
    out.m_53.w = _1153;
    bool _1155 = !_1121;
    float _1173;
    float _1175;
    if (!_1155)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1159 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1161 = float(_83);
        float _1163 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1165 = _1163 * _1157;
        float _1167 = floor(_1165);
        float _1169 = -_1167;
        float _1171 = _1165 + _1169;
        _1173 = _1161;
        _1175 = _1171;
        _1177 = true;
    }
    else
    {
        float _1179 = float(_83);
        float _1181 = 1.0 / _1179;
        float _1183 = _117 * _1181;
        _1173 = _1179;
        _1175 = _1183;
    }
    _1177 = false;
    float _1185 = _1173;
    float _1187 = _1175;
    float _1189 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1191 = int(_1189);
    float _1193 = _685 * _1045;
    float _1195 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1197 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1195);
    float _1199 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1201 = int(_1199);
    float _1203 = float(_1191);
    float _1205 = 1.0 / _1203;
    float _1207 = float(uint(_1201));
    int _1209 = ~_1201;
    int _1211 = _1209 + 1;
    float _1213 = 1.0 / _1207;
    int _1215 = ~_1201;
    int _1217 = _1215 + 1;
    float _1219 = _117 * _1205;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1223 = _1221 != 0;
    float _1225 = trunc(_1219);
    int _1227 = int(_1225);
    int _1229 = as_type<int>(_1213) + (-2);
    float _1231 = float(uint(_1227));
    float _1233 = as_type<float>(_1229) * _1231;
    float _1235 = trunc(_1233);
    float _1237 = precise::max(_1235, 0.0);
    uint _1240 = uint(_1237);
    float _1242 = float(_1201);
    int _1244 = _1211 * int(_1240);
    int _1246 = _1244 + _1227;
    float _1248 = float(_1227);
    float _1250 = float(uint(_1246));
    bool _1252 = _1248 >= _1242;
    bool _1254 = isnan(_1248);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(_1242);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = as_type<float>(_1229) * _1250;
    float _1266 = trunc(_1262);
    int _1268 = int(_1266);
    bool _1270 = !_1223;
    float _1272 = _1270 ? 7.345489978790283203125 : 1.0;
    float _1274 = _1272 * _597;
    float _1276 = trunc(_1264);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    float _1282 = floor(_1274);
    int _1284 = int(_1240) + int(_1280);
    float _1286 = 1.0 / _1185;
    int _1288 = _1217 * _1284;
    int _1290 = _1288 + _1227;
    int _1292 = ~_1268;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    bool _1298 = uint(_1290) >= uint(_1201);
    float _1300 = -_1282;
    float _1302 = _1274 + _1300;
    bool _1304 = !_1298;
    int _1306 = _1304 ? 0 : (-1);
    float _1308 = _1302 * _1242;
    float _1310 = _117 * _1242;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1284;
    int _1326 = _1324 + _1306;
    int _1328 = _1326 + 1;
    float _1330 = _1310 * _1286;
    bool _1332 = _1201 == 0;
    float _1334 = trunc(_1308);
    int _1336 = int(_1334);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1340 = _1338 != 0;
    int _1342 = _1201 * _1328;
    int _1344 = _1342 + _1227;
    int _1346 = _1201 + (-1);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1350 = _1348 != 0;
    bool _1352 = !_1332;
    int _1354 = _1352 ? _1344 : (-1);
    float _1356 = trunc(_1330);
    int _1358 = int(_1356);
    bool _1360 = !_1340;
    int _1362 = _1360 ? 0 : 1;
    float _1364 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1366 = !_1314;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = _1354 * _1296;
    bool _1372 = !_1318;
    int _1374 = _1372 ? 0 : 1;
    float _1376 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1364);
    int _1378 = abs(_1362);
    int _1380 = _1268 * _1346;
    int _1382 = _1380 + _1370;
    int _1384 = abs(_1374);
    bool _1386 = !_1322;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = _1336 * _1378;
    int _1392 = _1390 + _1227;
    int _1394 = abs(_1368);
    bool _1396 = !_1350;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = abs(_1388);
    int _1402 = _1382 * _1384;
    int _1404 = abs(_1398);
    int _1406 = _1358 * _1394;
    int _1408 = _1406 + _1402;
    float _1410 = as_type<float>(int(gl_VertexIndex));
    int _1412 = ~_1201;
    int _1414 = _1412 + 1;
    int _1416 = _1392 * _1400;
    int _1418 = _1416 + _1408;
    int _1420 = ~_1201;
    int _1422 = _1420 + 1;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1426 = _1424 != 0;
    int _1428 = _1336 * _1404;
    int _1430 = _1428 + _1418;
    int _1432 = ~_1201;
    int _1434 = _1432 + 1;
    float _1436 = float(uint(_1392));
    float _1438 = float(uint(_1430));
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1442 = _1440 != 0;
    float _1444 = as_type<float>(_1229) * _1436;
    float _1446 = as_type<float>(_1229) * _1438;
    float _1448 = trunc(_1444);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    float _1454 = trunc(_1446);
    float _1456 = precise::max(_1454, 0.0);
    uint _1458 = uint(_1456);
    int _1460 = _1422 * int(_1452);
    int _1462 = _1460 + _1392;
    int _1464 = _1434 * int(_1458);
    int _1466 = _1464 + _1430;
    float _1468 = float(uint(_1466));
    float _1470 = as_type<float>(_1229) * _1468;
    float _1472 = trunc(_1470);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    float _1478 = float(uint(_1462));
    float _1480 = _685 * _993;
    int _1482 = ~_1201;
    int _1484 = _1482 + 1;
    float _1486 = as_type<float>(_1229) * _1478;
    int _1488 = int(_1458) + int(_1476);
    float _1490 = trunc(_1486);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = _1414 * _1488;
    int _1498 = _1496 + _1430;
    bool _1500 = uint(_1498) >= uint(_1201);
    float _1502 = in.m_51.y;
    bool _1504 = !_1500;
    int _1506 = _1504 ? 0 : (-1);
    int _1508 = ~_1488;
    int _1510 = _1508 + _1506;
    int _1512 = _1510 + 1;
    int _1514 = int(_1452) + int(_1494);
    float _1516 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1518 = _1201 * _1512;
    int _1520 = _1518 + _1430;
    float _1522 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1516);
    float _1524 = _597 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1526 = _1484 * _1514;
    int _1528 = _1526 + _1392;
    bool _1530 = !_1332;
    int _1532 = _1530 ? _1520 : (-1);
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1536 = _1532 >> 31;
    float _1538 = -_1534;
    float _1540 = fma(_1524, 2.0, _1538);
    int _1542 = _1532 & 3;
    bool _1544 = _1542 != 0;
    float _1546 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1548 = _1536 & 3;
    float _1550 = -_117;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1540);
    bool _1554 = uint(_1542) > 1u;
    int _1556 = _1532 + _1548;
    int _1558 = _1532 & 3;
    bool _1560 = _1558 != 0;
    int _1562 = _1556 >> 2;
    int _1564 = _1560 ? 0 : 1;
    int _1566 = _1562 << 4;
    int _1568 = _1566 + 368;
    int _1570 = ~_1564;
    int _1572 = _1570 + 1;
    int _1574 = _1572 + 1;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1578 = _1576 != 0;
    int _1580 = _1574;
    if (!_1554)
    {
        int _1582 = ~_1564;
        int _1584 = _1582 + 1;
        _1580 = _1584;
    }
    int _1586 = _1580;
    uint _1588 = uint(int(uint(_1568) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    bool _1604 = !_1426;
    int _1606 = _1604 ? 0 : 1;
    bool _1608 = uint(_1542) >= 2u;
    bool _1610 = _1542 != 3;
    bool _1612 = !_1544;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = _1608 ? 0 : 1;
    int _1618 = as_type<int>(_1410) & 1;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>(_1410) & 2;
    bool _1624 = _1622 != 0;
    bool _1626 = !_1610;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = _1542 != 3;
    int _1632 = _1568 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[int(_1644)][_1646];
    int _1650 = ~_1616;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = abs(_1614);
    bool _1658 = !_1620;
    float _1660 = _1658 ? (-0.5) : 0.5;
    bool _1662 = !_1624;
    float _1664 = _1662 ? (-0.5) : 0.5;
    int _1666 = abs(_1586);
    float _1668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1660);
    int _1670 = _1654;
    if (_1630)
    {
        int _1672 = ~_1616;
        int _1674 = _1672 + 1;
        _1670 = _1674;
    }
    int _1676 = _1670;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1680 = uint(_1528) >= uint(_1201);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1684 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1678);
    bool _1686 = !_1680;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = fma(_1546, -2.0, _1682);
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1692;
    int _1696 = ~_1514;
    int _1698 = _1696 + _1688;
    int _1700 = _1698 + 1;
    bool _1702 = _597 > 0.5;
    int _1704 = ~_1666;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1201 * _1700;
    int _1712 = _1710 + _1392;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1716 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1718 = int(_1716);
    int _1720 = _1708 * as_type<int>(_1602);
    bool _1722 = !_1332;
    int _1724 = _1722 ? _1712 : (-1);
    float _1726 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1714);
    float _1728 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1197);
    bool _1730 = _1502 > 0.5;
    float _1732 = 1.0 / _1694;
    int _1734 = abs(_1676);
    float _1736 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    int _1738 = ~_1656;
    int _1740 = _1738 + 1;
    int _1742 = _1740 + 1;
    float _1744 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1522);
    int _1746 = abs(_1628);
    float _1748 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1750 = _1742 * as_type<int>(_1594);
    int _1752 = _1750 + _1720;
    float _1754 = _591 * _591;
    int _1756 = ~_1734;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1764 = _1187 + _1762;
    int _1766 = ~_1746;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = fma(_593, _593, _1754);
    float _1774 = float(uint(_1718));
    int _1776 = _1760 * as_type<int>(_1640);
    int _1778 = _1776 + _1752;
    float _1780 = _1764 * _1732;
    float _1782 = fma(_595, _595, _1772);
    int _1784 = abs(_1718);
    int _1786 = _1770 * as_type<int>(_1648);
    int _1788 = _1786 + _1778;
    int _1790 = abs(_1606);
    float _1792 = 1.0 / _1774;
    float _1794 = float(uint(_1784));
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1796;
    int _1800 = ~_1790;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    float _1806 = _1744 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1808 = fma(_1798, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1810 = rsqrt(_1782);
    int _1812 = _1788 * _1804;
    float _1814 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1816;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1820;
    int _1824 = _1724 * _1790;
    int _1826 = _1824 + _1812;
    int _1828 = ~_1718;
    int _1830 = _1828 + 1;
    float _1832 = fma(_1818, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1834 = 1.0 / _1794;
    int _1836 = as_type<int>(_1792) + (-2);
    float _1838 = fma(_1822, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1840 = abs(_1826);
    float _1842 = _1814 * _1668;
    float _1844 = float(uint(_1826));
    float _1846 = _1728 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1848 = ~_1784;
    int _1850 = _1848 + 1;
    float _1852 = _1810 * _595;
    float _1854 = _1810 * _593;
    float _1856 = _1810 * _591;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1860 = _1852 * _1858;
    float _1862 = as_type<float>(_1836) * _1844;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1866 = _1856 * _1864;
    float _1868 = float(uint(_1840));
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1872 = -_1860;
    float _1874 = fma(_1854, _1870, _1872);
    int _1876 = as_type<int>(_1834) + (-2);
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1880 = _1854 * _1878;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1884 = -_1866;
    float _1886 = fma(_1852, _1882, _1884);
    float _1888 = trunc(_1862);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = _1874 * _1874;
    float _1896 = as_type<float>(_1876) * _1868;
    float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1900 = -_1880;
    float _1902 = fma(_1856, _1898, _1900);
    bool _1904 = _1187 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1906 = isnan(_1187);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = fma(_1886, _1886, _1894);
    bool _1918 = _1187 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1920 = isnan(_1187);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = _1736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1932 = trunc(_1896);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    float _1938 = fma(_1902, _1902, _1916);
    float _1940 = -_1660;
    int _1942 = _1702 ? as_type<int>(_1940) : as_type<int>(_1660);
    float _1944 = -_1928;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1664;
    int _1950 = _1730 ? as_type<int>(_1948) : as_type<int>(_1664);
    bool _1952 = !_1578;
    float _1954 = _1952 ? _1660 : as_type<float>(_1942);
    float _1956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1664);
    float _1958 = rsqrt(_1938);
    int _1960 = _1830 * int(_1892);
    int _1962 = _1960 + _1826;
    bool _1964 = !_1442;
    float _1966 = _1964 ? _1664 : as_type<float>(_1950);
    float _1968 = _1748 * _1956;
    float _1970 = _1914 * _1946;
    bool _1972 = _1718 == 0;
    float _1974 = float(uint(_1962));
    int _1976 = _1850 * int(_1936);
    int _1978 = _1976 + _1840;
    float _1980 = _1968 * _1852;
    float _1982 = as_type<float>(_1836) * _1974;
    float _1984 = float(uint(_1978));
    float _1986 = _1874 * _1958;
    float _1988 = _1902 * _1958;
    float _1990 = trunc(_1982);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    float _1996 = as_type<float>(_1876) * _1984;
    float _1998 = _1886 * _1958;
    float _2000 = _1832 * _1970;
    float _2002 = _1968 * _1854;
    float _2004 = _1854 * _1986;
    float _2006 = _1808 * _1970;
    float _2008 = _1856 * _1988;
    float _2010 = trunc(_1996);
    float _2012 = precise::max(_2010, 0.0);
    uint _2014 = uint(_2012);
    float _2016 = fma(_1842, _1998, _2002);
    float _2018 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2020 = fma(_1842, _1988, _1980);
    float _2022 = -_2004;
    float _2024 = fma(_1856, _1998, _2022);
    float _2026 = _1838 * _1970;
    float _2028 = -_2008;
    float _2030 = fma(_1852, _1986, _2028);
    float _2032 = _1968 * _1856;
    float _2034 = fma(_2018, _2024, _2020);
    int _2036 = int(_1892) + int(_1994);
    float _2038 = fma(_2018, _2030, _2016);
    int _2040 = ~_1718;
    int _2042 = _2040 + 1;
    float _2044 = _1806 + _2034;
    int _2046 = ~_1784;
    int _2048 = _2046 + 1;
    float _2050 = _1846 + _2038;
    float _2052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2056 = _2044 + _2054;
    int _2058 = int(_1936) + int(_2014);
    float _2060 = -_1914;
    float _2062 = _2060 + 1.0;
    int _2064 = _2042 * _2036;
    int _2066 = _2064 + _1826;
    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2070 = _2050 + _2068;
    float _2072 = _2056 * _2056;
    int _2074 = _2048 * _2058;
    int _2076 = _2074 + _1840;
    float _2078 = _1852 * _1998;
    bool _2080 = uint(_2066) >= uint(_1718);
    float _2082 = fma(_2070, _2070, _2072);
    float _2084 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2000);
    bool _2086 = uint(_2076) >= uint(_1784);
    float _2088 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2006);
    float _2090 = sqrt(_2082);
    bool _2092 = !_2080;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = fma(_1842, _1986, _2032);
    int _2098 = _1826 ^ _1718;
    float _2100 = -_2078;
    float _2102 = fma(_1854, _1988, _2100);
    int _2104 = ~_2036;
    int _2106 = _2104 + _2094;
    int _2108 = _2106 + 1;
    float _2110 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2112 = _1718 == 0;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2116 = !_2086;
    int _2118 = _2116 ? 0 : (-1);
    int _2120 = _1718 * _2108;
    int _2122 = _2120 + _1826;
    uint _2124 = uint(int(uint(_2098) >> uint(31)));
    float _2126 = fma(_2018, _2102, _2096);
    int _2128 = ~_2118;
    int _2130 = _2058 + _2128;
    int _2132 = _2130 + 1;
    float _2134 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2026);
    int _2136 = ~int(_2124);
    int _2138 = _2136 + 1;
    float _2140 = _1930 + _2126;
    bool _2142 = !_2112;
    int _2144 = _2142 ? _2122 : (-1);
    float _2146 = _1954 + 0.5;
    bool _2148 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2150 = _2132 ^ _2138;
    float _2152 = float(_2144);
    int _2154 = ~_2138;
    int _2156 = _2154 + _2150;
    int _2158 = _2156 + 1;
    float _2160 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1690);
    float _2162 = fma(_2110, _2152, _1552);
    bool _2164 = !_1972;
    int _2166 = _2164 ? _2158 : (-1);
    float _2168 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2170 = _2114;
    float _2172 = _1690;
    float _2174 = as_type<float>(_1826);
    float _2176 = _1782;
    if (!_2148)
    {
        _2170 = _2050;
    }
    float _2178 = _2170;
    float _2180 = _2178;
    if (!_2148)
    {
        _2172 = _2044;
    }
    float _2182 = _2172;
    float _2184 = float(_2166);
    float _2186 = _2182;
    if (!_2148)
    {
        _2174 = _2140;
    }
    float _2188 = _2174;
    bool _2190 = !_2148;
    float _2192 = _2188;
    if (!_2190)
    {
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2198 = _2090 + _2196;
        float _2200 = rsqrt(_2082);
        float _2202 = _2198 * _2194;
        float _2204 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2206 = _2202 * 0.15915493667125701904296875;
        float _2208 = _2206 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = _2206 * 6.283185482025146484375;
        float _2214 = cos(_2212);
        float _2216 = fma(_2210, _2204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2218 = _2200 * _2216;
        float _2220 = _2214 + (-1.0);
        float _2222 = fma(_2070, _2218, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2224 = fma(_2056, _2218, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2226 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = fma(_2140, _2214, _2226);
        _2192 = _2228;
        _2180 = _2222;
        _2186 = _2224;
    }
    float _2230 = _2192;
    float _2232 = _2180;
    float _2234 = _2186;
    float _2236 = fma(_2110, _2146, _2162);
    float _2238 = -_1930;
    float _2240 = _2238 + _2230;
    float _2242 = -_1846;
    float _2244 = _2242 + _2232;
    float _2246 = -_1806;
    float _2248 = _2246 + _2234;
    float _2250 = -_2160;
    float _2252 = fma(_2168, _2184, _2250);
    float _2254 = _2240 * _2240;
    float _2256 = _1966 + (-0.5);
    float _2258 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2084);
    float _2260 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1684);
    float _2262 = fma(_2244, _2244, _2254);
    float _2264 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2088);
    float _2266 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2134);
    float _2268 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1726);
    float _2270 = fma(_2248, _2248, _2262);
    float _2272 = -_2168;
    float _2274 = fma(_2272, _2256, _2252);
    float _2276 = -_2260;
    float _2278 = _2276 + 1.0;
    float _2280 = sqrt(_2270);
    float _2282 = _2258 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2284 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2286 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2288 = -_2268;
    float _2290 = _2288 + 1.0;
    float _2292 = -_2278;
    float _2294 = fma(_1954, _2292, _2236);
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = fma(_1966, _2290, _2274);
    out.m_58.x = _2298;
    out.m_58.y = _2300;
    out.m_58.z = _2302;
    out.m_58.w = _2296;
    bool _2306 = _2280 > 0.0;
    out.m_60.x = _2294;
    out.m_60.y = _2304;
    bool _2308 = !_2306;
    float _2310 = _2300;
    float _2312 = _2302;
    float _2314 = _2230;
    float _2316 = _2234;
    float _2318 = _2232;
    float _2320 = _2294;
    if (!_2308)
    {
        bool _2322 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2324 = _2298;
        if (_2322)
        {
            float _2326 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2324 = _2326;
        }
        float _2328 = _2324;
        float _2330 = _2328;
        if (_2322)
        {
            float _2332 = _2328 * _593;
            _2310 = _2332;
        }
        float _2334 = _2310;
        float _2336 = _2334;
        if (_2322)
        {
            float _2338 = _2328 * _591;
            _2312 = _2338;
        }
        float _2340 = _2312;
        float _2342 = _2340;
        if (_2322)
        {
            float _2344 = _2328 * _595;
            _2330 = _2344;
        }
        float _2346 = _2330;
        float _2348 = _2346;
        float _2350 = _2346;
        if (!_2322)
        {
            float _2352 = _117 + 1.0;
            float _2354 = _2352;
            if (!_157)
            {
                float _2356 = _2352 * _2352;
                float _2358 = _2356 * 0.5;
                _2348 = _2358;
            }
            float _2360 = _2348;
            float _2362 = _2360;
            if (!_157)
            {
                float _2364 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2362 = _2364;
            }
            float _2366 = _2362;
            bool _2368 = !_157;
            float _2370 = _2366;
            if (!_2368)
            {
                float _2372 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2374 = log2(_2372);
                float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2378 = _2376 + 1.0;
                float _2380 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2382 = _2374 * _2352;
                float _2384 = 1.0 / _2378;
                float _2386 = _2380 * 0.693147182464599609375;
                float _2388 = exp2(_2382);
                float _2390 = 1.0 / _2386;
                float _2392 = _2388 + (-1.0);
                float _2394 = -_2392;
                float _2396 = fma(_2394, _2390, _2352);
                float _2398 = _2396 * _2384;
                float _2400 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2370 = _2400;
            }
            float _2402 = _2370;
            float _2404 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2406 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2408 = !_157;
            if (!_2408)
            {
                float _2410 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2412 = log2(_2410);
                float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2416 = _2414 + 1.0;
                float _2418 = 1.0 / _2416;
                float _2420 = _2412 * _2352;
                float _2422 = exp2(_2420);
                float _2424 = -_2422;
                float _2426 = _2424 + 1.0;
                float _2428 = _2426 * _2418;
                _2354 = _2428;
            }
            float _2430 = _2354;
            float _2432 = fma(_2430, _143, _2406);
            float _2434 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2436 = fma(_2430, _141, _2404);
            float _2438 = -_339;
            float _2440 = _2438 + _2432;
            float _2442 = fma(_2430, _145, _2434);
            float _2444 = -_345;
            float _2446 = _2444 + _2436;
            float _2448 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2450 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2452 = -_351;
            float _2454 = _2452 + _2442;
            float _2456 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2458 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2448);
            float _2460 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2450);
            float _2462 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2456);
            float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2458);
            float _2466 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2460);
            float _2468 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2462);
            float _2470 = _2464 * _2464;
            float _2472 = fma(_2466, _2466, _2470);
            float _2474 = fma(_2468, _2468, _2472);
            _2176 = _2474;
            _689 = _2464;
            _691 = _2466;
            _693 = _2468;
            _2336 = _2466;
            _2342 = _2464;
            _2350 = _2468;
        }
        float _2476 = _2176;
        float _2478 = _689;
        float _2480 = _691;
        float _2482 = _693;
        float _2484 = _2336;
        float _2486 = _2342;
        float _2488 = _2350;
        float _2490 = sqrt(_2476);
        float _2492 = rsqrt(_2270);
        bool _2494 = _2490 > 0.0;
        float _2496 = _2244 * _2492;
        float _2498 = _2240 * _2492;
        float _2500 = _2248 * _2492;
        bool _2502 = !_2494;
        _695 = _2482;
        if (!_2502)
        {
            float _2504 = rsqrt(_2476);
            float _2506 = _2504 * _2478;
            float _2508 = _2504 * _2480;
            float _2510 = _2498 * _2506;
            float _2512 = _2504 * _2482;
            float _2514 = fma(_2496, _2508, _2510);
            float _2516 = fma(_2500, _2512, _2514);
            float _2518 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2520 = fma(_2484, _2518, _2232);
            float _2522 = fma(_2486, _2518, _2230);
            float _2524 = fma(_2488, _2518, _2234);
            _2314 = _2522;
            _2316 = _2524;
            _2318 = _2520;
        }
    }
    float _2526 = _2314;
    float _2528 = _2316;
    float _2530 = _2318;
    float _2532 = _695;
    float _2534 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2536 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2538 = isnan(0.5);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2544 = _2540 || _2542;
    float _2546 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2534);
    float _2548 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2550 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2552 = isnan(0.5);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2558 = _2554 || _2556;
    float _2560 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2546);
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2564 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2548);
    float _2566 = 1.0 / _2562;
    float _2568 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2564);
    float _2570 = _2532;
    float _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2544)
    {
        _2570 = _2526;
    }
    float _2574 = _2570;
    float _2576 = _2568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2578 = _2576 + _2562;
    float _2580 = _2578 * _2566;
    float _2582 = _2580 * 0.5;
    float _2584 = _2566;
    float _2586 = _2582;
    float _2588 = _2574;
    if (_2544)
    {
        _2584 = _2528;
    }
    float _2590 = _2584;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2592);
    float _2596 = _2594;
    float _2598 = _2590;
    if (_2544)
    {
        _2586 = _2530;
    }
    float _2600 = _2586;
    float _2602 = _2600;
    if (_2558)
    {
        _2572 = 1.0;
    }
    float _2604 = _2572;
    float _2606 = 1.0 / _2594;
    float _2608 = _2604;
    if (!_2544)
    {
        float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2612 = _1930 + _2610;
        float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2616 = _1846 + _2614;
        float _2618 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2620 = -_1846;
        float _2622 = _2620 + _2530;
        float _2624 = _2612 * _2612;
        float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2628 = _1806 + _2626;
        float _2630 = -_1806;
        float _2632 = _2630 + _2528;
        float _2634 = fma(_2616, _2616, _2624);
        float _2636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2638 = fma(_2628, _2628, _2634);
        float _2640 = sqrt(_2638);
        float _2642 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2644 = precise::min(_2640, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2646 = _2644 * _2636;
        float _2648 = -_1930;
        float _2650 = _2648 + _2526;
        float _2652 = _2642 * _2646;
        float _2654 = fma(_2622, _2652, _1846);
        float _2656 = fma(_2650, _2652, _1930);
        float _2658 = fma(_2632, _2652, _1806);
        _2596 = _2618;
        _2588 = _2656;
        _2602 = _2654;
        _2598 = _2658;
    }
    float _2660 = _2596;
    float _2662 = _2588;
    float _2664 = _2602;
    float _2666 = _2598;
    float _2668 = _2660;
    if (_2558)
    {
        _2668 = 1.0;
    }
    float _2670 = _2668;
    float _2672 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2674 = _2606 * _2672;
    float _2676 = _2670;
    if (!_2558)
    {
        float _2678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2680 = _2678 * 0.15915493667125701904296875;
        float _2682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2684 = _2680 * 6.283185482025146484375;
        float _2686 = cos(_2684);
        float _2688 = _2682 * 0.15915493667125701904296875;
        float _2690 = _2680 * 6.283185482025146484375;
        float _2692 = sin(_2690);
        float _2694 = 1.0 / _2686;
        float _2696 = _2688 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = _2692 * _2694;
        float _2702 = _2688 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2708 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2706;
        float _2710 = _2698 * _2700;
        float _2712 = 1.0 / _2708;
        float _2714 = 1.0 / _2710;
        float _2716 = _2704 * _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2720 = fma(_2674, _2716, _2718);
        float _2722 = _2720 * _2712;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        _419 = _2680;
        _2608 = _2724;
    }
    float _2726 = _419;
    float _2728 = _2608;
    float _2730 = _2726;
    if (!_2558)
    {
        float _2732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2734 = _2732 * 0.15915493667125701904296875;
        float _2736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2738 = _2734 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2736 * 0.15915493667125701904296875;
        float _2744 = _2734 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = 1.0 / _2740;
        float _2750 = _2742 * 6.283185482025146484375;
        float _2752 = cos(_2750);
        float _2754 = _2746 * _2748;
        float _2756 = _2742 * 6.283185482025146484375;
        float _2758 = sin(_2756);
        float _2760 = _2752 * _2754;
        float _2762 = 1.0 / _2760;
        float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2766 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2764;
        float _2768 = 1.0 / _2766;
        float _2770 = _2758 * _2762;
        float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2774 = fma(_2674, _2770, _2772);
        float _2776 = _2774 * _2768;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = -_2778;
        float _2782 = _2780 + 1.0;
        _2730 = _2760;
        _2676 = _2782;
    }
    float _2784 = _2730;
    float _2786 = _2676;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2790 = _2662 + _2788;
    float _2792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2794 = _2664 + _2792;
    float _2796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2798 = _2666 + _2796;
    float _2800 = _2790 * _2790;
    float _2802 = fma(_2794, _2794, _2800);
    float _2804 = fma(_2798, _2798, _2802);
    float _2806 = rsqrt(_2804);
    float _2808 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2810 = _2794 * _2808;
    float _2812 = _2798 * _2808;
    float _2814 = _2810 * _2810;
    float _2816 = _2812 * _2812;
    float _2818 = _2814 + _2816;
    float _2820 = sqrt(_2818);
    bool _2822 = _2820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = _2820 + _2824;
    float _2828 = _2798;
    float _2830 = _2800;
    float _2832 = _2826;
    float _2834 = _2810;
    if (_2822)
    {
        float _2836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2828 = _2836;
    }
    float _2838 = _2828;
    if (_2822)
    {
        float _2840 = rsqrt(_2818);
        _2830 = _2840;
    }
    float _2842 = _2830;
    float _2844 = _2842;
    if (_2822)
    {
        float _2846 = _2826 * _2838;
        _2832 = _2846;
    }
    float _2848 = _2832;
    if (_2822)
    {
        float _2850 = _2848 * 0.15915493667125701904296875;
        _421 = _2850;
    }
    float _2852 = _421;
    float _2854 = _2806;
    if (_2822)
    {
        float _2856 = _2852 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        _2854 = _2858;
    }
    float _2860 = _2854;
    float _2862 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2864 = precise::max(0.0, _2862);
    float _2866 = _2784;
    float _2868 = _2864;
    float _2870 = _2862;
    if (_2822)
    {
        float _2872 = _2852 * 6.283185482025146484375;
        float _2874 = cos(_2872);
        _2866 = _2874;
    }
    float _2876 = _2866;
    float _2878 = -_2808;
    float _2880 = -_2864;
    float _2882 = fma(_2790, _2878, _2880);
    float _2884 = _2882;
    if (_2822)
    {
        float _2886 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2868 = _2886;
    }
    float _2888 = _2868;
    float _2890 = sqrt(_2804);
    float _2892 = _2860;
    float _2894 = _2888;
    if (_2822)
    {
        float _2896 = fma(_2860, _2888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2892 = _2896;
    }
    float _2898 = _2892;
    float _2900 = _2898;
    if (_2822)
    {
        float _2902 = _2876 + (-1.0);
        _2870 = _2902;
    }
    float _2904 = _2870;
    float _2906 = _2904;
    if (_2822)
    {
        float _2908 = _2842 * _2898;
        _2320 = _2908;
    }
    float _2910 = _2320;
    if (!_2822)
    {
        _2844 = _2882;
    }
    float _2912 = _2844;
    float _2914 = _2912;
    if (_2822)
    {
        float _2916 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2894 = _2916;
    }
    float _2918 = _2894;
    if (_2822)
    {
        float _2920 = _2810 * _2910;
        _2834 = _2920;
    }
    float _2922 = _2834;
    if (!_2822)
    {
        _2900 = _2812;
    }
    float _2924 = _2900;
    float _2926 = _2924;
    if (_2822)
    {
        float _2928 = _2812 * _2910;
        _2926 = _2928;
    }
    float _2930 = _2926;
    if (!_2822)
    {
        _2906 = _2814;
    }
    float _2932 = _2906;
    float _2934 = _2932;
    if (_2822)
    {
        float _2936 = fma(_2882, _2876, _2918);
        _2914 = _2936;
    }
    float _2938 = _2914;
    if (_2822)
    {
        float _2940 = _2922 * _2922;
        _2934 = _2940;
    }
    float _2942 = _2934;
    if (!_2822)
    {
        _2884 = _2816;
    }
    float _2944 = _2884;
    float _2946 = _2944;
    if (_2822)
    {
        float _2948 = _2930 * _2930;
        _2946 = _2948;
    }
    float _2950 = _2946;
    float _2952 = fma(_2938, _2938, _2942);
    float _2954 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2956 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2958 = _2952 + _2950;
    float _2960 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2954);
    float _2962 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2966 = fma(_2890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2964);
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = rsqrt(_2958);
    float _2972 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2974 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2960);
    float _2976 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2962);
    float _2978 = -_2968;
    float _2980 = _2978 + 1.0;
    float _2982 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2984 = _2974 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2986 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2956);
    float _2988 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2976);
    float _2990 = abs(_2980);
    float _2992 = log2(_2990);
    float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2996 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2982);
    float _2998 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2986);
    float _3000 = _2988 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3002 = -_2994;
    float _3004 = fma(_3002, _2972, 1.0);
    float _3006 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2996);
    float _3008 = _2970 * _2922;
    float _3010 = _2998 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3012 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3014 = _2970 * _2938;
    float _3016 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3018 = _2970 * _2930;
    float _3020 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3012);
    float _3022 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3024 = -_3016;
    float _3026 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3024);
    float _3028 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3030 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3020);
    float _3032 = log2(_3004);
    float _3034 = -_3018;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3026);
    float _3038 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3040 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3030);
    float _3042 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3044 = fma(_3036, -0.5, 0.5);
    float _3046 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3038);
    float _3048 = exp2(_3028);
    float _3050 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3042);
    float _3052 = fma(_3036, 0.5, 0.5);
    float _3054 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3046);
    float _3056 = _3014 + 1.0;
    float _3058 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3050);
    float _3060 = 1.0 / _3040;
    float _3062 = fma(_3052, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3064 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3058);
    float _3066 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3054);
    float _3068 = _3032 * 0.693147182464599609375;
    float _3070 = fma(_3052, _3062, -0.212114393711090087890625);
    float _3072 = sqrt(_3044);
    float _3074 = -_3014;
    float _3076 = fma(_3048, _3056, _3074);
    float _3078 = fma(_3052, _3070, 1.570728778839111328125);
    float _3080 = _3068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3082 = fma(_3076, 0.5, 0.5);
    float _3084 = _3064 * _3060;
    float _3086 = _3066 * _3060;
    float _3088 = fma(_3084, 0.5, 0.5);
    float _3090 = fma(_3086, -0.5, 0.5);
    float _3092 = _3072 * 0.636619746685028076171875;
    float3 _7833 = float3(_3088, _3090, _3080);
    float _3094 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7833, float3(0.0), isnan(_7833)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7833, float3(0.0), isnan(_7833)), level(0.0)).x;
    float3 _7844 = float3(_3088, _3090, _3080);
    float4 _3097 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7844, float3(0.0), isnan(_7844)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7844, float3(0.0), isnan(_7844)), level(0.0)).xyzw;
    float _3099 = _3097.x;
    float _3101 = _3097.y;
    float _3103 = _3097.z;
    float _3105 = _3097.w;
    float _3107 = -_3078;
    float _3109 = fma(_3092, _3107, 1.0);
    float2 _7866 = float2(_3109, _3082);
    float3 _3113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7866, float2(0.0), isnan(_7866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7866, float2(0.0), isnan(_7866)), level(0.0)).xyz;
    float _3115 = _3113.x;
    float _3117 = _3113.y;
    float _3119 = _3113.z;
    float _3121 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3123 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3125 = _2728 > 0.0;
    bool _3127 = isnan(_2728);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan(0.0);
    bool _3133 = _3129 || _3131;
    float _3135 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3123);
    float _3137 = exp2(_3121);
    bool _3139 = _2786 <= 0.0;
    bool _3141 = !_3133;
    bool _3143 = _3139 || _3141;
    float _3145 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3135);
    float _3147 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3145);
    float _3149 = _2728 * _2786;
    float _3151 = _3147 + _3040;
    float _3153 = _3149 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3155 = _3151 * 0.5;
    float _3157 = -_3137;
    float _3159 = _3157 + 1.0;
    float _3161 = _3153 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _3064;
    out.gl_Position.y = _3066;
    out.gl_Position.z = _3147;
    out.gl_Position.w = _3040;
    float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _3155;
    out.m_62.w = _3040;
    out.m_45.x = _3161;
    float _3165 = _3163 * _3094;
    float _3167 = -_3163;
    float _3169 = _3167 + 1.0;
    float _3171 = _3105 * _3165;
    float _3173 = _3119 * _3165;
    float _3175 = fma(_3115, _3171, _3099);
    float _3177 = fma(_3117, _3171, _3101);
    float _3179 = _3105 * _3169;
    float _3181 = fma(_3105, _3173, _3103);
    out.m_64.x = _3175;
    out.m_64.y = _3177;
    out.m_64.z = _3181;
    out.m_64.w = _3179;
    if (!_3143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3183 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3183;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1177 = false;
    bool _1071 = false;
    bool _951 = false;
    bool _713 = false;
    bool _469 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3240 = as_type<float>(_99);
        out.gl_Position.z = _3240;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    float _139 = as_type<float>(_137);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3310 = as_type<float>(_137);
        out.gl_Position.z = _3310;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _147;
    if (!_157)
    {
        float _161 = _147 * _147;
        float _163 = _161 * 0.5;
        _139 = _163;
    }
    float _165 = _139;
    float _167 = 0.0;
    float _169 = _165;
    if (!_157)
    {
        float _171 = _117 * _117;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    if (!_157)
    {
        float _177 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _177;
    }
    float _179 = _169;
    bool _181 = !_157;
    float _183 = _179;
    float _185 = 0.0;
    if (!_181)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _147 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _147);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _203;
        _183 = _215;
        _185 = _205;
    }
    float _217 = _121;
    float _219 = _183;
    float _221 = _185;
    bool _223 = !_157;
    float _225 = _217;
    float _227 = _221;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _147 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _225 = _241;
        _227 = _235;
        _159 = _247;
    }
    float _249 = _225;
    float _251 = _227;
    float _253 = _159;
    float _255 = _251;
    float _257 = _249;
    if (!_157)
    {
        _255 = _117;
    }
    float _259 = _255;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _259;
    if (!_157)
    {
        float _267 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _267;
    }
    float _269 = _257;
    bool _271 = !_157;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _117 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _117);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_157;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _117 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_253, _143, _263);
    float _335 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = fma(_253, _141, _261);
    float _339 = fma(_329, _143, _331);
    float _341 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_329, _141, _335);
    float _347 = -_339;
    float _349 = _333 + _347;
    float _351 = fma(_329, _145, _341);
    float _353 = fma(_253, _145, _343);
    float _355 = -_345;
    float _357 = _337 + _355;
    float _359 = _349 * _349;
    float _361 = in.m_49.w;
    float _363 = -_351;
    float _365 = _353 + _363;
    float _367 = _349 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = fma(_357, _357, _359);
    float _371 = _349 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = _349 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = in.m_42.x;
    float _383 = in.m_42.y;
    float _385 = in.m_42.z;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _391 = sqrt(_377);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _395 = _391 >= 9.9999999747524270787835121154785e-07;
    bool _397 = isnan(_391);
    bool _399 = _395 || _397;
    bool _401 = isnan(9.9999999747524270787835121154785e-07);
    bool _403 = _399 || _401;
    float _405 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _407 = fma(_337, _361, _381);
    float _409 = fma(_333, _361, _383);
    float _411 = fma(_353, _361, _385);
    float _413 = _379;
    float _415 = _365;
    float _417 = _393;
    float _419 = _351;
    float _421 = _339;
    if (_403)
    {
        _413 = _389;
    }
    float _423 = _413;
    float _425 = _423;
    if (_403)
    {
        _415 = _405;
    }
    float _427 = _415;
    float _429 = _427;
    if (!_403)
    {
        bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _433 = !_431;
        if (!_433)
        {
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _445);
            float _453 = _447 * _447;
            float _455 = fma(_449, _449, _453);
            float _457 = fma(_451, _451, _455);
            float _459 = rsqrt(_457);
            float _461 = _459 * 9.9999999747524270787835121154785e-07;
            float _463 = _449 * _461;
            float _465 = _447 * _461;
            float _467 = _451 * _461;
            _429 = _465;
            _425 = _463;
            _417 = _467;
            _469 = true;
        }
        else
        {
            float _471 = _143 * _143;
            float _473 = fma(_141, _141, _471);
            float _475 = fma(_145, _145, _473);
            float _477 = sqrt(_475);
            bool _479 = _477 >= 9.9999999747524270787835121154785e-07;
            bool _481 = isnan(_477);
            bool _483 = _479 || _481;
            bool _485 = isnan(9.9999999747524270787835121154785e-07);
            bool _487 = _483 || _485;
            if (!_487)
            {
                float _489 = _383 * _383;
                float _491 = fma(_381, _381, _489);
                float _493 = fma(_385, _385, _491);
                float _495 = sqrt(_493);
                bool _497 = _495 >= 9.9999999747524270787835121154785e-07;
                bool _499 = isnan(_495);
                bool _501 = _497 || _499;
                bool _503 = isnan(9.9999999747524270787835121154785e-07);
                bool _505 = _501 || _503;
                if (!_505)
                {
                    float _507 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _507);
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _509);
                    float _513 = rsqrt(_511);
                    float _515 = _513 * 9.9999999747524270787835121154785e-07;
                    float _517 = _515 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _519 = _515 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _521 = _515 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _429 = _519;
                    _425 = _517;
                    _417 = _521;
                    _469 = true;
                }
                else
                {
                    float _523 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _529 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
                    float _531 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _525);
                    float _533 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
                    float _535 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
                    float _537 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
                    float _539 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
                    float _541 = _535 * _535;
                    float _543 = fma(_537, _537, _541);
                    float _545 = fma(_539, _539, _543);
                    float _547 = rsqrt(_545);
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    float _551 = _537 * _549;
                    float _553 = _535 * _549;
                    float _555 = _539 * _549;
                    _429 = _553;
                    _425 = _551;
                    _417 = _555;
                    _469 = true;
                }
            }
            else
            {
                float _557 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _559 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _561 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _563 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
                float _565 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
                float _567 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _561);
                float _569 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _563);
                float _571 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _565);
                float _573 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _567);
                float _575 = _569 * _569;
                float _577 = fma(_571, _571, _575);
                float _579 = fma(_573, _573, _577);
                float _581 = rsqrt(_579);
                float _583 = _581 * 9.9999999747524270787835121154785e-07;
                float _585 = _571 * _583;
                float _587 = _569 * _583;
                float _589 = _573 * _583;
                _429 = _587;
                _425 = _585;
                _417 = _589;
            }
        }
    }
    _469 = false;
    float _591 = _429;
    float _593 = _425;
    float _595 = _417;
    float _597 = in.m_51.x;
    float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _601 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _609 = _607 != 0;
    int _611 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _613 = _611 != 0;
    float _615 = _601 * _599;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[20].x, _615);
    float _619 = _617 * 6.283185482025146484375;
    float _621 = floor(_617);
    float _623 = _619 * 0.15915493667125701904296875;
    bool _625 = !_605;
    int _627 = _625 ? 0 : 1;
    int _629 = abs(_627);
    float _631 = _623 * 6.283185482025146484375;
    float _633 = cos(_631);
    bool _635 = !_613;
    int _637 = _635 ? 0 : 1;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _641 = abs(_637);
    float _643 = -_621;
    float _645 = _617 + _643;
    bool _647 = !_609;
    int _649 = _647 ? 0 : 1;
    float _651 = float(_629);
    int _653 = abs(_649);
    float _655 = -_645;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _659 = _645 < 0.5;
    float _661 = float(_659);
    float _663 = fma(_633, 0.5, 0.5);
    float _665 = abs(_657);
    float _667 = _651 * _665;
    float _669 = float(_641);
    float _671 = -_661;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _679 = float(_653);
    float _681 = fma(_669, _677, _667);
    float _683 = abs(_673);
    float _685 = fma(_679, _683, _681);
    bool _687 = !_639;
    float _689 = _591;
    float _691 = _593;
    float _693 = _595;
    float _695 = _595;
    float _711;
    if (!_687)
    {
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _699 = _597 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _703 = _701 * _697;
        float _705 = floor(_703);
        float _707 = -_705;
        float _709 = _703 + _707;
        _711 = _709;
        _713 = true;
    }
    else
    {
        float _715 = float(_83);
        float _717 = 1.0 / _715;
        float _719 = _117 * _717;
        _711 = _719;
    }
    _713 = false;
    float _721 = _711;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _725 = _721 + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _729 = _721 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _733 = _721 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _751 = 1.0 / _737;
    bool _753 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _755 = 1.0 / _741;
    float _757 = 1.0 / _749;
    float _759 = _725 * _751;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _763 = _721 + _761;
    bool _765 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _767 = isnan(_721);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = 1.0 / _745;
    float _779 = _729 * _755;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = fma(_783, _759, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _787 = _763 * _757;
    bool _789 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _791 = isnan(_721);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_775;
    float _803 = _801 + 1.0;
    float _805 = -_799;
    float _807 = _805 + 1.0;
    float _809 = _799 * _803;
    float _811 = _733 * _777;
    bool _813 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _815 = isnan(_721);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    bool _829 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _831 = isnan(_721);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = fma(_827, _759, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _843 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _845 = isnan(_721);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _823 * _807;
    float _857 = -_823;
    float _859 = _857 + 1.0;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _869 = _853 * _859;
    float _871 = -_853;
    float _873 = _871 + 1.0;
    float _875 = -_839;
    float _877 = _875 + 1.0;
    float _879 = fma(_867, _779, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _881 = fma(_863, _779, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _883 = _839 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _889;
    float _893 = _785 * _883;
    float _895 = _841 * _883;
    float _897 = fma(_887, _811, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _899 = fma(_891, _811, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].x, _893);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].y, _895);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_879, _869, _901);
    float _915 = fma(_881, _869, _903);
    float _917 = fma(_907, _787, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _919 = fma(_911, _787, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _921 = fma(_897, _855, _913);
    float _923 = fma(_899, _855, _915);
    float _925 = fma(_917, _809, _921);
    float _927 = fma(_919, _809, _923);
    float _929 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[147].x, _925);
    float _931 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[147].y, _927);
    bool _933 = !_753;
    float _949;
    if (!_933)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _937 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _941 = _939 * _935;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = float(_83);
        float _955 = 1.0 / _953;
        float _957 = _117 * _955;
        _949 = _957;
    }
    _951 = false;
    float _959 = _949;
    float _961 = in.m_49.x;
    float _963 = in.m_49.y;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _967 = _959 + _965;
    bool _969 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _971 = isnan(_959);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _981;
    bool _985 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _987 = 1.0 / _983;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _989;
    float _993 = _931 * _963;
    float _995 = _967 * _987;
    bool _997 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _999 = isnan(_959);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = -_979;
    float _1011 = _1009 + 1.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1017;
    float _1021 = fma(_991, _995, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1023 = _1007 * _1011;
    float _1025 = fma(_1015, _995, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1027 = fma(_1019, _995, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1029 = -_1007;
    float _1031 = _1029 + 1.0;
    float _1033 = _1025 * _1023;
    float _1035 = _1027 * _1023;
    float _1037 = _1021 * _1023;
    float _1039 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1033);
    float _1041 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1035);
    float _1043 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1037);
    float _1045 = _929 * _961;
    float _1047 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1039);
    float _1049 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1041);
    float _1051 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1043);
    bool _1053 = !_985;
    float _1069;
    if (!_1053)
    {
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1057 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _1061 = _1059 * _1055;
        float _1063 = floor(_1061);
        float _1065 = -_1063;
        float _1067 = _1061 + _1065;
        _1069 = _1067;
        _1071 = true;
    }
    else
    {
        float _1073 = float(_83);
        float _1075 = 1.0 / _1073;
        float _1077 = _117 * _1075;
        _1069 = _1077;
    }
    _1071 = false;
    float _1079 = _1069;
    bool _1081 = _1079 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1083 = isnan(_1079);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1097 = _1079 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1099 = isnan(_1079);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _1079 + _1113;
    float _1117 = -_1091;
    float _1119 = _1117 + 1.0;
    bool _1121 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1123 = 1.0 / _1095;
    float _1125 = _1107 * _1119;
    float _1127 = -_1107;
    float _1129 = _1127 + 1.0;
    float _1131 = _1111 * _1123;
    float _1133 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = fma(_1131, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1137 = _1049 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1139 = _1135 * _1125;
    float _1141 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1139);
    float _1145 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1143);
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1147;
    out.m_53.y = _1149;
    out.m_53.z = _1151;
    out.m_53.w = _1153;
    bool _1155 = !_1121;
    float _1173;
    float _1175;
    if (!_1155)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1159 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1161 = float(_83);
        float _1163 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1165 = _1163 * _1157;
        float _1167 = floor(_1165);
        float _1169 = -_1167;
        float _1171 = _1165 + _1169;
        _1173 = _1161;
        _1175 = _1171;
        _1177 = true;
    }
    else
    {
        float _1179 = float(_83);
        float _1181 = 1.0 / _1179;
        float _1183 = _117 * _1181;
        _1173 = _1179;
        _1175 = _1183;
    }
    _1177 = false;
    float _1185 = _1173;
    float _1187 = _1175;
    float _1189 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1191 = int(_1189);
    float _1193 = _685 * _1045;
    float _1195 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1197 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1195);
    float _1199 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1201 = int(_1199);
    float _1203 = float(_1191);
    float _1205 = 1.0 / _1203;
    float _1207 = float(uint(_1201));
    int _1209 = ~_1201;
    int _1211 = _1209 + 1;
    float _1213 = 1.0 / _1207;
    int _1215 = ~_1201;
    int _1217 = _1215 + 1;
    float _1219 = _117 * _1205;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1223 = _1221 != 0;
    float _1225 = trunc(_1219);
    int _1227 = int(_1225);
    int _1229 = as_type<int>(_1213) + (-2);
    float _1231 = float(uint(_1227));
    float _1233 = as_type<float>(_1229) * _1231;
    float _1235 = trunc(_1233);
    float _1237 = precise::max(_1235, 0.0);
    uint _1240 = uint(_1237);
    float _1242 = float(_1201);
    int _1244 = _1211 * int(_1240);
    int _1246 = _1244 + _1227;
    float _1248 = float(_1227);
    float _1250 = float(uint(_1246));
    bool _1252 = _1248 >= _1242;
    bool _1254 = isnan(_1248);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(_1242);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = as_type<float>(_1229) * _1250;
    float _1266 = trunc(_1262);
    int _1268 = int(_1266);
    bool _1270 = !_1223;
    float _1272 = _1270 ? 7.345489978790283203125 : 1.0;
    float _1274 = _1272 * _597;
    float _1276 = trunc(_1264);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    float _1282 = floor(_1274);
    int _1284 = int(_1240) + int(_1280);
    float _1286 = 1.0 / _1185;
    int _1288 = _1217 * _1284;
    int _1290 = _1288 + _1227;
    int _1292 = ~_1268;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    bool _1298 = uint(_1290) >= uint(_1201);
    float _1300 = -_1282;
    float _1302 = _1274 + _1300;
    bool _1304 = !_1298;
    int _1306 = _1304 ? 0 : (-1);
    float _1308 = _1302 * _1242;
    float _1310 = _117 * _1242;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1284;
    int _1326 = _1324 + _1306;
    int _1328 = _1326 + 1;
    float _1330 = _1310 * _1286;
    bool _1332 = _1201 == 0;
    float _1334 = trunc(_1308);
    int _1336 = int(_1334);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1340 = _1338 != 0;
    int _1342 = _1201 * _1328;
    int _1344 = _1342 + _1227;
    int _1346 = _1201 + (-1);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1350 = _1348 != 0;
    bool _1352 = !_1332;
    int _1354 = _1352 ? _1344 : (-1);
    float _1356 = trunc(_1330);
    int _1358 = int(_1356);
    bool _1360 = !_1340;
    int _1362 = _1360 ? 0 : 1;
    float _1364 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1366 = !_1314;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = _1354 * _1296;
    bool _1372 = !_1318;
    int _1374 = _1372 ? 0 : 1;
    float _1376 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1364);
    int _1378 = abs(_1362);
    int _1380 = _1268 * _1346;
    int _1382 = _1380 + _1370;
    int _1384 = abs(_1374);
    bool _1386 = !_1322;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = _1336 * _1378;
    int _1392 = _1390 + _1227;
    int _1394 = abs(_1368);
    bool _1396 = !_1350;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = abs(_1388);
    int _1402 = _1382 * _1384;
    int _1404 = abs(_1398);
    int _1406 = _1358 * _1394;
    int _1408 = _1406 + _1402;
    float _1410 = as_type<float>(int(gl_VertexIndex));
    int _1412 = ~_1201;
    int _1414 = _1412 + 1;
    int _1416 = _1392 * _1400;
    int _1418 = _1416 + _1408;
    int _1420 = ~_1201;
    int _1422 = _1420 + 1;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1426 = _1424 != 0;
    int _1428 = _1336 * _1404;
    int _1430 = _1428 + _1418;
    int _1432 = ~_1201;
    int _1434 = _1432 + 1;
    float _1436 = float(uint(_1392));
    float _1438 = float(uint(_1430));
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1442 = _1440 != 0;
    float _1444 = as_type<float>(_1229) * _1436;
    float _1446 = as_type<float>(_1229) * _1438;
    float _1448 = trunc(_1444);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    float _1454 = trunc(_1446);
    float _1456 = precise::max(_1454, 0.0);
    uint _1458 = uint(_1456);
    int _1460 = _1422 * int(_1452);
    int _1462 = _1460 + _1392;
    int _1464 = _1434 * int(_1458);
    int _1466 = _1464 + _1430;
    float _1468 = float(uint(_1466));
    float _1470 = as_type<float>(_1229) * _1468;
    float _1472 = trunc(_1470);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    float _1478 = float(uint(_1462));
    float _1480 = _685 * _993;
    int _1482 = ~_1201;
    int _1484 = _1482 + 1;
    float _1486 = as_type<float>(_1229) * _1478;
    int _1488 = int(_1458) + int(_1476);
    float _1490 = trunc(_1486);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = _1414 * _1488;
    int _1498 = _1496 + _1430;
    bool _1500 = uint(_1498) >= uint(_1201);
    float _1502 = in.m_51.y;
    bool _1504 = !_1500;
    int _1506 = _1504 ? 0 : (-1);
    int _1508 = ~_1488;
    int _1510 = _1508 + _1506;
    int _1512 = _1510 + 1;
    int _1514 = int(_1452) + int(_1494);
    float _1516 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1518 = _1201 * _1512;
    int _1520 = _1518 + _1430;
    float _1522 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1516);
    float _1524 = _597 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1526 = _1484 * _1514;
    int _1528 = _1526 + _1392;
    bool _1530 = !_1332;
    int _1532 = _1530 ? _1520 : (-1);
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1536 = _1532 >> 31;
    float _1538 = -_1534;
    float _1540 = fma(_1524, 2.0, _1538);
    int _1542 = _1532 & 3;
    bool _1544 = _1542 != 0;
    float _1546 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1548 = _1536 & 3;
    float _1550 = -_117;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1540);
    bool _1554 = uint(_1542) > 1u;
    int _1556 = _1532 + _1548;
    int _1558 = _1532 & 3;
    bool _1560 = _1558 != 0;
    int _1562 = _1556 >> 2;
    int _1564 = _1560 ? 0 : 1;
    int _1566 = _1562 << 4;
    int _1568 = _1566 + 368;
    int _1570 = ~_1564;
    int _1572 = _1570 + 1;
    int _1574 = _1572 + 1;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1578 = _1576 != 0;
    int _1580 = _1574;
    if (!_1554)
    {
        int _1582 = ~_1564;
        int _1584 = _1582 + 1;
        _1580 = _1584;
    }
    int _1586 = _1580;
    uint _1588 = uint(int(uint(_1568) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    bool _1604 = !_1426;
    int _1606 = _1604 ? 0 : 1;
    bool _1608 = uint(_1542) >= 2u;
    bool _1610 = _1542 != 3;
    bool _1612 = !_1544;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = _1608 ? 0 : 1;
    int _1618 = as_type<int>(_1410) & 1;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>(_1410) & 2;
    bool _1624 = _1622 != 0;
    bool _1626 = !_1610;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = _1542 != 3;
    int _1632 = _1568 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[int(_1644)][_1646];
    int _1650 = ~_1616;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = abs(_1614);
    bool _1658 = !_1620;
    float _1660 = _1658 ? (-0.5) : 0.5;
    bool _1662 = !_1624;
    float _1664 = _1662 ? (-0.5) : 0.5;
    int _1666 = abs(_1586);
    float _1668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1660);
    int _1670 = _1654;
    if (_1630)
    {
        int _1672 = ~_1616;
        int _1674 = _1672 + 1;
        _1670 = _1674;
    }
    int _1676 = _1670;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1680 = uint(_1528) >= uint(_1201);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1684 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1678);
    bool _1686 = !_1680;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = fma(_1546, -2.0, _1682);
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1692;
    int _1696 = ~_1514;
    int _1698 = _1696 + _1688;
    int _1700 = _1698 + 1;
    bool _1702 = _597 > 0.5;
    int _1704 = ~_1666;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1201 * _1700;
    int _1712 = _1710 + _1392;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1716 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1718 = int(_1716);
    int _1720 = _1708 * as_type<int>(_1602);
    bool _1722 = !_1332;
    int _1724 = _1722 ? _1712 : (-1);
    float _1726 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1714);
    float _1728 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1197);
    bool _1730 = _1502 > 0.5;
    float _1732 = 1.0 / _1694;
    int _1734 = abs(_1676);
    float _1736 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    int _1738 = ~_1656;
    int _1740 = _1738 + 1;
    int _1742 = _1740 + 1;
    float _1744 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1522);
    int _1746 = abs(_1628);
    float _1748 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1750 = _1742 * as_type<int>(_1594);
    int _1752 = _1750 + _1720;
    float _1754 = _591 * _591;
    int _1756 = ~_1734;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1764 = _1187 + _1762;
    int _1766 = ~_1746;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = fma(_593, _593, _1754);
    float _1774 = float(uint(_1718));
    int _1776 = _1760 * as_type<int>(_1640);
    int _1778 = _1776 + _1752;
    float _1780 = _1764 * _1732;
    float _1782 = fma(_595, _595, _1772);
    int _1784 = abs(_1718);
    int _1786 = _1770 * as_type<int>(_1648);
    int _1788 = _1786 + _1778;
    int _1790 = abs(_1606);
    float _1792 = 1.0 / _1774;
    float _1794 = float(uint(_1784));
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1796;
    int _1800 = ~_1790;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    float _1806 = _1744 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1808 = fma(_1798, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1810 = rsqrt(_1782);
    int _1812 = _1788 * _1804;
    float _1814 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1816;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1820;
    int _1824 = _1724 * _1790;
    int _1826 = _1824 + _1812;
    int _1828 = ~_1718;
    int _1830 = _1828 + 1;
    float _1832 = fma(_1818, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1834 = 1.0 / _1794;
    int _1836 = as_type<int>(_1792) + (-2);
    float _1838 = fma(_1822, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1840 = abs(_1826);
    float _1842 = _1814 * _1668;
    float _1844 = float(uint(_1826));
    float _1846 = _1728 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1848 = ~_1784;
    int _1850 = _1848 + 1;
    float _1852 = _1810 * _595;
    float _1854 = _1810 * _593;
    float _1856 = _1810 * _591;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1860 = _1852 * _1858;
    float _1862 = as_type<float>(_1836) * _1844;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1866 = _1856 * _1864;
    float _1868 = float(uint(_1840));
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1872 = -_1860;
    float _1874 = fma(_1854, _1870, _1872);
    int _1876 = as_type<int>(_1834) + (-2);
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1880 = _1854 * _1878;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1884 = -_1866;
    float _1886 = fma(_1852, _1882, _1884);
    float _1888 = trunc(_1862);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = _1874 * _1874;
    float _1896 = as_type<float>(_1876) * _1868;
    float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1900 = -_1880;
    float _1902 = fma(_1856, _1898, _1900);
    bool _1904 = _1187 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1906 = isnan(_1187);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = fma(_1886, _1886, _1894);
    bool _1918 = _1187 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1920 = isnan(_1187);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = _1736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1932 = trunc(_1896);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    float _1938 = fma(_1902, _1902, _1916);
    float _1940 = -_1660;
    int _1942 = _1702 ? as_type<int>(_1940) : as_type<int>(_1660);
    float _1944 = -_1928;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1664;
    int _1950 = _1730 ? as_type<int>(_1948) : as_type<int>(_1664);
    bool _1952 = !_1578;
    float _1954 = _1952 ? _1660 : as_type<float>(_1942);
    float _1956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1664);
    float _1958 = rsqrt(_1938);
    int _1960 = _1830 * int(_1892);
    int _1962 = _1960 + _1826;
    bool _1964 = !_1442;
    float _1966 = _1964 ? _1664 : as_type<float>(_1950);
    float _1968 = _1748 * _1956;
    float _1970 = _1914 * _1946;
    bool _1972 = _1718 == 0;
    float _1974 = float(uint(_1962));
    int _1976 = _1850 * int(_1936);
    int _1978 = _1976 + _1840;
    float _1980 = _1968 * _1852;
    float _1982 = as_type<float>(_1836) * _1974;
    float _1984 = float(uint(_1978));
    float _1986 = _1874 * _1958;
    float _1988 = _1902 * _1958;
    float _1990 = trunc(_1982);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    float _1996 = as_type<float>(_1876) * _1984;
    float _1998 = _1886 * _1958;
    float _2000 = _1832 * _1970;
    float _2002 = _1968 * _1854;
    float _2004 = _1854 * _1986;
    float _2006 = _1808 * _1970;
    float _2008 = _1856 * _1988;
    float _2010 = trunc(_1996);
    float _2012 = precise::max(_2010, 0.0);
    uint _2014 = uint(_2012);
    float _2016 = fma(_1842, _1998, _2002);
    float _2018 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2020 = fma(_1842, _1988, _1980);
    float _2022 = -_2004;
    float _2024 = fma(_1856, _1998, _2022);
    float _2026 = _1838 * _1970;
    float _2028 = -_2008;
    float _2030 = fma(_1852, _1986, _2028);
    float _2032 = _1968 * _1856;
    float _2034 = fma(_2018, _2024, _2020);
    int _2036 = int(_1892) + int(_1994);
    float _2038 = fma(_2018, _2030, _2016);
    int _2040 = ~_1718;
    int _2042 = _2040 + 1;
    float _2044 = _1806 + _2034;
    int _2046 = ~_1784;
    int _2048 = _2046 + 1;
    float _2050 = _1846 + _2038;
    float _2052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2056 = _2044 + _2054;
    int _2058 = int(_1936) + int(_2014);
    float _2060 = -_1914;
    float _2062 = _2060 + 1.0;
    int _2064 = _2042 * _2036;
    int _2066 = _2064 + _1826;
    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2070 = _2050 + _2068;
    float _2072 = _2056 * _2056;
    int _2074 = _2048 * _2058;
    int _2076 = _2074 + _1840;
    float _2078 = _1852 * _1998;
    bool _2080 = uint(_2066) >= uint(_1718);
    float _2082 = fma(_2070, _2070, _2072);
    float _2084 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2000);
    bool _2086 = uint(_2076) >= uint(_1784);
    float _2088 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2006);
    float _2090 = sqrt(_2082);
    bool _2092 = !_2080;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = fma(_1842, _1986, _2032);
    int _2098 = _1826 ^ _1718;
    float _2100 = -_2078;
    float _2102 = fma(_1854, _1988, _2100);
    int _2104 = ~_2036;
    int _2106 = _2104 + _2094;
    int _2108 = _2106 + 1;
    float _2110 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2112 = _1718 == 0;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2116 = !_2086;
    int _2118 = _2116 ? 0 : (-1);
    int _2120 = _1718 * _2108;
    int _2122 = _2120 + _1826;
    uint _2124 = uint(int(uint(_2098) >> uint(31)));
    float _2126 = fma(_2018, _2102, _2096);
    int _2128 = ~_2118;
    int _2130 = _2058 + _2128;
    int _2132 = _2130 + 1;
    float _2134 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2026);
    int _2136 = ~int(_2124);
    int _2138 = _2136 + 1;
    float _2140 = _1930 + _2126;
    bool _2142 = !_2112;
    int _2144 = _2142 ? _2122 : (-1);
    float _2146 = _1954 + 0.5;
    bool _2148 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2150 = _2132 ^ _2138;
    float _2152 = float(_2144);
    int _2154 = ~_2138;
    int _2156 = _2154 + _2150;
    int _2158 = _2156 + 1;
    float _2160 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1690);
    float _2162 = fma(_2110, _2152, _1552);
    bool _2164 = !_1972;
    int _2166 = _2164 ? _2158 : (-1);
    float _2168 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2170 = _2114;
    float _2172 = _1690;
    float _2174 = as_type<float>(_1826);
    float _2176 = _1782;
    if (!_2148)
    {
        _2170 = _2050;
    }
    float _2178 = _2170;
    float _2180 = _2178;
    if (!_2148)
    {
        _2172 = _2044;
    }
    float _2182 = _2172;
    float _2184 = float(_2166);
    float _2186 = _2182;
    if (!_2148)
    {
        _2174 = _2140;
    }
    float _2188 = _2174;
    bool _2190 = !_2148;
    float _2192 = _2188;
    if (!_2190)
    {
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2198 = _2090 + _2196;
        float _2200 = rsqrt(_2082);
        float _2202 = _2198 * _2194;
        float _2204 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2206 = _2202 * 0.15915493667125701904296875;
        float _2208 = _2206 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = _2206 * 6.283185482025146484375;
        float _2214 = cos(_2212);
        float _2216 = fma(_2210, _2204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2218 = _2200 * _2216;
        float _2220 = _2214 + (-1.0);
        float _2222 = fma(_2070, _2218, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2224 = fma(_2056, _2218, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2226 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = fma(_2140, _2214, _2226);
        _2192 = _2228;
        _2180 = _2222;
        _2186 = _2224;
    }
    float _2230 = _2192;
    float _2232 = _2180;
    float _2234 = _2186;
    float _2236 = fma(_2110, _2146, _2162);
    float _2238 = -_1930;
    float _2240 = _2238 + _2230;
    float _2242 = -_1846;
    float _2244 = _2242 + _2232;
    float _2246 = -_1806;
    float _2248 = _2246 + _2234;
    float _2250 = -_2160;
    float _2252 = fma(_2168, _2184, _2250);
    float _2254 = _2240 * _2240;
    float _2256 = _1966 + (-0.5);
    float _2258 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2084);
    float _2260 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1684);
    float _2262 = fma(_2244, _2244, _2254);
    float _2264 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2088);
    float _2266 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2134);
    float _2268 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1726);
    float _2270 = fma(_2248, _2248, _2262);
    float _2272 = -_2168;
    float _2274 = fma(_2272, _2256, _2252);
    float _2276 = -_2260;
    float _2278 = _2276 + 1.0;
    float _2280 = sqrt(_2270);
    float _2282 = _2258 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2284 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2286 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2288 = -_2268;
    float _2290 = _2288 + 1.0;
    float _2292 = -_2278;
    float _2294 = fma(_1954, _2292, _2236);
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = fma(_1966, _2290, _2274);
    out.m_58.x = _2298;
    out.m_58.y = _2300;
    out.m_58.z = _2302;
    out.m_58.w = _2296;
    bool _2306 = _2280 > 0.0;
    out.m_60.x = _2294;
    out.m_60.y = _2304;
    bool _2308 = !_2306;
    float _2310 = _2300;
    float _2312 = _2302;
    float _2314 = _2230;
    float _2316 = _2234;
    float _2318 = _2232;
    float _2320 = _2294;
    if (!_2308)
    {
        bool _2322 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2324 = _2298;
        if (_2322)
        {
            float _2326 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2324 = _2326;
        }
        float _2328 = _2324;
        float _2330 = _2328;
        if (_2322)
        {
            float _2332 = _2328 * _593;
            _2310 = _2332;
        }
        float _2334 = _2310;
        float _2336 = _2334;
        if (_2322)
        {
            float _2338 = _2328 * _591;
            _2312 = _2338;
        }
        float _2340 = _2312;
        float _2342 = _2340;
        if (_2322)
        {
            float _2344 = _2328 * _595;
            _2330 = _2344;
        }
        float _2346 = _2330;
        float _2348 = _2346;
        float _2350 = _2346;
        if (!_2322)
        {
            float _2352 = _117 + 1.0;
            float _2354 = _2352;
            if (!_157)
            {
                float _2356 = _2352 * _2352;
                float _2358 = _2356 * 0.5;
                _2348 = _2358;
            }
            float _2360 = _2348;
            float _2362 = _2360;
            if (!_157)
            {
                float _2364 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2362 = _2364;
            }
            float _2366 = _2362;
            bool _2368 = !_157;
            float _2370 = _2366;
            if (!_2368)
            {
                float _2372 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2374 = log2(_2372);
                float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2378 = _2376 + 1.0;
                float _2380 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2382 = _2374 * _2352;
                float _2384 = 1.0 / _2378;
                float _2386 = _2380 * 0.693147182464599609375;
                float _2388 = exp2(_2382);
                float _2390 = 1.0 / _2386;
                float _2392 = _2388 + (-1.0);
                float _2394 = -_2392;
                float _2396 = fma(_2394, _2390, _2352);
                float _2398 = _2396 * _2384;
                float _2400 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2370 = _2400;
            }
            float _2402 = _2370;
            float _2404 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2406 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2408 = !_157;
            if (!_2408)
            {
                float _2410 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2412 = log2(_2410);
                float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2416 = _2414 + 1.0;
                float _2418 = 1.0 / _2416;
                float _2420 = _2412 * _2352;
                float _2422 = exp2(_2420);
                float _2424 = -_2422;
                float _2426 = _2424 + 1.0;
                float _2428 = _2426 * _2418;
                _2354 = _2428;
            }
            float _2430 = _2354;
            float _2432 = fma(_2430, _143, _2406);
            float _2434 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2436 = fma(_2430, _141, _2404);
            float _2438 = -_339;
            float _2440 = _2438 + _2432;
            float _2442 = fma(_2430, _145, _2434);
            float _2444 = -_345;
            float _2446 = _2444 + _2436;
            float _2448 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2450 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2452 = -_351;
            float _2454 = _2452 + _2442;
            float _2456 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2458 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2448);
            float _2460 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2450);
            float _2462 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2456);
            float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2458);
            float _2466 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2460);
            float _2468 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2462);
            float _2470 = _2464 * _2464;
            float _2472 = fma(_2466, _2466, _2470);
            float _2474 = fma(_2468, _2468, _2472);
            _2176 = _2474;
            _689 = _2464;
            _691 = _2466;
            _693 = _2468;
            _2336 = _2466;
            _2342 = _2464;
            _2350 = _2468;
        }
        float _2476 = _2176;
        float _2478 = _689;
        float _2480 = _691;
        float _2482 = _693;
        float _2484 = _2336;
        float _2486 = _2342;
        float _2488 = _2350;
        float _2490 = sqrt(_2476);
        float _2492 = rsqrt(_2270);
        bool _2494 = _2490 > 0.0;
        float _2496 = _2244 * _2492;
        float _2498 = _2240 * _2492;
        float _2500 = _2248 * _2492;
        bool _2502 = !_2494;
        _695 = _2482;
        if (!_2502)
        {
            float _2504 = rsqrt(_2476);
            float _2506 = _2504 * _2478;
            float _2508 = _2504 * _2480;
            float _2510 = _2498 * _2506;
            float _2512 = _2504 * _2482;
            float _2514 = fma(_2496, _2508, _2510);
            float _2516 = fma(_2500, _2512, _2514);
            float _2518 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2520 = fma(_2484, _2518, _2232);
            float _2522 = fma(_2486, _2518, _2230);
            float _2524 = fma(_2488, _2518, _2234);
            _2314 = _2522;
            _2316 = _2524;
            _2318 = _2520;
        }
    }
    float _2526 = _2314;
    float _2528 = _2316;
    float _2530 = _2318;
    float _2532 = _695;
    float _2534 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2536 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2538 = isnan(0.5);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2544 = _2540 || _2542;
    float _2546 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2534);
    float _2548 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2550 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2552 = isnan(0.5);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2558 = _2554 || _2556;
    float _2560 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2546);
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2564 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2548);
    float _2566 = 1.0 / _2562;
    float _2568 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2564);
    float _2570 = _2532;
    float _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2544)
    {
        _2570 = _2526;
    }
    float _2574 = _2570;
    float _2576 = _2568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2578 = _2576 + _2562;
    float _2580 = _2578 * _2566;
    float _2582 = _2580 * 0.5;
    float _2584 = _2566;
    float _2586 = _2582;
    float _2588 = _2574;
    if (_2544)
    {
        _2584 = _2528;
    }
    float _2590 = _2584;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2592);
    float _2596 = _2594;
    float _2598 = _2590;
    if (_2544)
    {
        _2586 = _2530;
    }
    float _2600 = _2586;
    float _2602 = _2600;
    if (_2558)
    {
        _2572 = 1.0;
    }
    float _2604 = _2572;
    float _2606 = 1.0 / _2594;
    float _2608 = _2604;
    if (!_2544)
    {
        float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2612 = _1930 + _2610;
        float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2616 = _1846 + _2614;
        float _2618 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2620 = -_1846;
        float _2622 = _2620 + _2530;
        float _2624 = _2612 * _2612;
        float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2628 = _1806 + _2626;
        float _2630 = -_1806;
        float _2632 = _2630 + _2528;
        float _2634 = fma(_2616, _2616, _2624);
        float _2636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2638 = fma(_2628, _2628, _2634);
        float _2640 = sqrt(_2638);
        float _2642 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2644 = precise::min(_2640, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2646 = _2644 * _2636;
        float _2648 = -_1930;
        float _2650 = _2648 + _2526;
        float _2652 = _2642 * _2646;
        float _2654 = fma(_2622, _2652, _1846);
        float _2656 = fma(_2650, _2652, _1930);
        float _2658 = fma(_2632, _2652, _1806);
        _2596 = _2618;
        _2588 = _2656;
        _2602 = _2654;
        _2598 = _2658;
    }
    float _2660 = _2596;
    float _2662 = _2588;
    float _2664 = _2602;
    float _2666 = _2598;
    float _2668 = _2660;
    if (_2558)
    {
        _2668 = 1.0;
    }
    float _2670 = _2668;
    float _2672 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2674 = _2606 * _2672;
    float _2676 = _2670;
    if (!_2558)
    {
        float _2678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2680 = _2678 * 0.15915493667125701904296875;
        float _2682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2684 = _2680 * 6.283185482025146484375;
        float _2686 = cos(_2684);
        float _2688 = _2682 * 0.15915493667125701904296875;
        float _2690 = _2680 * 6.283185482025146484375;
        float _2692 = sin(_2690);
        float _2694 = 1.0 / _2686;
        float _2696 = _2688 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = _2692 * _2694;
        float _2702 = _2688 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2708 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2706;
        float _2710 = _2698 * _2700;
        float _2712 = 1.0 / _2708;
        float _2714 = 1.0 / _2710;
        float _2716 = _2704 * _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2720 = fma(_2674, _2716, _2718);
        float _2722 = _2720 * _2712;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        _419 = _2680;
        _2608 = _2724;
    }
    float _2726 = _419;
    float _2728 = _2608;
    float _2730 = _2726;
    if (!_2558)
    {
        float _2732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2734 = _2732 * 0.15915493667125701904296875;
        float _2736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2738 = _2734 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2736 * 0.15915493667125701904296875;
        float _2744 = _2734 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = 1.0 / _2740;
        float _2750 = _2742 * 6.283185482025146484375;
        float _2752 = cos(_2750);
        float _2754 = _2746 * _2748;
        float _2756 = _2742 * 6.283185482025146484375;
        float _2758 = sin(_2756);
        float _2760 = _2752 * _2754;
        float _2762 = 1.0 / _2760;
        float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2766 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2764;
        float _2768 = 1.0 / _2766;
        float _2770 = _2758 * _2762;
        float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2774 = fma(_2674, _2770, _2772);
        float _2776 = _2774 * _2768;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = -_2778;
        float _2782 = _2780 + 1.0;
        _2730 = _2760;
        _2676 = _2782;
    }
    float _2784 = _2730;
    float _2786 = _2676;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2790 = _2662 + _2788;
    float _2792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2794 = _2664 + _2792;
    float _2796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2798 = _2666 + _2796;
    float _2800 = _2790 * _2790;
    float _2802 = fma(_2794, _2794, _2800);
    float _2804 = fma(_2798, _2798, _2802);
    float _2806 = rsqrt(_2804);
    float _2808 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2810 = _2794 * _2808;
    float _2812 = _2798 * _2808;
    float _2814 = _2810 * _2810;
    float _2816 = _2812 * _2812;
    float _2818 = _2814 + _2816;
    float _2820 = sqrt(_2818);
    bool _2822 = _2820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = _2820 + _2824;
    float _2828 = _2798;
    float _2830 = _2800;
    float _2832 = _2826;
    float _2834 = _2810;
    if (_2822)
    {
        float _2836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2828 = _2836;
    }
    float _2838 = _2828;
    if (_2822)
    {
        float _2840 = rsqrt(_2818);
        _2830 = _2840;
    }
    float _2842 = _2830;
    float _2844 = _2842;
    if (_2822)
    {
        float _2846 = _2826 * _2838;
        _2832 = _2846;
    }
    float _2848 = _2832;
    if (_2822)
    {
        float _2850 = _2848 * 0.15915493667125701904296875;
        _421 = _2850;
    }
    float _2852 = _421;
    float _2854 = _2806;
    if (_2822)
    {
        float _2856 = _2852 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        _2854 = _2858;
    }
    float _2860 = _2854;
    float _2862 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2864 = precise::max(0.0, _2862);
    float _2866 = _2784;
    float _2868 = _2864;
    float _2870 = _2862;
    if (_2822)
    {
        float _2872 = _2852 * 6.283185482025146484375;
        float _2874 = cos(_2872);
        _2866 = _2874;
    }
    float _2876 = _2866;
    float _2878 = -_2808;
    float _2880 = -_2864;
    float _2882 = fma(_2790, _2878, _2880);
    float _2884 = _2882;
    if (_2822)
    {
        float _2886 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2868 = _2886;
    }
    float _2888 = _2868;
    float _2890 = sqrt(_2804);
    float _2892 = _2860;
    float _2894 = _2888;
    if (_2822)
    {
        float _2896 = fma(_2860, _2888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2892 = _2896;
    }
    float _2898 = _2892;
    float _2900 = _2898;
    if (_2822)
    {
        float _2902 = _2876 + (-1.0);
        _2870 = _2902;
    }
    float _2904 = _2870;
    float _2906 = _2904;
    if (_2822)
    {
        float _2908 = _2842 * _2898;
        _2320 = _2908;
    }
    float _2910 = _2320;
    if (!_2822)
    {
        _2844 = _2882;
    }
    float _2912 = _2844;
    float _2914 = _2912;
    if (_2822)
    {
        float _2916 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2894 = _2916;
    }
    float _2918 = _2894;
    if (_2822)
    {
        float _2920 = _2810 * _2910;
        _2834 = _2920;
    }
    float _2922 = _2834;
    if (!_2822)
    {
        _2900 = _2812;
    }
    float _2924 = _2900;
    float _2926 = _2924;
    if (_2822)
    {
        float _2928 = _2812 * _2910;
        _2926 = _2928;
    }
    float _2930 = _2926;
    if (!_2822)
    {
        _2906 = _2814;
    }
    float _2932 = _2906;
    float _2934 = _2932;
    if (_2822)
    {
        float _2936 = fma(_2882, _2876, _2918);
        _2914 = _2936;
    }
    float _2938 = _2914;
    if (_2822)
    {
        float _2940 = _2922 * _2922;
        _2934 = _2940;
    }
    float _2942 = _2934;
    if (!_2822)
    {
        _2884 = _2816;
    }
    float _2944 = _2884;
    float _2946 = _2944;
    if (_2822)
    {
        float _2948 = _2930 * _2930;
        _2946 = _2948;
    }
    float _2950 = _2946;
    float _2952 = fma(_2938, _2938, _2942);
    float _2954 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2956 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2958 = _2952 + _2950;
    float _2960 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2954);
    float _2962 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2966 = fma(_2890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2964);
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = rsqrt(_2958);
    float _2972 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2974 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2960);
    float _2976 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2962);
    float _2978 = -_2968;
    float _2980 = _2978 + 1.0;
    float _2982 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2984 = _2974 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2986 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2956);
    float _2988 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2976);
    float _2990 = abs(_2980);
    float _2992 = log2(_2990);
    float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2996 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2982);
    float _2998 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2986);
    float _3000 = _2988 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3002 = -_2994;
    float _3004 = fma(_3002, _2972, 1.0);
    float _3006 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2996);
    float _3008 = _2970 * _2922;
    float _3010 = _2998 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3012 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3014 = _2970 * _2938;
    float _3016 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3018 = _2970 * _2930;
    float _3020 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3012);
    float _3022 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3024 = -_3016;
    float _3026 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3024);
    float _3028 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3030 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3020);
    float _3032 = log2(_3004);
    float _3034 = -_3018;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3026);
    float _3038 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3040 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3030);
    float _3042 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3044 = fma(_3036, -0.5, 0.5);
    float _3046 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3038);
    float _3048 = exp2(_3028);
    float _3050 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3042);
    float _3052 = fma(_3036, 0.5, 0.5);
    float _3054 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3046);
    float _3056 = _3014 + 1.0;
    float _3058 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3050);
    float _3060 = 1.0 / _3040;
    float _3062 = fma(_3052, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3064 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3058);
    float _3066 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3054);
    float _3068 = _3032 * 0.693147182464599609375;
    float _3070 = fma(_3052, _3062, -0.212114393711090087890625);
    float _3072 = sqrt(_3044);
    float _3074 = -_3014;
    float _3076 = fma(_3048, _3056, _3074);
    float _3078 = fma(_3052, _3070, 1.570728778839111328125);
    float _3080 = _3068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3082 = fma(_3076, 0.5, 0.5);
    float _3084 = _3064 * _3060;
    float _3086 = _3066 * _3060;
    float _3088 = fma(_3084, 0.5, 0.5);
    float _3090 = fma(_3086, -0.5, 0.5);
    float _3092 = _3072 * 0.636619746685028076171875;
    float3 _7833 = float3(_3088, _3090, _3080);
    float _3094 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7833, float3(0.0), isnan(_7833)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7833, float3(0.0), isnan(_7833)), level(0.0)).x;
    float3 _7844 = float3(_3088, _3090, _3080);
    float4 _3097 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7844, float3(0.0), isnan(_7844)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7844, float3(0.0), isnan(_7844)), level(0.0)).xyzw;
    float _3099 = _3097.x;
    float _3101 = _3097.y;
    float _3103 = _3097.z;
    float _3105 = _3097.w;
    float _3107 = -_3078;
    float _3109 = fma(_3092, _3107, 1.0);
    float2 _7866 = float2(_3109, _3082);
    float3 _3113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7866, float2(0.0), isnan(_7866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7866, float2(0.0), isnan(_7866)), level(0.0)).xyz;
    float _3115 = _3113.x;
    float _3117 = _3113.y;
    float _3119 = _3113.z;
    float _3121 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3123 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3125 = _2728 > 0.0;
    bool _3127 = isnan(_2728);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan(0.0);
    bool _3133 = _3129 || _3131;
    float _3135 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3123);
    float _3137 = exp2(_3121);
    bool _3139 = _2786 <= 0.0;
    bool _3141 = !_3133;
    bool _3143 = _3139 || _3141;
    float _3145 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3135);
    float _3147 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3145);
    float _3149 = _2728 * _2786;
    float _3151 = _3147 + _3040;
    float _3153 = _3149 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3155 = _3151 * 0.5;
    float _3157 = -_3137;
    float _3159 = _3157 + 1.0;
    float _3161 = _3153 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _3064;
    out.gl_Position.y = _3066;
    out.gl_Position.z = _3147;
    out.gl_Position.w = _3040;
    float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _3155;
    out.m_62.w = _3040;
    out.m_45.x = _3161;
    float _3165 = _3163 * _3094;
    float _3167 = -_3163;
    float _3169 = _3167 + 1.0;
    float _3171 = _3105 * _3165;
    float _3173 = _3119 * _3165;
    float _3175 = fma(_3115, _3171, _3099);
    float _3177 = fma(_3117, _3171, _3101);
    float _3179 = _3105 * _3169;
    float _3181 = fma(_3105, _3173, _3103);
    out.m_64.x = _3175;
    out.m_64.y = _3177;
    out.m_64.z = _3181;
    out.m_64.w = _3179;
    if (!_3143)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3183 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3183;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1177 = false;
    bool _1071 = false;
    bool _951 = false;
    bool _713 = false;
    bool _469 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3240 = as_type<float>(_99);
        out.gl_Position.z = _3240;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_113)
    {
        float _123 = float(_83);
        _119 = _123;
    }
    float _125 = _119;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    float _139 = as_type<float>(_137);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3310 = as_type<float>(_137);
        out.gl_Position.z = _3310;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    float _147 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _147;
    if (!_157)
    {
        float _161 = _147 * _147;
        float _163 = _161 * 0.5;
        _139 = _163;
    }
    float _165 = _139;
    float _167 = 0.0;
    float _169 = _165;
    if (!_157)
    {
        float _171 = _117 * _117;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    if (!_157)
    {
        float _177 = _165 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _177;
    }
    float _179 = _169;
    bool _181 = !_157;
    float _183 = _179;
    float _185 = 0.0;
    if (!_181)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _147 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _147);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _203;
        _183 = _215;
        _185 = _205;
    }
    float _217 = _121;
    float _219 = _183;
    float _221 = _185;
    bool _223 = !_157;
    float _225 = _217;
    float _227 = _221;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _147 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _225 = _241;
        _227 = _235;
        _159 = _247;
    }
    float _249 = _225;
    float _251 = _227;
    float _253 = _159;
    float _255 = _251;
    float _257 = _249;
    if (!_157)
    {
        _255 = _117;
    }
    float _259 = _255;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _259;
    if (!_157)
    {
        float _267 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _267;
    }
    float _269 = _257;
    bool _271 = !_157;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _117 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _117);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_157;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _117 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_253, _143, _263);
    float _335 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = fma(_253, _141, _261);
    float _339 = fma(_329, _143, _331);
    float _341 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_329, _141, _335);
    float _347 = -_339;
    float _349 = _333 + _347;
    float _351 = fma(_329, _145, _341);
    float _353 = fma(_253, _145, _343);
    float _355 = -_345;
    float _357 = _337 + _355;
    float _359 = _349 * _349;
    float _361 = in.m_49.w;
    float _363 = -_351;
    float _365 = _353 + _363;
    float _367 = _349 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = fma(_357, _357, _359);
    float _371 = _349 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = _349 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = in.m_42.x;
    float _383 = in.m_42.y;
    float _385 = in.m_42.z;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _391 = sqrt(_377);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _395 = _391 >= 9.9999999747524270787835121154785e-07;
    bool _397 = isnan(_391);
    bool _399 = _395 || _397;
    bool _401 = isnan(9.9999999747524270787835121154785e-07);
    bool _403 = _399 || _401;
    float _405 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _407 = fma(_337, _361, _381);
    float _409 = fma(_333, _361, _383);
    float _411 = fma(_353, _361, _385);
    float _413 = _379;
    float _415 = _365;
    float _417 = _393;
    float _419 = _351;
    float _421 = _339;
    if (_403)
    {
        _413 = _389;
    }
    float _423 = _413;
    float _425 = _423;
    if (_403)
    {
        _415 = _405;
    }
    float _427 = _415;
    float _429 = _427;
    if (!_403)
    {
        bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _433 = !_431;
        if (!_433)
        {
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _445);
            float _453 = _447 * _447;
            float _455 = fma(_449, _449, _453);
            float _457 = fma(_451, _451, _455);
            float _459 = rsqrt(_457);
            float _461 = _459 * 9.9999999747524270787835121154785e-07;
            float _463 = _449 * _461;
            float _465 = _447 * _461;
            float _467 = _451 * _461;
            _429 = _465;
            _425 = _463;
            _417 = _467;
            _469 = true;
        }
        else
        {
            float _471 = _143 * _143;
            float _473 = fma(_141, _141, _471);
            float _475 = fma(_145, _145, _473);
            float _477 = sqrt(_475);
            bool _479 = _477 >= 9.9999999747524270787835121154785e-07;
            bool _481 = isnan(_477);
            bool _483 = _479 || _481;
            bool _485 = isnan(9.9999999747524270787835121154785e-07);
            bool _487 = _483 || _485;
            if (!_487)
            {
                float _489 = _383 * _383;
                float _491 = fma(_381, _381, _489);
                float _493 = fma(_385, _385, _491);
                float _495 = sqrt(_493);
                bool _497 = _495 >= 9.9999999747524270787835121154785e-07;
                bool _499 = isnan(_495);
                bool _501 = _497 || _499;
                bool _503 = isnan(9.9999999747524270787835121154785e-07);
                bool _505 = _501 || _503;
                if (!_505)
                {
                    float _507 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _507);
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _509);
                    float _513 = rsqrt(_511);
                    float _515 = _513 * 9.9999999747524270787835121154785e-07;
                    float _517 = _515 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _519 = _515 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _521 = _515 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _429 = _519;
                    _425 = _517;
                    _417 = _521;
                    _469 = true;
                }
                else
                {
                    float _523 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _529 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
                    float _531 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _525);
                    float _533 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
                    float _535 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _529);
                    float _537 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _531);
                    float _539 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _533);
                    float _541 = _535 * _535;
                    float _543 = fma(_537, _537, _541);
                    float _545 = fma(_539, _539, _543);
                    float _547 = rsqrt(_545);
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    float _551 = _537 * _549;
                    float _553 = _535 * _549;
                    float _555 = _539 * _549;
                    _429 = _553;
                    _425 = _551;
                    _417 = _555;
                    _469 = true;
                }
            }
            else
            {
                float _557 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _559 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _561 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _563 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
                float _565 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
                float _567 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _561);
                float _569 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _563);
                float _571 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _565);
                float _573 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _567);
                float _575 = _569 * _569;
                float _577 = fma(_571, _571, _575);
                float _579 = fma(_573, _573, _577);
                float _581 = rsqrt(_579);
                float _583 = _581 * 9.9999999747524270787835121154785e-07;
                float _585 = _571 * _583;
                float _587 = _569 * _583;
                float _589 = _573 * _583;
                _429 = _587;
                _425 = _585;
                _417 = _589;
            }
        }
    }
    _469 = false;
    float _591 = _429;
    float _593 = _425;
    float _595 = _417;
    float _597 = in.m_51.x;
    float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _601 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _609 = _607 != 0;
    int _611 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _613 = _611 != 0;
    float _615 = _601 * _599;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[20].x, _615);
    float _619 = _617 * 6.283185482025146484375;
    float _621 = floor(_617);
    float _623 = _619 * 0.15915493667125701904296875;
    bool _625 = !_605;
    int _627 = _625 ? 0 : 1;
    int _629 = abs(_627);
    float _631 = _623 * 6.283185482025146484375;
    float _633 = cos(_631);
    bool _635 = !_613;
    int _637 = _635 ? 0 : 1;
    bool _639 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _641 = abs(_637);
    float _643 = -_621;
    float _645 = _617 + _643;
    bool _647 = !_609;
    int _649 = _647 ? 0 : 1;
    float _651 = float(_629);
    int _653 = abs(_649);
    float _655 = -_645;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _659 = _645 < 0.5;
    float _661 = float(_659);
    float _663 = fma(_633, 0.5, 0.5);
    float _665 = abs(_657);
    float _667 = _651 * _665;
    float _669 = float(_641);
    float _671 = -_661;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _679 = float(_653);
    float _681 = fma(_669, _677, _667);
    float _683 = abs(_673);
    float _685 = fma(_679, _683, _681);
    bool _687 = !_639;
    float _689 = _591;
    float _691 = _593;
    float _693 = _595;
    float _695 = _595;
    float _711;
    if (!_687)
    {
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _699 = _597 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _703 = _701 * _697;
        float _705 = floor(_703);
        float _707 = -_705;
        float _709 = _703 + _707;
        _711 = _709;
        _713 = true;
    }
    else
    {
        float _715 = float(_83);
        float _717 = 1.0 / _715;
        float _719 = _117 * _717;
        _711 = _719;
    }
    _713 = false;
    float _721 = _711;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _725 = _721 + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _729 = _721 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _733 = _721 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _751 = 1.0 / _737;
    bool _753 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _755 = 1.0 / _741;
    float _757 = 1.0 / _749;
    float _759 = _725 * _751;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _763 = _721 + _761;
    bool _765 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _767 = isnan(_721);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = 1.0 / _745;
    float _779 = _729 * _755;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = fma(_783, _759, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _787 = _763 * _757;
    bool _789 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _791 = isnan(_721);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_775;
    float _803 = _801 + 1.0;
    float _805 = -_799;
    float _807 = _805 + 1.0;
    float _809 = _799 * _803;
    float _811 = _733 * _777;
    bool _813 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _815 = isnan(_721);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    bool _829 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _831 = isnan(_721);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = fma(_827, _759, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _843 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _845 = isnan(_721);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _823 * _807;
    float _857 = -_823;
    float _859 = _857 + 1.0;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _869 = _853 * _859;
    float _871 = -_853;
    float _873 = _871 + 1.0;
    float _875 = -_839;
    float _877 = _875 + 1.0;
    float _879 = fma(_867, _779, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _881 = fma(_863, _779, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _883 = _839 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _889;
    float _893 = _785 * _883;
    float _895 = _841 * _883;
    float _897 = fma(_887, _811, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _899 = fma(_891, _811, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].x, _893);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[143].y, _895);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_879, _869, _901);
    float _915 = fma(_881, _869, _903);
    float _917 = fma(_907, _787, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _919 = fma(_911, _787, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _921 = fma(_897, _855, _913);
    float _923 = fma(_899, _855, _915);
    float _925 = fma(_917, _809, _921);
    float _927 = fma(_919, _809, _923);
    float _929 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[147].x, _925);
    float _931 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[147].y, _927);
    bool _933 = !_753;
    float _949;
    if (!_933)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _937 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _941 = _939 * _935;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = float(_83);
        float _955 = 1.0 / _953;
        float _957 = _117 * _955;
        _949 = _957;
    }
    _951 = false;
    float _959 = _949;
    float _961 = in.m_49.x;
    float _963 = in.m_49.y;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _967 = _959 + _965;
    bool _969 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _971 = isnan(_959);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _981;
    bool _985 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _987 = 1.0 / _983;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _989;
    float _993 = _931 * _963;
    float _995 = _967 * _987;
    bool _997 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _999 = isnan(_959);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = -_979;
    float _1011 = _1009 + 1.0;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1017;
    float _1021 = fma(_991, _995, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1023 = _1007 * _1011;
    float _1025 = fma(_1015, _995, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1027 = fma(_1019, _995, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1029 = -_1007;
    float _1031 = _1029 + 1.0;
    float _1033 = _1025 * _1023;
    float _1035 = _1027 * _1023;
    float _1037 = _1021 * _1023;
    float _1039 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1033);
    float _1041 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1035);
    float _1043 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1037);
    float _1045 = _929 * _961;
    float _1047 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1039);
    float _1049 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1041);
    float _1051 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1043);
    bool _1053 = !_985;
    float _1069;
    if (!_1053)
    {
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1057 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _1061 = _1059 * _1055;
        float _1063 = floor(_1061);
        float _1065 = -_1063;
        float _1067 = _1061 + _1065;
        _1069 = _1067;
        _1071 = true;
    }
    else
    {
        float _1073 = float(_83);
        float _1075 = 1.0 / _1073;
        float _1077 = _117 * _1075;
        _1069 = _1077;
    }
    _1071 = false;
    float _1079 = _1069;
    bool _1081 = _1079 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1083 = isnan(_1079);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1089 = _1085 || _1087;
    float _1091 = float(_1089);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1097 = _1079 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1099 = isnan(_1079);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _1079 + _1113;
    float _1117 = -_1091;
    float _1119 = _1117 + 1.0;
    bool _1121 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1123 = 1.0 / _1095;
    float _1125 = _1107 * _1119;
    float _1127 = -_1107;
    float _1129 = _1127 + 1.0;
    float _1131 = _1111 * _1123;
    float _1133 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = fma(_1131, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1137 = _1049 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1139 = _1135 * _1125;
    float _1141 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1139);
    float _1145 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1143);
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1147;
    out.m_53.y = _1149;
    out.m_53.z = _1151;
    out.m_53.w = _1153;
    bool _1155 = !_1121;
    float _1173;
    float _1175;
    if (!_1155)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1159 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1161 = float(_83);
        float _1163 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1165 = _1163 * _1157;
        float _1167 = floor(_1165);
        float _1169 = -_1167;
        float _1171 = _1165 + _1169;
        _1173 = _1161;
        _1175 = _1171;
        _1177 = true;
    }
    else
    {
        float _1179 = float(_83);
        float _1181 = 1.0 / _1179;
        float _1183 = _117 * _1181;
        _1173 = _1179;
        _1175 = _1183;
    }
    _1177 = false;
    float _1185 = _1173;
    float _1187 = _1175;
    float _1189 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1191 = int(_1189);
    float _1193 = _685 * _1045;
    float _1195 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1197 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1195);
    float _1199 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1201 = int(_1199);
    float _1203 = float(_1191);
    float _1205 = 1.0 / _1203;
    float _1207 = float(uint(_1201));
    int _1209 = ~_1201;
    int _1211 = _1209 + 1;
    float _1213 = 1.0 / _1207;
    int _1215 = ~_1201;
    int _1217 = _1215 + 1;
    float _1219 = _117 * _1205;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1223 = _1221 != 0;
    float _1225 = trunc(_1219);
    int _1227 = int(_1225);
    int _1229 = as_type<int>(_1213) + (-2);
    float _1231 = float(uint(_1227));
    float _1233 = as_type<float>(_1229) * _1231;
    float _1235 = trunc(_1233);
    float _1237 = precise::max(_1235, 0.0);
    uint _1240 = uint(_1237);
    float _1242 = float(_1201);
    int _1244 = _1211 * int(_1240);
    int _1246 = _1244 + _1227;
    float _1248 = float(_1227);
    float _1250 = float(uint(_1246));
    bool _1252 = _1248 >= _1242;
    bool _1254 = isnan(_1248);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan(_1242);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = as_type<float>(_1229) * _1250;
    float _1266 = trunc(_1262);
    int _1268 = int(_1266);
    bool _1270 = !_1223;
    float _1272 = _1270 ? 7.345489978790283203125 : 1.0;
    float _1274 = _1272 * _597;
    float _1276 = trunc(_1264);
    float _1278 = precise::max(_1276, 0.0);
    uint _1280 = uint(_1278);
    float _1282 = floor(_1274);
    int _1284 = int(_1240) + int(_1280);
    float _1286 = 1.0 / _1185;
    int _1288 = _1217 * _1284;
    int _1290 = _1288 + _1227;
    int _1292 = ~_1268;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    bool _1298 = uint(_1290) >= uint(_1201);
    float _1300 = -_1282;
    float _1302 = _1274 + _1300;
    bool _1304 = !_1298;
    int _1306 = _1304 ? 0 : (-1);
    float _1308 = _1302 * _1242;
    float _1310 = _117 * _1242;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1284;
    int _1326 = _1324 + _1306;
    int _1328 = _1326 + 1;
    float _1330 = _1310 * _1286;
    bool _1332 = _1201 == 0;
    float _1334 = trunc(_1308);
    int _1336 = int(_1334);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1340 = _1338 != 0;
    int _1342 = _1201 * _1328;
    int _1344 = _1342 + _1227;
    int _1346 = _1201 + (-1);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1350 = _1348 != 0;
    bool _1352 = !_1332;
    int _1354 = _1352 ? _1344 : (-1);
    float _1356 = trunc(_1330);
    int _1358 = int(_1356);
    bool _1360 = !_1340;
    int _1362 = _1360 ? 0 : 1;
    float _1364 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1366 = !_1314;
    int _1368 = _1366 ? 0 : 1;
    int _1370 = _1354 * _1296;
    bool _1372 = !_1318;
    int _1374 = _1372 ? 0 : 1;
    float _1376 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1364);
    int _1378 = abs(_1362);
    int _1380 = _1268 * _1346;
    int _1382 = _1380 + _1370;
    int _1384 = abs(_1374);
    bool _1386 = !_1322;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = _1336 * _1378;
    int _1392 = _1390 + _1227;
    int _1394 = abs(_1368);
    bool _1396 = !_1350;
    int _1398 = _1396 ? 0 : 1;
    int _1400 = abs(_1388);
    int _1402 = _1382 * _1384;
    int _1404 = abs(_1398);
    int _1406 = _1358 * _1394;
    int _1408 = _1406 + _1402;
    float _1410 = as_type<float>(int(gl_VertexIndex));
    int _1412 = ~_1201;
    int _1414 = _1412 + 1;
    int _1416 = _1392 * _1400;
    int _1418 = _1416 + _1408;
    int _1420 = ~_1201;
    int _1422 = _1420 + 1;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1426 = _1424 != 0;
    int _1428 = _1336 * _1404;
    int _1430 = _1428 + _1418;
    int _1432 = ~_1201;
    int _1434 = _1432 + 1;
    float _1436 = float(uint(_1392));
    float _1438 = float(uint(_1430));
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1442 = _1440 != 0;
    float _1444 = as_type<float>(_1229) * _1436;
    float _1446 = as_type<float>(_1229) * _1438;
    float _1448 = trunc(_1444);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    float _1454 = trunc(_1446);
    float _1456 = precise::max(_1454, 0.0);
    uint _1458 = uint(_1456);
    int _1460 = _1422 * int(_1452);
    int _1462 = _1460 + _1392;
    int _1464 = _1434 * int(_1458);
    int _1466 = _1464 + _1430;
    float _1468 = float(uint(_1466));
    float _1470 = as_type<float>(_1229) * _1468;
    float _1472 = trunc(_1470);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    float _1478 = float(uint(_1462));
    float _1480 = _685 * _993;
    int _1482 = ~_1201;
    int _1484 = _1482 + 1;
    float _1486 = as_type<float>(_1229) * _1478;
    int _1488 = int(_1458) + int(_1476);
    float _1490 = trunc(_1486);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = _1414 * _1488;
    int _1498 = _1496 + _1430;
    bool _1500 = uint(_1498) >= uint(_1201);
    float _1502 = in.m_51.y;
    bool _1504 = !_1500;
    int _1506 = _1504 ? 0 : (-1);
    int _1508 = ~_1488;
    int _1510 = _1508 + _1506;
    int _1512 = _1510 + 1;
    int _1514 = int(_1452) + int(_1494);
    float _1516 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1518 = _1201 * _1512;
    int _1520 = _1518 + _1430;
    float _1522 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1516);
    float _1524 = _597 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1526 = _1484 * _1514;
    int _1528 = _1526 + _1392;
    bool _1530 = !_1332;
    int _1532 = _1530 ? _1520 : (-1);
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1536 = _1532 >> 31;
    float _1538 = -_1534;
    float _1540 = fma(_1524, 2.0, _1538);
    int _1542 = _1532 & 3;
    bool _1544 = _1542 != 0;
    float _1546 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1548 = _1536 & 3;
    float _1550 = -_117;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1540);
    bool _1554 = uint(_1542) > 1u;
    int _1556 = _1532 + _1548;
    int _1558 = _1532 & 3;
    bool _1560 = _1558 != 0;
    int _1562 = _1556 >> 2;
    int _1564 = _1560 ? 0 : 1;
    int _1566 = _1562 << 4;
    int _1568 = _1566 + 368;
    int _1570 = ~_1564;
    int _1572 = _1570 + 1;
    int _1574 = _1572 + 1;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1578 = _1576 != 0;
    int _1580 = _1574;
    if (!_1554)
    {
        int _1582 = ~_1564;
        int _1584 = _1582 + 1;
        _1580 = _1584;
    }
    int _1586 = _1580;
    uint _1588 = uint(int(uint(_1568) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    bool _1604 = !_1426;
    int _1606 = _1604 ? 0 : 1;
    bool _1608 = uint(_1542) >= 2u;
    bool _1610 = _1542 != 3;
    bool _1612 = !_1544;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = _1608 ? 0 : 1;
    int _1618 = as_type<int>(_1410) & 1;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>(_1410) & 2;
    bool _1624 = _1622 != 0;
    bool _1626 = !_1610;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = _1542 != 3;
    int _1632 = _1568 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[int(_1644)][_1646];
    int _1650 = ~_1616;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = abs(_1614);
    bool _1658 = !_1620;
    float _1660 = _1658 ? (-0.5) : 0.5;
    bool _1662 = !_1624;
    float _1664 = _1662 ? (-0.5) : 0.5;
    int _1666 = abs(_1586);
    float _1668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1660);
    int _1670 = _1654;
    if (_1630)
    {
        int _1672 = ~_1616;
        int _1674 = _1672 + 1;
        _1670 = _1674;
    }
    int _1676 = _1670;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1680 = uint(_1528) >= uint(_1201);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1684 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1678);
    bool _1686 = !_1680;
    int _1688 = _1686 ? 0 : (-1);
    float _1690 = fma(_1546, -2.0, _1682);
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1692;
    int _1696 = ~_1514;
    int _1698 = _1696 + _1688;
    int _1700 = _1698 + 1;
    bool _1702 = _597 > 0.5;
    int _1704 = ~_1666;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1201 * _1700;
    int _1712 = _1710 + _1392;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1716 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1718 = int(_1716);
    int _1720 = _1708 * as_type<int>(_1602);
    bool _1722 = !_1332;
    int _1724 = _1722 ? _1712 : (-1);
    float _1726 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1714);
    float _1728 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1197);
    bool _1730 = _1502 > 0.5;
    float _1732 = 1.0 / _1694;
    int _1734 = abs(_1676);
    float _1736 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    int _1738 = ~_1656;
    int _1740 = _1738 + 1;
    int _1742 = _1740 + 1;
    float _1744 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1522);
    int _1746 = abs(_1628);
    float _1748 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1750 = _1742 * as_type<int>(_1594);
    int _1752 = _1750 + _1720;
    float _1754 = _591 * _591;
    int _1756 = ~_1734;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1764 = _1187 + _1762;
    int _1766 = ~_1746;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = fma(_593, _593, _1754);
    float _1774 = float(uint(_1718));
    int _1776 = _1760 * as_type<int>(_1640);
    int _1778 = _1776 + _1752;
    float _1780 = _1764 * _1732;
    float _1782 = fma(_595, _595, _1772);
    int _1784 = abs(_1718);
    int _1786 = _1770 * as_type<int>(_1648);
    int _1788 = _1786 + _1778;
    int _1790 = abs(_1606);
    float _1792 = 1.0 / _1774;
    float _1794 = float(uint(_1784));
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1796;
    int _1800 = ~_1790;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    float _1806 = _1744 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1808 = fma(_1798, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1810 = rsqrt(_1782);
    int _1812 = _1788 * _1804;
    float _1814 = _1193 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1816;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1820;
    int _1824 = _1724 * _1790;
    int _1826 = _1824 + _1812;
    int _1828 = ~_1718;
    int _1830 = _1828 + 1;
    float _1832 = fma(_1818, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1834 = 1.0 / _1794;
    int _1836 = as_type<int>(_1792) + (-2);
    float _1838 = fma(_1822, _1780, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1840 = abs(_1826);
    float _1842 = _1814 * _1668;
    float _1844 = float(uint(_1826));
    float _1846 = _1728 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1848 = ~_1784;
    int _1850 = _1848 + 1;
    float _1852 = _1810 * _595;
    float _1854 = _1810 * _593;
    float _1856 = _1810 * _591;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1860 = _1852 * _1858;
    float _1862 = as_type<float>(_1836) * _1844;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1866 = _1856 * _1864;
    float _1868 = float(uint(_1840));
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1872 = -_1860;
    float _1874 = fma(_1854, _1870, _1872);
    int _1876 = as_type<int>(_1834) + (-2);
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1880 = _1854 * _1878;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1884 = -_1866;
    float _1886 = fma(_1852, _1882, _1884);
    float _1888 = trunc(_1862);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = _1874 * _1874;
    float _1896 = as_type<float>(_1876) * _1868;
    float _1898 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1900 = -_1880;
    float _1902 = fma(_1856, _1898, _1900);
    bool _1904 = _1187 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1906 = isnan(_1187);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = fma(_1886, _1886, _1894);
    bool _1918 = _1187 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1920 = isnan(_1187);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = _1736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1932 = trunc(_1896);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    float _1938 = fma(_1902, _1902, _1916);
    float _1940 = -_1660;
    int _1942 = _1702 ? as_type<int>(_1940) : as_type<int>(_1660);
    float _1944 = -_1928;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1664;
    int _1950 = _1730 ? as_type<int>(_1948) : as_type<int>(_1664);
    bool _1952 = !_1578;
    float _1954 = _1952 ? _1660 : as_type<float>(_1942);
    float _1956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1664);
    float _1958 = rsqrt(_1938);
    int _1960 = _1830 * int(_1892);
    int _1962 = _1960 + _1826;
    bool _1964 = !_1442;
    float _1966 = _1964 ? _1664 : as_type<float>(_1950);
    float _1968 = _1748 * _1956;
    float _1970 = _1914 * _1946;
    bool _1972 = _1718 == 0;
    float _1974 = float(uint(_1962));
    int _1976 = _1850 * int(_1936);
    int _1978 = _1976 + _1840;
    float _1980 = _1968 * _1852;
    float _1982 = as_type<float>(_1836) * _1974;
    float _1984 = float(uint(_1978));
    float _1986 = _1874 * _1958;
    float _1988 = _1902 * _1958;
    float _1990 = trunc(_1982);
    float _1992 = precise::max(_1990, 0.0);
    uint _1994 = uint(_1992);
    float _1996 = as_type<float>(_1876) * _1984;
    float _1998 = _1886 * _1958;
    float _2000 = _1832 * _1970;
    float _2002 = _1968 * _1854;
    float _2004 = _1854 * _1986;
    float _2006 = _1808 * _1970;
    float _2008 = _1856 * _1988;
    float _2010 = trunc(_1996);
    float _2012 = precise::max(_2010, 0.0);
    uint _2014 = uint(_2012);
    float _2016 = fma(_1842, _1998, _2002);
    float _2018 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2020 = fma(_1842, _1988, _1980);
    float _2022 = -_2004;
    float _2024 = fma(_1856, _1998, _2022);
    float _2026 = _1838 * _1970;
    float _2028 = -_2008;
    float _2030 = fma(_1852, _1986, _2028);
    float _2032 = _1968 * _1856;
    float _2034 = fma(_2018, _2024, _2020);
    int _2036 = int(_1892) + int(_1994);
    float _2038 = fma(_2018, _2030, _2016);
    int _2040 = ~_1718;
    int _2042 = _2040 + 1;
    float _2044 = _1806 + _2034;
    int _2046 = ~_1784;
    int _2048 = _2046 + 1;
    float _2050 = _1846 + _2038;
    float _2052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2056 = _2044 + _2054;
    int _2058 = int(_1936) + int(_2014);
    float _2060 = -_1914;
    float _2062 = _2060 + 1.0;
    int _2064 = _2042 * _2036;
    int _2066 = _2064 + _1826;
    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2070 = _2050 + _2068;
    float _2072 = _2056 * _2056;
    int _2074 = _2048 * _2058;
    int _2076 = _2074 + _1840;
    float _2078 = _1852 * _1998;
    bool _2080 = uint(_2066) >= uint(_1718);
    float _2082 = fma(_2070, _2070, _2072);
    float _2084 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2000);
    bool _2086 = uint(_2076) >= uint(_1784);
    float _2088 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2006);
    float _2090 = sqrt(_2082);
    bool _2092 = !_2080;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = fma(_1842, _1986, _2032);
    int _2098 = _1826 ^ _1718;
    float _2100 = -_2078;
    float _2102 = fma(_1854, _1988, _2100);
    int _2104 = ~_2036;
    int _2106 = _2104 + _2094;
    int _2108 = _2106 + 1;
    float _2110 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2112 = _1718 == 0;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2116 = !_2086;
    int _2118 = _2116 ? 0 : (-1);
    int _2120 = _1718 * _2108;
    int _2122 = _2120 + _1826;
    uint _2124 = uint(int(uint(_2098) >> uint(31)));
    float _2126 = fma(_2018, _2102, _2096);
    int _2128 = ~_2118;
    int _2130 = _2058 + _2128;
    int _2132 = _2130 + 1;
    float _2134 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2026);
    int _2136 = ~int(_2124);
    int _2138 = _2136 + 1;
    float _2140 = _1930 + _2126;
    bool _2142 = !_2112;
    int _2144 = _2142 ? _2122 : (-1);
    float _2146 = _1954 + 0.5;
    bool _2148 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2150 = _2132 ^ _2138;
    float _2152 = float(_2144);
    int _2154 = ~_2138;
    int _2156 = _2154 + _2150;
    int _2158 = _2156 + 1;
    float _2160 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1690);
    float _2162 = fma(_2110, _2152, _1552);
    bool _2164 = !_1972;
    int _2166 = _2164 ? _2158 : (-1);
    float _2168 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2170 = _2114;
    float _2172 = _1690;
    float _2174 = as_type<float>(_1826);
    float _2176 = _1782;
    if (!_2148)
    {
        _2170 = _2050;
    }
    float _2178 = _2170;
    float _2180 = _2178;
    if (!_2148)
    {
        _2172 = _2044;
    }
    float _2182 = _2172;
    float _2184 = float(_2166);
    float _2186 = _2182;
    if (!_2148)
    {
        _2174 = _2140;
    }
    float _2188 = _2174;
    bool _2190 = !_2148;
    float _2192 = _2188;
    if (!_2190)
    {
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2198 = _2090 + _2196;
        float _2200 = rsqrt(_2082);
        float _2202 = _2198 * _2194;
        float _2204 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2206 = _2202 * 0.15915493667125701904296875;
        float _2208 = _2206 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = _2206 * 6.283185482025146484375;
        float _2214 = cos(_2212);
        float _2216 = fma(_2210, _2204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2218 = _2200 * _2216;
        float _2220 = _2214 + (-1.0);
        float _2222 = fma(_2070, _2218, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2224 = fma(_2056, _2218, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2226 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = fma(_2140, _2214, _2226);
        _2192 = _2228;
        _2180 = _2222;
        _2186 = _2224;
    }
    float _2230 = _2192;
    float _2232 = _2180;
    float _2234 = _2186;
    float _2236 = fma(_2110, _2146, _2162);
    float _2238 = -_1930;
    float _2240 = _2238 + _2230;
    float _2242 = -_1846;
    float _2244 = _2242 + _2232;
    float _2246 = -_1806;
    float _2248 = _2246 + _2234;
    float _2250 = -_2160;
    float _2252 = fma(_2168, _2184, _2250);
    float _2254 = _2240 * _2240;
    float _2256 = _1966 + (-0.5);
    float _2258 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2084);
    float _2260 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1684);
    float _2262 = fma(_2244, _2244, _2254);
    float _2264 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2088);
    float _2266 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2134);
    float _2268 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1726);
    float _2270 = fma(_2248, _2248, _2262);
    float _2272 = -_2168;
    float _2274 = fma(_2272, _2256, _2252);
    float _2276 = -_2260;
    float _2278 = _2276 + 1.0;
    float _2280 = sqrt(_2270);
    float _2282 = _2258 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2284 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2286 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2288 = -_2268;
    float _2290 = _2288 + 1.0;
    float _2292 = -_2278;
    float _2294 = fma(_1954, _2292, _2236);
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2298 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = fma(_1966, _2290, _2274);
    out.m_58.x = _2298;
    out.m_58.y = _2300;
    out.m_58.z = _2302;
    out.m_58.w = _2296;
    bool _2306 = _2280 > 0.0;
    out.m_60.x = _2294;
    out.m_60.y = _2304;
    bool _2308 = !_2306;
    float _2310 = _2300;
    float _2312 = _2302;
    float _2314 = _2230;
    float _2316 = _2234;
    float _2318 = _2232;
    float _2320 = _2294;
    if (!_2308)
    {
        bool _2322 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2324 = _2298;
        if (_2322)
        {
            float _2326 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2324 = _2326;
        }
        float _2328 = _2324;
        float _2330 = _2328;
        if (_2322)
        {
            float _2332 = _2328 * _593;
            _2310 = _2332;
        }
        float _2334 = _2310;
        float _2336 = _2334;
        if (_2322)
        {
            float _2338 = _2328 * _591;
            _2312 = _2338;
        }
        float _2340 = _2312;
        float _2342 = _2340;
        if (_2322)
        {
            float _2344 = _2328 * _595;
            _2330 = _2344;
        }
        float _2346 = _2330;
        float _2348 = _2346;
        float _2350 = _2346;
        if (!_2322)
        {
            float _2352 = _117 + 1.0;
            float _2354 = _2352;
            if (!_157)
            {
                float _2356 = _2352 * _2352;
                float _2358 = _2356 * 0.5;
                _2348 = _2358;
            }
            float _2360 = _2348;
            float _2362 = _2360;
            if (!_157)
            {
                float _2364 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2362 = _2364;
            }
            float _2366 = _2362;
            bool _2368 = !_157;
            float _2370 = _2366;
            if (!_2368)
            {
                float _2372 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2374 = log2(_2372);
                float _2376 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2378 = _2376 + 1.0;
                float _2380 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2382 = _2374 * _2352;
                float _2384 = 1.0 / _2378;
                float _2386 = _2380 * 0.693147182464599609375;
                float _2388 = exp2(_2382);
                float _2390 = 1.0 / _2386;
                float _2392 = _2388 + (-1.0);
                float _2394 = -_2392;
                float _2396 = fma(_2394, _2390, _2352);
                float _2398 = _2396 * _2384;
                float _2400 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2370 = _2400;
            }
            float _2402 = _2370;
            float _2404 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2406 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2408 = !_157;
            if (!_2408)
            {
                float _2410 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2412 = log2(_2410);
                float _2414 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2416 = _2414 + 1.0;
                float _2418 = 1.0 / _2416;
                float _2420 = _2412 * _2352;
                float _2422 = exp2(_2420);
                float _2424 = -_2422;
                float _2426 = _2424 + 1.0;
                float _2428 = _2426 * _2418;
                _2354 = _2428;
            }
            float _2430 = _2354;
            float _2432 = fma(_2430, _143, _2406);
            float _2434 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2436 = fma(_2430, _141, _2404);
            float _2438 = -_339;
            float _2440 = _2438 + _2432;
            float _2442 = fma(_2430, _145, _2434);
            float _2444 = -_345;
            float _2446 = _2444 + _2436;
            float _2448 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2450 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2452 = -_351;
            float _2454 = _2452 + _2442;
            float _2456 = _2440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2458 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2448);
            float _2460 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2450);
            float _2462 = fma(_2446, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2456);
            float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2458);
            float _2466 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2460);
            float _2468 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2462);
            float _2470 = _2464 * _2464;
            float _2472 = fma(_2466, _2466, _2470);
            float _2474 = fma(_2468, _2468, _2472);
            _2176 = _2474;
            _689 = _2464;
            _691 = _2466;
            _693 = _2468;
            _2336 = _2466;
            _2342 = _2464;
            _2350 = _2468;
        }
        float _2476 = _2176;
        float _2478 = _689;
        float _2480 = _691;
        float _2482 = _693;
        float _2484 = _2336;
        float _2486 = _2342;
        float _2488 = _2350;
        float _2490 = sqrt(_2476);
        float _2492 = rsqrt(_2270);
        bool _2494 = _2490 > 0.0;
        float _2496 = _2244 * _2492;
        float _2498 = _2240 * _2492;
        float _2500 = _2248 * _2492;
        bool _2502 = !_2494;
        _695 = _2482;
        if (!_2502)
        {
            float _2504 = rsqrt(_2476);
            float _2506 = _2504 * _2478;
            float _2508 = _2504 * _2480;
            float _2510 = _2498 * _2506;
            float _2512 = _2504 * _2482;
            float _2514 = fma(_2496, _2508, _2510);
            float _2516 = fma(_2500, _2512, _2514);
            float _2518 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2520 = fma(_2484, _2518, _2232);
            float _2522 = fma(_2486, _2518, _2230);
            float _2524 = fma(_2488, _2518, _2234);
            _2314 = _2522;
            _2316 = _2524;
            _2318 = _2520;
        }
    }
    float _2526 = _2314;
    float _2528 = _2316;
    float _2530 = _2318;
    float _2532 = _695;
    float _2534 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2536 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2538 = isnan(0.5);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2544 = _2540 || _2542;
    float _2546 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2534);
    float _2548 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2550 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2552 = isnan(0.5);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2558 = _2554 || _2556;
    float _2560 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2546);
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2564 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2548);
    float _2566 = 1.0 / _2562;
    float _2568 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2564);
    float _2570 = _2532;
    float _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2544)
    {
        _2570 = _2526;
    }
    float _2574 = _2570;
    float _2576 = _2568 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2578 = _2576 + _2562;
    float _2580 = _2578 * _2566;
    float _2582 = _2580 * 0.5;
    float _2584 = _2566;
    float _2586 = _2582;
    float _2588 = _2574;
    if (_2544)
    {
        _2584 = _2528;
    }
    float _2590 = _2584;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2592);
    float _2596 = _2594;
    float _2598 = _2590;
    if (_2544)
    {
        _2586 = _2530;
    }
    float _2600 = _2586;
    float _2602 = _2600;
    if (_2558)
    {
        _2572 = 1.0;
    }
    float _2604 = _2572;
    float _2606 = 1.0 / _2594;
    float _2608 = _2604;
    if (!_2544)
    {
        float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2612 = _1930 + _2610;
        float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2616 = _1846 + _2614;
        float _2618 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2620 = -_1846;
        float _2622 = _2620 + _2530;
        float _2624 = _2612 * _2612;
        float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2628 = _1806 + _2626;
        float _2630 = -_1806;
        float _2632 = _2630 + _2528;
        float _2634 = fma(_2616, _2616, _2624);
        float _2636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2638 = fma(_2628, _2628, _2634);
        float _2640 = sqrt(_2638);
        float _2642 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2644 = precise::min(_2640, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2646 = _2644 * _2636;
        float _2648 = -_1930;
        float _2650 = _2648 + _2526;
        float _2652 = _2642 * _2646;
        float _2654 = fma(_2622, _2652, _1846);
        float _2656 = fma(_2650, _2652, _1930);
        float _2658 = fma(_2632, _2652, _1806);
        _2596 = _2618;
        _2588 = _2656;
        _2602 = _2654;
        _2598 = _2658;
    }
    float _2660 = _2596;
    float _2662 = _2588;
    float _2664 = _2602;
    float _2666 = _2598;
    float _2668 = _2660;
    if (_2558)
    {
        _2668 = 1.0;
    }
    float _2670 = _2668;
    float _2672 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2674 = _2606 * _2672;
    float _2676 = _2670;
    if (!_2558)
    {
        float _2678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2680 = _2678 * 0.15915493667125701904296875;
        float _2682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2684 = _2680 * 6.283185482025146484375;
        float _2686 = cos(_2684);
        float _2688 = _2682 * 0.15915493667125701904296875;
        float _2690 = _2680 * 6.283185482025146484375;
        float _2692 = sin(_2690);
        float _2694 = 1.0 / _2686;
        float _2696 = _2688 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        float _2700 = _2692 * _2694;
        float _2702 = _2688 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2708 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2706;
        float _2710 = _2698 * _2700;
        float _2712 = 1.0 / _2708;
        float _2714 = 1.0 / _2710;
        float _2716 = _2704 * _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2720 = fma(_2674, _2716, _2718);
        float _2722 = _2720 * _2712;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        _419 = _2680;
        _2608 = _2724;
    }
    float _2726 = _419;
    float _2728 = _2608;
    float _2730 = _2726;
    if (!_2558)
    {
        float _2732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2734 = _2732 * 0.15915493667125701904296875;
        float _2736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2738 = _2734 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2736 * 0.15915493667125701904296875;
        float _2744 = _2734 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = 1.0 / _2740;
        float _2750 = _2742 * 6.283185482025146484375;
        float _2752 = cos(_2750);
        float _2754 = _2746 * _2748;
        float _2756 = _2742 * 6.283185482025146484375;
        float _2758 = sin(_2756);
        float _2760 = _2752 * _2754;
        float _2762 = 1.0 / _2760;
        float _2764 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2766 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2764;
        float _2768 = 1.0 / _2766;
        float _2770 = _2758 * _2762;
        float _2772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2774 = fma(_2674, _2770, _2772);
        float _2776 = _2774 * _2768;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = -_2778;
        float _2782 = _2780 + 1.0;
        _2730 = _2760;
        _2676 = _2782;
    }
    float _2784 = _2730;
    float _2786 = _2676;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2790 = _2662 + _2788;
    float _2792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2794 = _2664 + _2792;
    float _2796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2798 = _2666 + _2796;
    float _2800 = _2790 * _2790;
    float _2802 = fma(_2794, _2794, _2800);
    float _2804 = fma(_2798, _2798, _2802);
    float _2806 = rsqrt(_2804);
    float _2808 = _2806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2810 = _2794 * _2808;
    float _2812 = _2798 * _2808;
    float _2814 = _2810 * _2810;
    float _2816 = _2812 * _2812;
    float _2818 = _2814 + _2816;
    float _2820 = sqrt(_2818);
    bool _2822 = _2820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = _2820 + _2824;
    float _2828 = _2798;
    float _2830 = _2800;
    float _2832 = _2826;
    float _2834 = _2810;
    if (_2822)
    {
        float _2836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2828 = _2836;
    }
    float _2838 = _2828;
    if (_2822)
    {
        float _2840 = rsqrt(_2818);
        _2830 = _2840;
    }
    float _2842 = _2830;
    float _2844 = _2842;
    if (_2822)
    {
        float _2846 = _2826 * _2838;
        _2832 = _2846;
    }
    float _2848 = _2832;
    if (_2822)
    {
        float _2850 = _2848 * 0.15915493667125701904296875;
        _421 = _2850;
    }
    float _2852 = _421;
    float _2854 = _2806;
    if (_2822)
    {
        float _2856 = _2852 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        _2854 = _2858;
    }
    float _2860 = _2854;
    float _2862 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2864 = precise::max(0.0, _2862);
    float _2866 = _2784;
    float _2868 = _2864;
    float _2870 = _2862;
    if (_2822)
    {
        float _2872 = _2852 * 6.283185482025146484375;
        float _2874 = cos(_2872);
        _2866 = _2874;
    }
    float _2876 = _2866;
    float _2878 = -_2808;
    float _2880 = -_2864;
    float _2882 = fma(_2790, _2878, _2880);
    float _2884 = _2882;
    if (_2822)
    {
        float _2886 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2868 = _2886;
    }
    float _2888 = _2868;
    float _2890 = sqrt(_2804);
    float _2892 = _2860;
    float _2894 = _2888;
    if (_2822)
    {
        float _2896 = fma(_2860, _2888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2892 = _2896;
    }
    float _2898 = _2892;
    float _2900 = _2898;
    if (_2822)
    {
        float _2902 = _2876 + (-1.0);
        _2870 = _2902;
    }
    float _2904 = _2870;
    float _2906 = _2904;
    if (_2822)
    {
        float _2908 = _2842 * _2898;
        _2320 = _2908;
    }
    float _2910 = _2320;
    if (!_2822)
    {
        _2844 = _2882;
    }
    float _2912 = _2844;
    float _2914 = _2912;
    if (_2822)
    {
        float _2916 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2894 = _2916;
    }
    float _2918 = _2894;
    if (_2822)
    {
        float _2920 = _2810 * _2910;
        _2834 = _2920;
    }
    float _2922 = _2834;
    if (!_2822)
    {
        _2900 = _2812;
    }
    float _2924 = _2900;
    float _2926 = _2924;
    if (_2822)
    {
        float _2928 = _2812 * _2910;
        _2926 = _2928;
    }
    float _2930 = _2926;
    if (!_2822)
    {
        _2906 = _2814;
    }
    float _2932 = _2906;
    float _2934 = _2932;
    if (_2822)
    {
        float _2936 = fma(_2882, _2876, _2918);
        _2914 = _2936;
    }
    float _2938 = _2914;
    if (_2822)
    {
        float _2940 = _2922 * _2922;
        _2934 = _2940;
    }
    float _2942 = _2934;
    if (!_2822)
    {
        _2884 = _2816;
    }
    float _2944 = _2884;
    float _2946 = _2944;
    if (_2822)
    {
        float _2948 = _2930 * _2930;
        _2946 = _2948;
    }
    float _2950 = _2946;
    float _2952 = fma(_2938, _2938, _2942);
    float _2954 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2956 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2958 = _2952 + _2950;
    float _2960 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2954);
    float _2962 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2966 = fma(_2890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2964);
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = rsqrt(_2958);
    float _2972 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2974 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2960);
    float _2976 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2962);
    float _2978 = -_2968;
    float _2980 = _2978 + 1.0;
    float _2982 = _2662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2984 = _2974 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2986 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2956);
    float _2988 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2976);
    float _2990 = abs(_2980);
    float _2992 = log2(_2990);
    float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2996 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2982);
    float _2998 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2986);
    float _3000 = _2988 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3002 = -_2994;
    float _3004 = fma(_3002, _2972, 1.0);
    float _3006 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2996);
    float _3008 = _2970 * _2922;
    float _3010 = _2998 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3012 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3014 = _2970 * _2938;
    float _3016 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3018 = _2970 * _2930;
    float _3020 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3012);
    float _3022 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3024 = -_3016;
    float _3026 = fma(_3014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3024);
    float _3028 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3030 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3020);
    float _3032 = log2(_3004);
    float _3034 = -_3018;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3026);
    float _3038 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3040 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3030);
    float _3042 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3044 = fma(_3036, -0.5, 0.5);
    float _3046 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3038);
    float _3048 = exp2(_3028);
    float _3050 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3042);
    float _3052 = fma(_3036, 0.5, 0.5);
    float _3054 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3046);
    float _3056 = _3014 + 1.0;
    float _3058 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3050);
    float _3060 = 1.0 / _3040;
    float _3062 = fma(_3052, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3064 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3058);
    float _3066 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3054);
    float _3068 = _3032 * 0.693147182464599609375;
    float _3070 = fma(_3052, _3062, -0.212114393711090087890625);
    float _3072 = sqrt(_3044);
    float _3074 = -_3014;
    float _3076 = fma(_3048, _3056, _3074);
    float _3078 = fma(_3052, _3070, 1.570728778839111328125);
    float _3080 = _3068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3082 = fma(_3076, 0.5, 0.5);
    float _3084 = _3064 * _3060;
    float _3086 = _3066 * _3060;
    float _3088 = fma(_3084, 0.5, 0.5);
    float _3090 = fma(_3086, -0.5, 0.5);
    float _3092 = _3072 * 0.636619746685028076171875;
    float3 _7833 = float3(_3088, _3090, _3080);
    float _3094 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7833, float3(0.0), isnan(_7833)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7833, float3(0.0), isnan(_7833)), level(0.0)).x;
    float3 _7844 = float3(_3088, _3090, _3080);
    float4 _3097 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7844, float3(0.0), isnan(_7844)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7844, float3(0.0), isnan(_7844)), level(0.0)).xyzw;
    float _3099 = _3097.x;
    float _3101 = _3097.y;
    float _3103 = _3097.z;
    float _3105 = _3097.w;
    float _3107 = -_3078;
    float _3109 = fma(_3092, _3107, 1.0);
    float2 _7866 = float2(_3109, _3082);
    float3 _3113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7866, float2(0.0), isnan(_7866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7866, float2(0.0), isnan(_7866)), level(0.0)).xyz;
    float _3115 = _3113.x;
    float _3117 = _3113.y;
    float _3119 = _3113.z;
    float _3121 = _2992 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3123 = _3000 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3125 = _2728 > 0.0;
    bool _3127 = isnan(_2728);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan(0.0);
    bool _3133 = _3129 || _3131;
    float _3135 = fma(_3010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3123);
    float _3137 = exp2(_3121);
    bool _3139 = _2786 <= 0.0;
    bool _3141 = !_3133;
    bool _3143 = _3139 || _3141;
    float _3145 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3135);
    float _3147 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3145);
    float _3149 = _2728 * _2786;
    float _3151 = _3147 + _3040;
    float _3153 = _3149 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3155 = _3151 * 0.5;
    float _3157 = -_3137;
    float _3159 = _3157 + 1.0;
    float _3161 = _3153 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _3064;
    out.gl_Position.y = _3066;
    out.gl_Position.z = _3147;
    out.gl_Position.w = _3040;
    float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _3155;
    out.m_62.w = _3040;
    out.m_45.x = _3161;
    float _3165 = _3163 * _3094;
    float _3167 = -_3163;
    float _3169 = _3167 + 1.0;
    float _3171 = _3105 * _3165;
    float _3173 = _3119 * _3165;
    float _3175 = fma(_3115, _3171, _3099);
    float _3177 = fma(_3117, _3171, _3101);
    float _3179 = _3105 * _3169;
    float _3181 = fma(_3105, _3173, _3103);
    out.m_64.x = _3175;
    out.m_64.y = _3177;
    out.m_64.z = _3181;
    out.m_64.w = _3179;
    if (!_3143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3183 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3183;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

