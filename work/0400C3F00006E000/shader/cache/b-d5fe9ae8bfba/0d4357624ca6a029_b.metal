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
    bool _1131 = false;
    bool _1025 = false;
    bool _905 = false;
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
        float _3194 = as_type<float>(_99);
        out.gl_Position.z = _3194;
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
        float _3264 = as_type<float>(_137);
        out.gl_Position.z = _3264;
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
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _729 = _721 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _733 = _721 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _749 = 1.0 / _737;
    float _751 = 1.0 / _745;
    bool _753 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_721);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _741;
    float _767 = _725 * _749;
    bool _769 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _771 = isnan(_721);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = _729 * _751;
    bool _783 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _785 = isnan(_721);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_779;
    float _797 = _795 + 1.0;
    bool _799 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _801 = isnan(_721);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _763 * _797;
    float _813 = _733 * _765;
    float _815 = -_763;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _819;
    float _823 = _793 * _817;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _825;
    float _829 = -_793;
    float _831 = _829 + 1.0;
    float _833 = fma(_821, _767, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _839 = fma(_827, _767, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _841 = _809 * _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _847 = -_809;
    float _849 = _847 + 1.0;
    float _851 = _839 * _841;
    float _853 = _833 * _841;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _855;
    float _859 = fma(_837, _813, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _861 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[143].x, _851);
    float _863 = fma(_845, _813, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _865;
    float _869 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[143].y, _853);
    float _871 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _873 = fma(_859, _823, _861);
    float _875 = fma(_867, _781, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _877 = fma(_863, _823, _869);
    float _879 = fma(_871, _811, _873);
    float _881 = fma(_875, _811, _877);
    float _883 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[146].x, _879);
    float _885 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[146].y, _881);
    bool _887 = !_747;
    float _903;
    if (!_887)
    {
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _891 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        float _907 = float(_83);
        float _909 = 1.0 / _907;
        float _911 = _117 * _909;
        _903 = _911;
    }
    _905 = false;
    float _913 = _903;
    float _915 = in.m_49.x;
    float _917 = in.m_49.y;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _921 = _913 + _919;
    bool _923 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _925 = isnan(_913);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _935;
    bool _939 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _941 = 1.0 / _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _943;
    float _947 = _885 * _917;
    float _949 = _921 * _941;
    bool _951 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _953 = isnan(_913);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_933;
    float _965 = _963 + 1.0;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _971;
    float _975 = fma(_945, _949, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _977 = _961 * _965;
    float _979 = fma(_969, _949, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _981 = fma(_973, _949, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _983 = -_961;
    float _985 = _983 + 1.0;
    float _987 = _979 * _977;
    float _989 = _981 * _977;
    float _991 = _975 * _977;
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].y, _987);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].x, _989);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].z, _991);
    float _999 = _883 * _915;
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].y, _993);
    float _1003 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].x, _995);
    float _1005 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].z, _997);
    bool _1007 = !_939;
    float _1023;
    if (!_1007)
    {
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1011 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _1015 = _1013 * _1009;
        float _1017 = floor(_1015);
        float _1019 = -_1017;
        float _1021 = _1015 + _1019;
        _1023 = _1021;
        _1025 = true;
    }
    else
    {
        float _1027 = float(_83);
        float _1029 = 1.0 / _1027;
        float _1031 = _117 * _1029;
        _1023 = _1031;
    }
    _1025 = false;
    float _1033 = _1023;
    bool _1035 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1037 = isnan(_1033);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1051 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1053 = isnan(_1033);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1069 = _1033 + _1067;
    float _1071 = -_1045;
    float _1073 = _1071 + 1.0;
    bool _1075 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1077 = 1.0 / _1049;
    float _1079 = _1061 * _1073;
    float _1081 = -_1061;
    float _1083 = _1081 + 1.0;
    float _1085 = _1065 * _1077;
    float _1087 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1089 = fma(_1085, _1069, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1091 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1093 = _1089 * _1079;
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1097 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1093);
    float _1099 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1097);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1101;
    out.m_53.y = _1103;
    out.m_53.z = _1105;
    out.m_53.w = _1107;
    bool _1109 = !_1075;
    float _1127;
    float _1129;
    if (!_1109)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1113 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1115 = float(_83);
        float _1117 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1119 = _1117 * _1111;
        float _1121 = floor(_1119);
        float _1123 = -_1121;
        float _1125 = _1119 + _1123;
        _1127 = _1115;
        _1129 = _1125;
        _1131 = true;
    }
    else
    {
        float _1133 = float(_83);
        float _1135 = 1.0 / _1133;
        float _1137 = _117 * _1135;
        _1127 = _1133;
        _1129 = _1137;
    }
    _1131 = false;
    float _1139 = _1127;
    float _1141 = _1129;
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1145 = int(_1143);
    float _1147 = _685 * _999;
    float _1149 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1151 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1149);
    float _1153 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1155 = int(_1153);
    float _1157 = float(_1145);
    float _1159 = 1.0 / _1157;
    float _1161 = float(uint(_1155));
    int _1163 = ~_1155;
    int _1165 = _1163 + 1;
    float _1167 = 1.0 / _1161;
    int _1169 = ~_1155;
    int _1171 = _1169 + 1;
    float _1173 = _117 * _1159;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1177 = _1175 != 0;
    float _1179 = trunc(_1173);
    int _1181 = int(_1179);
    int _1183 = as_type<int>(_1167) + (-2);
    float _1185 = float(uint(_1181));
    float _1187 = as_type<float>(_1183) * _1185;
    float _1189 = trunc(_1187);
    float _1191 = precise::max(_1189, 0.0);
    uint _1194 = uint(_1191);
    float _1196 = float(_1155);
    int _1198 = _1165 * int(_1194);
    int _1200 = _1198 + _1181;
    float _1202 = float(_1181);
    float _1204 = float(uint(_1200));
    bool _1206 = _1202 >= _1196;
    bool _1208 = isnan(_1202);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(_1196);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = as_type<float>(_1183) * _1204;
    float _1220 = trunc(_1216);
    int _1222 = int(_1220);
    bool _1224 = !_1177;
    float _1226 = _1224 ? 7.345489978790283203125 : 1.0;
    float _1228 = _1226 * _597;
    float _1230 = trunc(_1218);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    float _1236 = floor(_1228);
    int _1238 = int(_1194) + int(_1234);
    float _1240 = 1.0 / _1139;
    int _1242 = _1171 * _1238;
    int _1244 = _1242 + _1181;
    int _1246 = ~_1222;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = uint(_1244) >= uint(_1155);
    float _1254 = -_1236;
    float _1256 = _1228 + _1254;
    bool _1258 = !_1252;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = _1256 * _1196;
    float _1264 = _117 * _1196;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1276 = _1274 != 0;
    int _1278 = ~_1238;
    int _1280 = _1278 + _1260;
    int _1282 = _1280 + 1;
    float _1284 = _1264 * _1240;
    bool _1286 = _1155 == 0;
    float _1288 = trunc(_1262);
    int _1290 = int(_1288);
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1294 = _1292 != 0;
    int _1296 = _1155 * _1282;
    int _1298 = _1296 + _1181;
    int _1300 = _1155 + (-1);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1304 = _1302 != 0;
    bool _1306 = !_1286;
    int _1308 = _1306 ? _1298 : (-1);
    float _1310 = trunc(_1284);
    int _1312 = int(_1310);
    bool _1314 = !_1294;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1320 = !_1268;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1308 * _1250;
    bool _1326 = !_1272;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1318);
    int _1332 = abs(_1316);
    int _1334 = _1222 * _1300;
    int _1336 = _1334 + _1324;
    int _1338 = abs(_1328);
    bool _1340 = !_1276;
    int _1342 = _1340 ? 0 : 1;
    int _1344 = _1290 * _1332;
    int _1346 = _1344 + _1181;
    int _1348 = abs(_1322);
    bool _1350 = !_1304;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = abs(_1342);
    int _1356 = _1336 * _1338;
    int _1358 = abs(_1352);
    int _1360 = _1312 * _1348;
    int _1362 = _1360 + _1356;
    float _1364 = as_type<float>(int(gl_VertexIndex));
    int _1366 = ~_1155;
    int _1368 = _1366 + 1;
    int _1370 = _1346 * _1354;
    int _1372 = _1370 + _1362;
    int _1374 = ~_1155;
    int _1376 = _1374 + 1;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1380 = _1378 != 0;
    int _1382 = _1290 * _1358;
    int _1384 = _1382 + _1372;
    int _1386 = ~_1155;
    int _1388 = _1386 + 1;
    float _1390 = float(uint(_1346));
    float _1392 = float(uint(_1384));
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1396 = _1394 != 0;
    float _1398 = as_type<float>(_1183) * _1390;
    float _1400 = as_type<float>(_1183) * _1392;
    float _1402 = trunc(_1398);
    float _1404 = precise::max(_1402, 0.0);
    uint _1406 = uint(_1404);
    float _1408 = trunc(_1400);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    int _1414 = _1376 * int(_1406);
    int _1416 = _1414 + _1346;
    int _1418 = _1388 * int(_1412);
    int _1420 = _1418 + _1384;
    float _1422 = float(uint(_1420));
    float _1424 = as_type<float>(_1183) * _1422;
    float _1426 = trunc(_1424);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = float(uint(_1416));
    float _1434 = _685 * _947;
    int _1436 = ~_1155;
    int _1438 = _1436 + 1;
    float _1440 = as_type<float>(_1183) * _1432;
    int _1442 = int(_1412) + int(_1430);
    float _1444 = trunc(_1440);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    int _1450 = _1368 * _1442;
    int _1452 = _1450 + _1384;
    bool _1454 = uint(_1452) >= uint(_1155);
    float _1456 = in.m_51.y;
    bool _1458 = !_1454;
    int _1460 = _1458 ? 0 : (-1);
    int _1462 = ~_1442;
    int _1464 = _1462 + _1460;
    int _1466 = _1464 + 1;
    int _1468 = int(_1406) + int(_1448);
    float _1470 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1472 = _1155 * _1466;
    int _1474 = _1472 + _1384;
    float _1476 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1470);
    float _1478 = _597 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1480 = _1438 * _1468;
    int _1482 = _1480 + _1346;
    bool _1484 = !_1286;
    int _1486 = _1484 ? _1474 : (-1);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1490 = _1486 >> 31;
    float _1492 = -_1488;
    float _1494 = fma(_1478, 2.0, _1492);
    int _1496 = _1486 & 3;
    bool _1498 = _1496 != 0;
    float _1500 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1502 = _1490 & 3;
    float _1504 = -_117;
    float _1506 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1494);
    bool _1508 = uint(_1496) > 1u;
    int _1510 = _1486 + _1502;
    int _1512 = _1486 & 3;
    bool _1514 = _1512 != 0;
    int _1516 = _1510 >> 2;
    int _1518 = _1514 ? 0 : 1;
    int _1520 = _1516 << 4;
    int _1522 = _1520 + 368;
    int _1524 = ~_1518;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1532 = _1530 != 0;
    int _1534 = _1528;
    if (!_1508)
    {
        int _1536 = ~_1518;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    uint _1542 = uint(int(uint(_1522) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    bool _1558 = !_1380;
    int _1560 = _1558 ? 0 : 1;
    bool _1562 = uint(_1496) >= 2u;
    bool _1564 = _1496 != 3;
    bool _1566 = !_1498;
    int _1568 = _1566 ? 0 : 1;
    int _1570 = _1562 ? 0 : 1;
    int _1572 = as_type<int>(_1364) & 1;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>(_1364) & 2;
    bool _1578 = _1576 != 0;
    bool _1580 = !_1564;
    int _1582 = _1580 ? 0 : (-1);
    bool _1584 = _1496 != 3;
    int _1586 = _1522 + 8;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    int _1604 = ~_1570;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = abs(_1568);
    bool _1612 = !_1574;
    float _1614 = _1612 ? (-0.5) : 0.5;
    bool _1616 = !_1578;
    float _1618 = _1616 ? (-0.5) : 0.5;
    int _1620 = abs(_1540);
    float _1622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1614);
    int _1624 = _1608;
    if (_1584)
    {
        int _1626 = ~_1570;
        int _1628 = _1626 + 1;
        _1624 = _1628;
    }
    int _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1634 = uint(_1482) >= uint(_1155);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1638 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1632);
    bool _1640 = !_1634;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = fma(_1500, -2.0, _1636);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1646;
    int _1650 = ~_1468;
    int _1652 = _1650 + _1642;
    int _1654 = _1652 + 1;
    bool _1656 = _597 > 0.5;
    int _1658 = ~_1620;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1155 * _1654;
    int _1666 = _1664 + _1346;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1670 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1672 = int(_1670);
    int _1674 = _1662 * as_type<int>(_1556);
    bool _1676 = !_1286;
    int _1678 = _1676 ? _1666 : (-1);
    float _1680 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1668);
    float _1682 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1151);
    bool _1684 = _1456 > 0.5;
    float _1686 = 1.0 / _1648;
    int _1688 = abs(_1630);
    float _1690 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1330);
    int _1692 = ~_1610;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    float _1698 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    int _1700 = abs(_1582);
    float _1702 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1704 = _1696 * as_type<int>(_1548);
    int _1706 = _1704 + _1674;
    float _1708 = _591 * _591;
    int _1710 = ~_1688;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1718 = _1141 + _1716;
    int _1720 = ~_1700;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    float _1726 = fma(_593, _593, _1708);
    float _1728 = float(uint(_1672));
    int _1730 = _1714 * as_type<int>(_1594);
    int _1732 = _1730 + _1706;
    float _1734 = _1718 * _1686;
    float _1736 = fma(_595, _595, _1726);
    int _1738 = abs(_1672);
    int _1740 = _1724 * as_type<int>(_1602);
    int _1742 = _1740 + _1732;
    int _1744 = abs(_1560);
    float _1746 = 1.0 / _1728;
    float _1748 = float(uint(_1738));
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1750;
    int _1754 = ~_1744;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    float _1760 = _1698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1762 = fma(_1752, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1764 = rsqrt(_1736);
    int _1766 = _1742 * _1758;
    float _1768 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1774;
    int _1778 = _1678 * _1744;
    int _1780 = _1778 + _1766;
    int _1782 = ~_1672;
    int _1784 = _1782 + 1;
    float _1786 = fma(_1772, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1788 = 1.0 / _1748;
    int _1790 = as_type<int>(_1746) + (-2);
    float _1792 = fma(_1776, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1794 = abs(_1780);
    float _1796 = _1768 * _1622;
    float _1798 = float(uint(_1780));
    float _1800 = _1682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1802 = ~_1738;
    int _1804 = _1802 + 1;
    float _1806 = _1764 * _595;
    float _1808 = _1764 * _593;
    float _1810 = _1764 * _591;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1814 = _1806 * _1812;
    float _1816 = as_type<float>(_1790) * _1798;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1820 = _1810 * _1818;
    float _1822 = float(uint(_1794));
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1826 = -_1814;
    float _1828 = fma(_1808, _1824, _1826);
    int _1830 = as_type<int>(_1788) + (-2);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1834 = _1808 * _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1838 = -_1820;
    float _1840 = fma(_1806, _1836, _1838);
    float _1842 = trunc(_1816);
    float _1844 = precise::max(_1842, 0.0);
    uint _1846 = uint(_1844);
    float _1848 = _1828 * _1828;
    float _1850 = as_type<float>(_1830) * _1822;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1854 = -_1834;
    float _1856 = fma(_1810, _1852, _1854);
    bool _1858 = _1141 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1860 = isnan(_1141);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = fma(_1840, _1840, _1848);
    bool _1872 = _1141 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1874 = isnan(_1141);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1880 = _1876 || _1878;
    float _1882 = float(_1880);
    float _1884 = _1690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1886 = trunc(_1850);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = fma(_1856, _1856, _1870);
    float _1894 = -_1614;
    int _1896 = _1656 ? as_type<int>(_1894) : as_type<int>(_1614);
    float _1898 = -_1882;
    float _1900 = _1898 + 1.0;
    float _1902 = -_1618;
    int _1904 = _1684 ? as_type<int>(_1902) : as_type<int>(_1618);
    bool _1906 = !_1532;
    float _1908 = _1906 ? _1614 : as_type<float>(_1896);
    float _1910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1618);
    float _1912 = rsqrt(_1892);
    int _1914 = _1784 * int(_1846);
    int _1916 = _1914 + _1780;
    bool _1918 = !_1396;
    float _1920 = _1918 ? _1618 : as_type<float>(_1904);
    float _1922 = _1702 * _1910;
    float _1924 = _1868 * _1900;
    bool _1926 = _1672 == 0;
    float _1928 = float(uint(_1916));
    int _1930 = _1804 * int(_1890);
    int _1932 = _1930 + _1794;
    float _1934 = _1922 * _1806;
    float _1936 = as_type<float>(_1790) * _1928;
    float _1938 = float(uint(_1932));
    float _1940 = _1828 * _1912;
    float _1942 = _1856 * _1912;
    float _1944 = trunc(_1936);
    float _1946 = precise::max(_1944, 0.0);
    uint _1948 = uint(_1946);
    float _1950 = as_type<float>(_1830) * _1938;
    float _1952 = _1840 * _1912;
    float _1954 = _1786 * _1924;
    float _1956 = _1922 * _1808;
    float _1958 = _1808 * _1940;
    float _1960 = _1762 * _1924;
    float _1962 = _1810 * _1942;
    float _1964 = trunc(_1950);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    float _1970 = fma(_1796, _1952, _1956);
    float _1972 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1974 = fma(_1796, _1942, _1934);
    float _1976 = -_1958;
    float _1978 = fma(_1810, _1952, _1976);
    float _1980 = _1792 * _1924;
    float _1982 = -_1962;
    float _1984 = fma(_1806, _1940, _1982);
    float _1986 = _1922 * _1810;
    float _1988 = fma(_1972, _1978, _1974);
    int _1990 = int(_1846) + int(_1948);
    float _1992 = fma(_1972, _1984, _1970);
    int _1994 = ~_1672;
    int _1996 = _1994 + 1;
    float _1998 = _1760 + _1988;
    int _2000 = ~_1738;
    int _2002 = _2000 + 1;
    float _2004 = _1800 + _1992;
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2010 = _1998 + _2008;
    int _2012 = int(_1890) + int(_1968);
    float _2014 = -_1868;
    float _2016 = _2014 + 1.0;
    int _2018 = _1996 * _1990;
    int _2020 = _2018 + _1780;
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2024 = _2004 + _2022;
    float _2026 = _2010 * _2010;
    int _2028 = _2002 * _2012;
    int _2030 = _2028 + _1794;
    float _2032 = _1806 * _1952;
    bool _2034 = uint(_2020) >= uint(_1672);
    float _2036 = fma(_2024, _2024, _2026);
    float _2038 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1954);
    bool _2040 = uint(_2030) >= uint(_1738);
    float _2042 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1960);
    float _2044 = sqrt(_2036);
    bool _2046 = !_2034;
    int _2048 = _2046 ? 0 : (-1);
    float _2050 = fma(_1796, _1940, _1986);
    int _2052 = _1780 ^ _1672;
    float _2054 = -_2032;
    float _2056 = fma(_1808, _1942, _2054);
    int _2058 = ~_1990;
    int _2060 = _2058 + _2048;
    int _2062 = _2060 + 1;
    float _2064 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2066 = _1672 == 0;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2070 = !_2040;
    int _2072 = _2070 ? 0 : (-1);
    int _2074 = _1672 * _2062;
    int _2076 = _2074 + _1780;
    uint _2078 = uint(int(uint(_2052) >> uint(31)));
    float _2080 = fma(_1972, _2056, _2050);
    int _2082 = ~_2072;
    int _2084 = _2012 + _2082;
    int _2086 = _2084 + 1;
    float _2088 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1980);
    int _2090 = ~int(_2078);
    int _2092 = _2090 + 1;
    float _2094 = _1884 + _2080;
    bool _2096 = !_2066;
    int _2098 = _2096 ? _2076 : (-1);
    float _2100 = _1908 + 0.5;
    bool _2102 = _2044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2104 = _2086 ^ _2092;
    float _2106 = float(_2098);
    int _2108 = ~_2092;
    int _2110 = _2108 + _2104;
    int _2112 = _2110 + 1;
    float _2114 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1644);
    float _2116 = fma(_2064, _2106, _1506);
    bool _2118 = !_1926;
    int _2120 = _2118 ? _2112 : (-1);
    float _2122 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2124 = _2068;
    float _2126 = _1644;
    float _2128 = as_type<float>(_1780);
    float _2130 = _1736;
    if (!_2102)
    {
        _2124 = _2004;
    }
    float _2132 = _2124;
    float _2134 = _2132;
    if (!_2102)
    {
        _2126 = _1998;
    }
    float _2136 = _2126;
    float _2138 = float(_2120);
    float _2140 = _2136;
    if (!_2102)
    {
        _2128 = _2094;
    }
    float _2142 = _2128;
    bool _2144 = !_2102;
    float _2146 = _2142;
    if (!_2144)
    {
        float _2148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2152 = _2044 + _2150;
        float _2154 = rsqrt(_2036);
        float _2156 = _2152 * _2148;
        float _2158 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2160 = _2156 * 0.15915493667125701904296875;
        float _2162 = _2160 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = _2160 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        float _2170 = fma(_2164, _2158, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2172 = _2154 * _2170;
        float _2174 = _2168 + (-1.0);
        float _2176 = fma(_2024, _2172, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2178 = fma(_2010, _2172, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2180 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2182 = fma(_2094, _2168, _2180);
        _2146 = _2182;
        _2134 = _2176;
        _2140 = _2178;
    }
    float _2184 = _2146;
    float _2186 = _2134;
    float _2188 = _2140;
    float _2190 = fma(_2064, _2100, _2116);
    float _2192 = -_1884;
    float _2194 = _2192 + _2184;
    float _2196 = -_1800;
    float _2198 = _2196 + _2186;
    float _2200 = -_1760;
    float _2202 = _2200 + _2188;
    float _2204 = -_2114;
    float _2206 = fma(_2122, _2138, _2204);
    float _2208 = _2194 * _2194;
    float _2210 = _1920 + (-0.5);
    float _2212 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2038);
    float _2214 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1638);
    float _2216 = fma(_2198, _2198, _2208);
    float _2218 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2042);
    float _2220 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2088);
    float _2222 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1680);
    float _2224 = fma(_2202, _2202, _2216);
    float _2226 = -_2122;
    float _2228 = fma(_2226, _2210, _2206);
    float _2230 = -_2214;
    float _2232 = _2230 + 1.0;
    float _2234 = sqrt(_2224);
    float _2236 = _2212 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2238 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2240 = _2220 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2242 = -_2222;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2232;
    float _2248 = fma(_1908, _2246, _2190);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2252 = _2238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2254 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2256 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2258 = fma(_1920, _2244, _2228);
    out.m_58.x = _2252;
    out.m_58.y = _2254;
    out.m_58.z = _2256;
    out.m_58.w = _2250;
    bool _2260 = _2234 > 0.0;
    out.m_60.x = _2248;
    out.m_60.y = _2258;
    bool _2262 = !_2260;
    float _2264 = _2254;
    float _2266 = _2256;
    float _2268 = _2184;
    float _2270 = _2188;
    float _2272 = _2186;
    float _2274 = _2248;
    if (!_2262)
    {
        bool _2276 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2278 = _2252;
        if (_2276)
        {
            float _2280 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2278 = _2280;
        }
        float _2282 = _2278;
        float _2284 = _2282;
        if (_2276)
        {
            float _2286 = _2282 * _593;
            _2264 = _2286;
        }
        float _2288 = _2264;
        float _2290 = _2288;
        if (_2276)
        {
            float _2292 = _2282 * _591;
            _2266 = _2292;
        }
        float _2294 = _2266;
        float _2296 = _2294;
        if (_2276)
        {
            float _2298 = _2282 * _595;
            _2284 = _2298;
        }
        float _2300 = _2284;
        float _2302 = _2300;
        float _2304 = _2300;
        if (!_2276)
        {
            float _2306 = _117 + 1.0;
            float _2308 = _2306;
            if (!_157)
            {
                float _2310 = _2306 * _2306;
                float _2312 = _2310 * 0.5;
                _2302 = _2312;
            }
            float _2314 = _2302;
            float _2316 = _2314;
            if (!_157)
            {
                float _2318 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2316 = _2318;
            }
            float _2320 = _2316;
            bool _2322 = !_157;
            float _2324 = _2320;
            if (!_2322)
            {
                float _2326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2328 = log2(_2326);
                float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2332 = _2330 + 1.0;
                float _2334 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2336 = _2328 * _2306;
                float _2338 = 1.0 / _2332;
                float _2340 = _2334 * 0.693147182464599609375;
                float _2342 = exp2(_2336);
                float _2344 = 1.0 / _2340;
                float _2346 = _2342 + (-1.0);
                float _2348 = -_2346;
                float _2350 = fma(_2348, _2344, _2306);
                float _2352 = _2350 * _2338;
                float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2324 = _2354;
            }
            float _2356 = _2324;
            float _2358 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2360 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2362 = !_157;
            if (!_2362)
            {
                float _2364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2366 = log2(_2364);
                float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2370 = _2368 + 1.0;
                float _2372 = 1.0 / _2370;
                float _2374 = _2366 * _2306;
                float _2376 = exp2(_2374);
                float _2378 = -_2376;
                float _2380 = _2378 + 1.0;
                float _2382 = _2380 * _2372;
                _2308 = _2382;
            }
            float _2384 = _2308;
            float _2386 = fma(_2384, _143, _2360);
            float _2388 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2390 = fma(_2384, _141, _2358);
            float _2392 = -_339;
            float _2394 = _2392 + _2386;
            float _2396 = fma(_2384, _145, _2388);
            float _2398 = -_345;
            float _2400 = _2398 + _2390;
            float _2402 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2404 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2406 = -_351;
            float _2408 = _2406 + _2396;
            float _2410 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2402);
            float _2414 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2404);
            float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2410);
            float _2418 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2412);
            float _2420 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2414);
            float _2422 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2416);
            float _2424 = _2418 * _2418;
            float _2426 = fma(_2420, _2420, _2424);
            float _2428 = fma(_2422, _2422, _2426);
            _2130 = _2428;
            _689 = _2418;
            _691 = _2420;
            _693 = _2422;
            _2290 = _2420;
            _2296 = _2418;
            _2304 = _2422;
        }
        float _2430 = _2130;
        float _2432 = _689;
        float _2434 = _691;
        float _2436 = _693;
        float _2438 = _2290;
        float _2440 = _2296;
        float _2442 = _2304;
        float _2444 = sqrt(_2430);
        float _2446 = rsqrt(_2224);
        bool _2448 = _2444 > 0.0;
        float _2450 = _2198 * _2446;
        float _2452 = _2194 * _2446;
        float _2454 = _2202 * _2446;
        bool _2456 = !_2448;
        _695 = _2436;
        if (!_2456)
        {
            float _2458 = rsqrt(_2430);
            float _2460 = _2458 * _2432;
            float _2462 = _2458 * _2434;
            float _2464 = _2452 * _2460;
            float _2466 = _2458 * _2436;
            float _2468 = fma(_2450, _2462, _2464);
            float _2470 = fma(_2454, _2466, _2468);
            float _2472 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2474 = fma(_2438, _2472, _2186);
            float _2476 = fma(_2440, _2472, _2184);
            float _2478 = fma(_2442, _2472, _2188);
            _2268 = _2476;
            _2270 = _2478;
            _2272 = _2474;
        }
    }
    float _2480 = _2268;
    float _2482 = _2270;
    float _2484 = _2272;
    float _2486 = _695;
    float _2488 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2490 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2492 = isnan(0.5);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2498 = _2494 || _2496;
    float _2500 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2488);
    float _2502 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2506 = isnan(0.5);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2512 = _2508 || _2510;
    float _2514 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2500);
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2518 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2502);
    float _2520 = 1.0 / _2516;
    float _2522 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2518);
    float _2524 = _2486;
    float _2526 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2498)
    {
        _2524 = _2480;
    }
    float _2528 = _2524;
    float _2530 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2532 = _2530 + _2516;
    float _2534 = _2532 * _2520;
    float _2536 = _2534 * 0.5;
    float _2538 = _2520;
    float _2540 = _2536;
    float _2542 = _2528;
    if (_2498)
    {
        _2538 = _2482;
    }
    float _2544 = _2538;
    float _2546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2548 = fma(_2536, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2546);
    float _2550 = _2548;
    float _2552 = _2544;
    if (_2498)
    {
        _2540 = _2484;
    }
    float _2554 = _2540;
    float _2556 = _2554;
    if (_2512)
    {
        _2526 = 1.0;
    }
    float _2558 = _2526;
    float _2560 = 1.0 / _2548;
    float _2562 = _2558;
    if (!_2498)
    {
        float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2566 = _1884 + _2564;
        float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2570 = _1800 + _2568;
        float _2572 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2574 = -_1800;
        float _2576 = _2574 + _2484;
        float _2578 = _2566 * _2566;
        float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2582 = _1760 + _2580;
        float _2584 = -_1760;
        float _2586 = _2584 + _2482;
        float _2588 = fma(_2570, _2570, _2578);
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2592 = fma(_2582, _2582, _2588);
        float _2594 = sqrt(_2592);
        float _2596 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2598 = precise::min(_2594, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2600 = _2598 * _2590;
        float _2602 = -_1884;
        float _2604 = _2602 + _2480;
        float _2606 = _2596 * _2600;
        float _2608 = fma(_2576, _2606, _1800);
        float _2610 = fma(_2604, _2606, _1884);
        float _2612 = fma(_2586, _2606, _1760);
        _2550 = _2572;
        _2542 = _2610;
        _2556 = _2608;
        _2552 = _2612;
    }
    float _2614 = _2550;
    float _2616 = _2542;
    float _2618 = _2556;
    float _2620 = _2552;
    float _2622 = _2614;
    if (_2512)
    {
        _2622 = 1.0;
    }
    float _2624 = _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2628 = _2560 * _2626;
    float _2630 = _2624;
    if (!_2512)
    {
        float _2632 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2634 = _2632 * 0.15915493667125701904296875;
        float _2636 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2638 = _2634 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2636 * 0.15915493667125701904296875;
        float _2644 = _2634 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2640;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2662 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2660;
        float _2664 = _2652 * _2654;
        float _2666 = 1.0 / _2662;
        float _2668 = 1.0 / _2664;
        float _2670 = _2658 * _2668;
        float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2674 = fma(_2628, _2670, _2672);
        float _2676 = _2674 * _2666;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _419 = _2634;
        _2562 = _2678;
    }
    float _2680 = _419;
    float _2682 = _2562;
    float _2684 = _2680;
    if (!_2512)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = _2688 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2690 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2694;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2628, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2684 = _2714;
        _2630 = _2736;
    }
    float _2738 = _2684;
    float _2740 = _2630;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2744 = _2616 + _2742;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2748 = _2618 + _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2752 = _2620 + _2750;
    float _2754 = _2744 * _2744;
    float _2756 = fma(_2748, _2748, _2754);
    float _2758 = fma(_2752, _2752, _2756);
    float _2760 = rsqrt(_2758);
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2764 = _2748 * _2762;
    float _2766 = _2752 * _2762;
    float _2768 = _2764 * _2764;
    float _2770 = _2766 * _2766;
    float _2772 = _2768 + _2770;
    float _2774 = sqrt(_2772);
    bool _2776 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2780 = _2774 + _2778;
    float _2782 = _2752;
    float _2784 = _2754;
    float _2786 = _2780;
    float _2788 = _2764;
    if (_2776)
    {
        float _2790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2790;
    }
    float _2792 = _2782;
    if (_2776)
    {
        float _2794 = rsqrt(_2772);
        _2784 = _2794;
    }
    float _2796 = _2784;
    float _2798 = _2796;
    if (_2776)
    {
        float _2800 = _2780 * _2792;
        _2786 = _2800;
    }
    float _2802 = _2786;
    if (_2776)
    {
        float _2804 = _2802 * 0.15915493667125701904296875;
        _421 = _2804;
    }
    float _2806 = _421;
    float _2808 = _2760;
    if (_2776)
    {
        float _2810 = _2806 * 6.283185482025146484375;
        float _2812 = sin(_2810);
        _2808 = _2812;
    }
    float _2814 = _2808;
    float _2816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2818 = precise::max(0.0, _2816);
    float _2820 = _2738;
    float _2822 = _2818;
    float _2824 = _2816;
    if (_2776)
    {
        float _2826 = _2806 * 6.283185482025146484375;
        float _2828 = cos(_2826);
        _2820 = _2828;
    }
    float _2830 = _2820;
    float _2832 = -_2762;
    float _2834 = -_2818;
    float _2836 = fma(_2744, _2832, _2834);
    float _2838 = _2836;
    if (_2776)
    {
        float _2840 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2822 = _2840;
    }
    float _2842 = _2822;
    float _2844 = sqrt(_2758);
    float _2846 = _2814;
    float _2848 = _2842;
    if (_2776)
    {
        float _2850 = fma(_2814, _2842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2846 = _2850;
    }
    float _2852 = _2846;
    float _2854 = _2852;
    if (_2776)
    {
        float _2856 = _2830 + (-1.0);
        _2824 = _2856;
    }
    float _2858 = _2824;
    float _2860 = _2858;
    if (_2776)
    {
        float _2862 = _2796 * _2852;
        _2274 = _2862;
    }
    float _2864 = _2274;
    if (!_2776)
    {
        _2798 = _2836;
    }
    float _2866 = _2798;
    float _2868 = _2866;
    if (_2776)
    {
        float _2870 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2848 = _2870;
    }
    float _2872 = _2848;
    if (_2776)
    {
        float _2874 = _2764 * _2864;
        _2788 = _2874;
    }
    float _2876 = _2788;
    if (!_2776)
    {
        _2854 = _2766;
    }
    float _2878 = _2854;
    float _2880 = _2878;
    if (_2776)
    {
        float _2882 = _2766 * _2864;
        _2880 = _2882;
    }
    float _2884 = _2880;
    if (!_2776)
    {
        _2860 = _2768;
    }
    float _2886 = _2860;
    float _2888 = _2886;
    if (_2776)
    {
        float _2890 = fma(_2836, _2830, _2872);
        _2868 = _2890;
    }
    float _2892 = _2868;
    if (_2776)
    {
        float _2894 = _2876 * _2876;
        _2888 = _2894;
    }
    float _2896 = _2888;
    if (!_2776)
    {
        _2838 = _2770;
    }
    float _2898 = _2838;
    float _2900 = _2898;
    if (_2776)
    {
        float _2902 = _2884 * _2884;
        _2900 = _2902;
    }
    float _2904 = _2900;
    float _2906 = fma(_2892, _2892, _2896);
    float _2908 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2910 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2912 = _2906 + _2904;
    float _2914 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2908);
    float _2916 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2920 = fma(_2844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2918);
    float _2922 = precise::clamp(_2920, 0.0, 1.0);
    float _2924 = rsqrt(_2912);
    float _2926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2928 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2914);
    float _2930 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2916);
    float _2932 = -_2922;
    float _2934 = _2932 + 1.0;
    float _2936 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2938 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2940 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2910);
    float _2942 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2930);
    float _2944 = abs(_2934);
    float _2946 = log2(_2944);
    float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2950 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2936);
    float _2952 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2940);
    float _2954 = _2942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2956 = -_2948;
    float _2958 = fma(_2956, _2926, 1.0);
    float _2960 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2950);
    float _2962 = _2924 * _2876;
    float _2964 = _2952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2966 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2968 = _2924 * _2892;
    float _2970 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2972 = _2924 * _2884;
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2966);
    float _2976 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2978 = -_2970;
    float _2980 = fma(_2968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2978);
    float _2982 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2984 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2974);
    float _2986 = log2(_2958);
    float _2988 = -_2972;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2980);
    float _2992 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2994 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2984);
    float _2996 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2998 = fma(_2990, -0.5, 0.5);
    float _3000 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2992);
    float _3002 = exp2(_2982);
    float _3004 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2996);
    float _3006 = fma(_2990, 0.5, 0.5);
    float _3008 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3000);
    float _3010 = _2968 + 1.0;
    float _3012 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = 1.0 / _2994;
    float _3016 = fma(_3006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3018 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3020 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3008);
    float _3022 = _2986 * 0.693147182464599609375;
    float _3024 = fma(_3006, _3016, -0.212114393711090087890625);
    float _3026 = sqrt(_2998);
    float _3028 = -_2968;
    float _3030 = fma(_3002, _3010, _3028);
    float _3032 = fma(_3006, _3024, 1.570728778839111328125);
    float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3036 = fma(_3030, 0.5, 0.5);
    float _3038 = _3018 * _3014;
    float _3040 = _3020 * _3014;
    float _3042 = fma(_3038, 0.5, 0.5);
    float _3044 = fma(_3040, -0.5, 0.5);
    float _3046 = _3026 * 0.636619746685028076171875;
    float3 _7712 = float3(_3042, _3044, _3034);
    float _3048 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7712, float3(0.0), isnan(_7712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7712, float3(0.0), isnan(_7712)), level(0.0)).x;
    float3 _7723 = float3(_3042, _3044, _3034);
    float4 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7723, float3(0.0), isnan(_7723)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7723, float3(0.0), isnan(_7723)), level(0.0)).xyzw;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = _3051.w;
    float _3061 = -_3032;
    float _3063 = fma(_3046, _3061, 1.0);
    float2 _7745 = float2(_3063, _3036);
    float3 _3067 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7745, float2(0.0), isnan(_7745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7745, float2(0.0), isnan(_7745)), level(0.0)).xyz;
    float _3069 = _3067.x;
    float _3071 = _3067.y;
    float _3073 = _3067.z;
    float _3075 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3077 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3079 = _2682 > 0.0;
    bool _3081 = isnan(_2682);
    bool _3083 = _3079 || _3081;
    bool _3085 = isnan(0.0);
    bool _3087 = _3083 || _3085;
    float _3089 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3077);
    float _3091 = exp2(_3075);
    bool _3093 = _2740 <= 0.0;
    bool _3095 = !_3087;
    bool _3097 = _3093 || _3095;
    float _3099 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3089);
    float _3101 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3099);
    float _3103 = _2682 * _2740;
    float _3105 = _3101 + _2994;
    float _3107 = _3103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3109 = _3105 * 0.5;
    float _3111 = -_3091;
    float _3113 = _3111 + 1.0;
    float _3115 = _3107 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _3018;
    out.gl_Position.y = _3020;
    out.gl_Position.z = _3101;
    out.gl_Position.w = _2994;
    float _3117 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _3109;
    out.m_62.w = _2994;
    out.m_45.x = _3115;
    float _3119 = _3117 * _3048;
    float _3121 = -_3117;
    float _3123 = _3121 + 1.0;
    float _3125 = _3059 * _3119;
    float _3127 = _3073 * _3119;
    float _3129 = fma(_3069, _3125, _3053);
    float _3131 = fma(_3071, _3125, _3055);
    float _3133 = _3059 * _3123;
    float _3135 = fma(_3059, _3127, _3057);
    out.m_64.x = _3129;
    out.m_64.y = _3131;
    out.m_64.z = _3135;
    out.m_64.w = _3133;
    if (!_3097)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3137;
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
    bool _1131 = false;
    bool _1025 = false;
    bool _905 = false;
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
        float _3194 = as_type<float>(_99);
        out.gl_Position.z = _3194;
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
        float _3264 = as_type<float>(_137);
        out.gl_Position.z = _3264;
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
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _729 = _721 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _733 = _721 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _749 = 1.0 / _737;
    float _751 = 1.0 / _745;
    bool _753 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_721);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _741;
    float _767 = _725 * _749;
    bool _769 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _771 = isnan(_721);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = _729 * _751;
    bool _783 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _785 = isnan(_721);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_779;
    float _797 = _795 + 1.0;
    bool _799 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _801 = isnan(_721);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _763 * _797;
    float _813 = _733 * _765;
    float _815 = -_763;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _819;
    float _823 = _793 * _817;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _825;
    float _829 = -_793;
    float _831 = _829 + 1.0;
    float _833 = fma(_821, _767, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _839 = fma(_827, _767, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _841 = _809 * _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _847 = -_809;
    float _849 = _847 + 1.0;
    float _851 = _839 * _841;
    float _853 = _833 * _841;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _855;
    float _859 = fma(_837, _813, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _861 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[143].x, _851);
    float _863 = fma(_845, _813, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _865;
    float _869 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[143].y, _853);
    float _871 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _873 = fma(_859, _823, _861);
    float _875 = fma(_867, _781, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _877 = fma(_863, _823, _869);
    float _879 = fma(_871, _811, _873);
    float _881 = fma(_875, _811, _877);
    float _883 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[146].x, _879);
    float _885 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[146].y, _881);
    bool _887 = !_747;
    float _903;
    if (!_887)
    {
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _891 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        float _907 = float(_83);
        float _909 = 1.0 / _907;
        float _911 = _117 * _909;
        _903 = _911;
    }
    _905 = false;
    float _913 = _903;
    float _915 = in.m_49.x;
    float _917 = in.m_49.y;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _921 = _913 + _919;
    bool _923 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _925 = isnan(_913);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _935;
    bool _939 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _941 = 1.0 / _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _943;
    float _947 = _885 * _917;
    float _949 = _921 * _941;
    bool _951 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _953 = isnan(_913);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_933;
    float _965 = _963 + 1.0;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _971;
    float _975 = fma(_945, _949, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _977 = _961 * _965;
    float _979 = fma(_969, _949, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _981 = fma(_973, _949, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _983 = -_961;
    float _985 = _983 + 1.0;
    float _987 = _979 * _977;
    float _989 = _981 * _977;
    float _991 = _975 * _977;
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].y, _987);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].x, _989);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].z, _991);
    float _999 = _883 * _915;
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].y, _993);
    float _1003 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].x, _995);
    float _1005 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].z, _997);
    bool _1007 = !_939;
    float _1023;
    if (!_1007)
    {
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1011 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _1015 = _1013 * _1009;
        float _1017 = floor(_1015);
        float _1019 = -_1017;
        float _1021 = _1015 + _1019;
        _1023 = _1021;
        _1025 = true;
    }
    else
    {
        float _1027 = float(_83);
        float _1029 = 1.0 / _1027;
        float _1031 = _117 * _1029;
        _1023 = _1031;
    }
    _1025 = false;
    float _1033 = _1023;
    bool _1035 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1037 = isnan(_1033);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1051 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1053 = isnan(_1033);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1069 = _1033 + _1067;
    float _1071 = -_1045;
    float _1073 = _1071 + 1.0;
    bool _1075 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1077 = 1.0 / _1049;
    float _1079 = _1061 * _1073;
    float _1081 = -_1061;
    float _1083 = _1081 + 1.0;
    float _1085 = _1065 * _1077;
    float _1087 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1089 = fma(_1085, _1069, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1091 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1093 = _1089 * _1079;
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1097 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1093);
    float _1099 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1097);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1101;
    out.m_53.y = _1103;
    out.m_53.z = _1105;
    out.m_53.w = _1107;
    bool _1109 = !_1075;
    float _1127;
    float _1129;
    if (!_1109)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1113 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1115 = float(_83);
        float _1117 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1119 = _1117 * _1111;
        float _1121 = floor(_1119);
        float _1123 = -_1121;
        float _1125 = _1119 + _1123;
        _1127 = _1115;
        _1129 = _1125;
        _1131 = true;
    }
    else
    {
        float _1133 = float(_83);
        float _1135 = 1.0 / _1133;
        float _1137 = _117 * _1135;
        _1127 = _1133;
        _1129 = _1137;
    }
    _1131 = false;
    float _1139 = _1127;
    float _1141 = _1129;
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1145 = int(_1143);
    float _1147 = _685 * _999;
    float _1149 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1151 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1149);
    float _1153 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1155 = int(_1153);
    float _1157 = float(_1145);
    float _1159 = 1.0 / _1157;
    float _1161 = float(uint(_1155));
    int _1163 = ~_1155;
    int _1165 = _1163 + 1;
    float _1167 = 1.0 / _1161;
    int _1169 = ~_1155;
    int _1171 = _1169 + 1;
    float _1173 = _117 * _1159;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1177 = _1175 != 0;
    float _1179 = trunc(_1173);
    int _1181 = int(_1179);
    int _1183 = as_type<int>(_1167) + (-2);
    float _1185 = float(uint(_1181));
    float _1187 = as_type<float>(_1183) * _1185;
    float _1189 = trunc(_1187);
    float _1191 = precise::max(_1189, 0.0);
    uint _1194 = uint(_1191);
    float _1196 = float(_1155);
    int _1198 = _1165 * int(_1194);
    int _1200 = _1198 + _1181;
    float _1202 = float(_1181);
    float _1204 = float(uint(_1200));
    bool _1206 = _1202 >= _1196;
    bool _1208 = isnan(_1202);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(_1196);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = as_type<float>(_1183) * _1204;
    float _1220 = trunc(_1216);
    int _1222 = int(_1220);
    bool _1224 = !_1177;
    float _1226 = _1224 ? 7.345489978790283203125 : 1.0;
    float _1228 = _1226 * _597;
    float _1230 = trunc(_1218);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    float _1236 = floor(_1228);
    int _1238 = int(_1194) + int(_1234);
    float _1240 = 1.0 / _1139;
    int _1242 = _1171 * _1238;
    int _1244 = _1242 + _1181;
    int _1246 = ~_1222;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = uint(_1244) >= uint(_1155);
    float _1254 = -_1236;
    float _1256 = _1228 + _1254;
    bool _1258 = !_1252;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = _1256 * _1196;
    float _1264 = _117 * _1196;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1276 = _1274 != 0;
    int _1278 = ~_1238;
    int _1280 = _1278 + _1260;
    int _1282 = _1280 + 1;
    float _1284 = _1264 * _1240;
    bool _1286 = _1155 == 0;
    float _1288 = trunc(_1262);
    int _1290 = int(_1288);
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1294 = _1292 != 0;
    int _1296 = _1155 * _1282;
    int _1298 = _1296 + _1181;
    int _1300 = _1155 + (-1);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1304 = _1302 != 0;
    bool _1306 = !_1286;
    int _1308 = _1306 ? _1298 : (-1);
    float _1310 = trunc(_1284);
    int _1312 = int(_1310);
    bool _1314 = !_1294;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1320 = !_1268;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1308 * _1250;
    bool _1326 = !_1272;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1318);
    int _1332 = abs(_1316);
    int _1334 = _1222 * _1300;
    int _1336 = _1334 + _1324;
    int _1338 = abs(_1328);
    bool _1340 = !_1276;
    int _1342 = _1340 ? 0 : 1;
    int _1344 = _1290 * _1332;
    int _1346 = _1344 + _1181;
    int _1348 = abs(_1322);
    bool _1350 = !_1304;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = abs(_1342);
    int _1356 = _1336 * _1338;
    int _1358 = abs(_1352);
    int _1360 = _1312 * _1348;
    int _1362 = _1360 + _1356;
    float _1364 = as_type<float>(int(gl_VertexIndex));
    int _1366 = ~_1155;
    int _1368 = _1366 + 1;
    int _1370 = _1346 * _1354;
    int _1372 = _1370 + _1362;
    int _1374 = ~_1155;
    int _1376 = _1374 + 1;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1380 = _1378 != 0;
    int _1382 = _1290 * _1358;
    int _1384 = _1382 + _1372;
    int _1386 = ~_1155;
    int _1388 = _1386 + 1;
    float _1390 = float(uint(_1346));
    float _1392 = float(uint(_1384));
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1396 = _1394 != 0;
    float _1398 = as_type<float>(_1183) * _1390;
    float _1400 = as_type<float>(_1183) * _1392;
    float _1402 = trunc(_1398);
    float _1404 = precise::max(_1402, 0.0);
    uint _1406 = uint(_1404);
    float _1408 = trunc(_1400);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    int _1414 = _1376 * int(_1406);
    int _1416 = _1414 + _1346;
    int _1418 = _1388 * int(_1412);
    int _1420 = _1418 + _1384;
    float _1422 = float(uint(_1420));
    float _1424 = as_type<float>(_1183) * _1422;
    float _1426 = trunc(_1424);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = float(uint(_1416));
    float _1434 = _685 * _947;
    int _1436 = ~_1155;
    int _1438 = _1436 + 1;
    float _1440 = as_type<float>(_1183) * _1432;
    int _1442 = int(_1412) + int(_1430);
    float _1444 = trunc(_1440);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    int _1450 = _1368 * _1442;
    int _1452 = _1450 + _1384;
    bool _1454 = uint(_1452) >= uint(_1155);
    float _1456 = in.m_51.y;
    bool _1458 = !_1454;
    int _1460 = _1458 ? 0 : (-1);
    int _1462 = ~_1442;
    int _1464 = _1462 + _1460;
    int _1466 = _1464 + 1;
    int _1468 = int(_1406) + int(_1448);
    float _1470 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1472 = _1155 * _1466;
    int _1474 = _1472 + _1384;
    float _1476 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1470);
    float _1478 = _597 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1480 = _1438 * _1468;
    int _1482 = _1480 + _1346;
    bool _1484 = !_1286;
    int _1486 = _1484 ? _1474 : (-1);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1490 = _1486 >> 31;
    float _1492 = -_1488;
    float _1494 = fma(_1478, 2.0, _1492);
    int _1496 = _1486 & 3;
    bool _1498 = _1496 != 0;
    float _1500 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1502 = _1490 & 3;
    float _1504 = -_117;
    float _1506 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1494);
    bool _1508 = uint(_1496) > 1u;
    int _1510 = _1486 + _1502;
    int _1512 = _1486 & 3;
    bool _1514 = _1512 != 0;
    int _1516 = _1510 >> 2;
    int _1518 = _1514 ? 0 : 1;
    int _1520 = _1516 << 4;
    int _1522 = _1520 + 368;
    int _1524 = ~_1518;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1532 = _1530 != 0;
    int _1534 = _1528;
    if (!_1508)
    {
        int _1536 = ~_1518;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    uint _1542 = uint(int(uint(_1522) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    bool _1558 = !_1380;
    int _1560 = _1558 ? 0 : 1;
    bool _1562 = uint(_1496) >= 2u;
    bool _1564 = _1496 != 3;
    bool _1566 = !_1498;
    int _1568 = _1566 ? 0 : 1;
    int _1570 = _1562 ? 0 : 1;
    int _1572 = as_type<int>(_1364) & 1;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>(_1364) & 2;
    bool _1578 = _1576 != 0;
    bool _1580 = !_1564;
    int _1582 = _1580 ? 0 : (-1);
    bool _1584 = _1496 != 3;
    int _1586 = _1522 + 8;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    int _1604 = ~_1570;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = abs(_1568);
    bool _1612 = !_1574;
    float _1614 = _1612 ? (-0.5) : 0.5;
    bool _1616 = !_1578;
    float _1618 = _1616 ? (-0.5) : 0.5;
    int _1620 = abs(_1540);
    float _1622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1614);
    int _1624 = _1608;
    if (_1584)
    {
        int _1626 = ~_1570;
        int _1628 = _1626 + 1;
        _1624 = _1628;
    }
    int _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1634 = uint(_1482) >= uint(_1155);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1638 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1632);
    bool _1640 = !_1634;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = fma(_1500, -2.0, _1636);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1646;
    int _1650 = ~_1468;
    int _1652 = _1650 + _1642;
    int _1654 = _1652 + 1;
    bool _1656 = _597 > 0.5;
    int _1658 = ~_1620;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1155 * _1654;
    int _1666 = _1664 + _1346;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1670 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1672 = int(_1670);
    int _1674 = _1662 * as_type<int>(_1556);
    bool _1676 = !_1286;
    int _1678 = _1676 ? _1666 : (-1);
    float _1680 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1668);
    float _1682 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1151);
    bool _1684 = _1456 > 0.5;
    float _1686 = 1.0 / _1648;
    int _1688 = abs(_1630);
    float _1690 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1330);
    int _1692 = ~_1610;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    float _1698 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    int _1700 = abs(_1582);
    float _1702 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1704 = _1696 * as_type<int>(_1548);
    int _1706 = _1704 + _1674;
    float _1708 = _591 * _591;
    int _1710 = ~_1688;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1718 = _1141 + _1716;
    int _1720 = ~_1700;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    float _1726 = fma(_593, _593, _1708);
    float _1728 = float(uint(_1672));
    int _1730 = _1714 * as_type<int>(_1594);
    int _1732 = _1730 + _1706;
    float _1734 = _1718 * _1686;
    float _1736 = fma(_595, _595, _1726);
    int _1738 = abs(_1672);
    int _1740 = _1724 * as_type<int>(_1602);
    int _1742 = _1740 + _1732;
    int _1744 = abs(_1560);
    float _1746 = 1.0 / _1728;
    float _1748 = float(uint(_1738));
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1750;
    int _1754 = ~_1744;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    float _1760 = _1698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1762 = fma(_1752, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1764 = rsqrt(_1736);
    int _1766 = _1742 * _1758;
    float _1768 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1774;
    int _1778 = _1678 * _1744;
    int _1780 = _1778 + _1766;
    int _1782 = ~_1672;
    int _1784 = _1782 + 1;
    float _1786 = fma(_1772, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1788 = 1.0 / _1748;
    int _1790 = as_type<int>(_1746) + (-2);
    float _1792 = fma(_1776, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1794 = abs(_1780);
    float _1796 = _1768 * _1622;
    float _1798 = float(uint(_1780));
    float _1800 = _1682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1802 = ~_1738;
    int _1804 = _1802 + 1;
    float _1806 = _1764 * _595;
    float _1808 = _1764 * _593;
    float _1810 = _1764 * _591;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1814 = _1806 * _1812;
    float _1816 = as_type<float>(_1790) * _1798;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1820 = _1810 * _1818;
    float _1822 = float(uint(_1794));
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1826 = -_1814;
    float _1828 = fma(_1808, _1824, _1826);
    int _1830 = as_type<int>(_1788) + (-2);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1834 = _1808 * _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1838 = -_1820;
    float _1840 = fma(_1806, _1836, _1838);
    float _1842 = trunc(_1816);
    float _1844 = precise::max(_1842, 0.0);
    uint _1846 = uint(_1844);
    float _1848 = _1828 * _1828;
    float _1850 = as_type<float>(_1830) * _1822;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1854 = -_1834;
    float _1856 = fma(_1810, _1852, _1854);
    bool _1858 = _1141 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1860 = isnan(_1141);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = fma(_1840, _1840, _1848);
    bool _1872 = _1141 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1874 = isnan(_1141);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1880 = _1876 || _1878;
    float _1882 = float(_1880);
    float _1884 = _1690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1886 = trunc(_1850);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = fma(_1856, _1856, _1870);
    float _1894 = -_1614;
    int _1896 = _1656 ? as_type<int>(_1894) : as_type<int>(_1614);
    float _1898 = -_1882;
    float _1900 = _1898 + 1.0;
    float _1902 = -_1618;
    int _1904 = _1684 ? as_type<int>(_1902) : as_type<int>(_1618);
    bool _1906 = !_1532;
    float _1908 = _1906 ? _1614 : as_type<float>(_1896);
    float _1910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1618);
    float _1912 = rsqrt(_1892);
    int _1914 = _1784 * int(_1846);
    int _1916 = _1914 + _1780;
    bool _1918 = !_1396;
    float _1920 = _1918 ? _1618 : as_type<float>(_1904);
    float _1922 = _1702 * _1910;
    float _1924 = _1868 * _1900;
    bool _1926 = _1672 == 0;
    float _1928 = float(uint(_1916));
    int _1930 = _1804 * int(_1890);
    int _1932 = _1930 + _1794;
    float _1934 = _1922 * _1806;
    float _1936 = as_type<float>(_1790) * _1928;
    float _1938 = float(uint(_1932));
    float _1940 = _1828 * _1912;
    float _1942 = _1856 * _1912;
    float _1944 = trunc(_1936);
    float _1946 = precise::max(_1944, 0.0);
    uint _1948 = uint(_1946);
    float _1950 = as_type<float>(_1830) * _1938;
    float _1952 = _1840 * _1912;
    float _1954 = _1786 * _1924;
    float _1956 = _1922 * _1808;
    float _1958 = _1808 * _1940;
    float _1960 = _1762 * _1924;
    float _1962 = _1810 * _1942;
    float _1964 = trunc(_1950);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    float _1970 = fma(_1796, _1952, _1956);
    float _1972 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1974 = fma(_1796, _1942, _1934);
    float _1976 = -_1958;
    float _1978 = fma(_1810, _1952, _1976);
    float _1980 = _1792 * _1924;
    float _1982 = -_1962;
    float _1984 = fma(_1806, _1940, _1982);
    float _1986 = _1922 * _1810;
    float _1988 = fma(_1972, _1978, _1974);
    int _1990 = int(_1846) + int(_1948);
    float _1992 = fma(_1972, _1984, _1970);
    int _1994 = ~_1672;
    int _1996 = _1994 + 1;
    float _1998 = _1760 + _1988;
    int _2000 = ~_1738;
    int _2002 = _2000 + 1;
    float _2004 = _1800 + _1992;
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2010 = _1998 + _2008;
    int _2012 = int(_1890) + int(_1968);
    float _2014 = -_1868;
    float _2016 = _2014 + 1.0;
    int _2018 = _1996 * _1990;
    int _2020 = _2018 + _1780;
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2024 = _2004 + _2022;
    float _2026 = _2010 * _2010;
    int _2028 = _2002 * _2012;
    int _2030 = _2028 + _1794;
    float _2032 = _1806 * _1952;
    bool _2034 = uint(_2020) >= uint(_1672);
    float _2036 = fma(_2024, _2024, _2026);
    float _2038 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1954);
    bool _2040 = uint(_2030) >= uint(_1738);
    float _2042 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1960);
    float _2044 = sqrt(_2036);
    bool _2046 = !_2034;
    int _2048 = _2046 ? 0 : (-1);
    float _2050 = fma(_1796, _1940, _1986);
    int _2052 = _1780 ^ _1672;
    float _2054 = -_2032;
    float _2056 = fma(_1808, _1942, _2054);
    int _2058 = ~_1990;
    int _2060 = _2058 + _2048;
    int _2062 = _2060 + 1;
    float _2064 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2066 = _1672 == 0;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2070 = !_2040;
    int _2072 = _2070 ? 0 : (-1);
    int _2074 = _1672 * _2062;
    int _2076 = _2074 + _1780;
    uint _2078 = uint(int(uint(_2052) >> uint(31)));
    float _2080 = fma(_1972, _2056, _2050);
    int _2082 = ~_2072;
    int _2084 = _2012 + _2082;
    int _2086 = _2084 + 1;
    float _2088 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1980);
    int _2090 = ~int(_2078);
    int _2092 = _2090 + 1;
    float _2094 = _1884 + _2080;
    bool _2096 = !_2066;
    int _2098 = _2096 ? _2076 : (-1);
    float _2100 = _1908 + 0.5;
    bool _2102 = _2044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2104 = _2086 ^ _2092;
    float _2106 = float(_2098);
    int _2108 = ~_2092;
    int _2110 = _2108 + _2104;
    int _2112 = _2110 + 1;
    float _2114 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1644);
    float _2116 = fma(_2064, _2106, _1506);
    bool _2118 = !_1926;
    int _2120 = _2118 ? _2112 : (-1);
    float _2122 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2124 = _2068;
    float _2126 = _1644;
    float _2128 = as_type<float>(_1780);
    float _2130 = _1736;
    if (!_2102)
    {
        _2124 = _2004;
    }
    float _2132 = _2124;
    float _2134 = _2132;
    if (!_2102)
    {
        _2126 = _1998;
    }
    float _2136 = _2126;
    float _2138 = float(_2120);
    float _2140 = _2136;
    if (!_2102)
    {
        _2128 = _2094;
    }
    float _2142 = _2128;
    bool _2144 = !_2102;
    float _2146 = _2142;
    if (!_2144)
    {
        float _2148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2152 = _2044 + _2150;
        float _2154 = rsqrt(_2036);
        float _2156 = _2152 * _2148;
        float _2158 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2160 = _2156 * 0.15915493667125701904296875;
        float _2162 = _2160 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = _2160 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        float _2170 = fma(_2164, _2158, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2172 = _2154 * _2170;
        float _2174 = _2168 + (-1.0);
        float _2176 = fma(_2024, _2172, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2178 = fma(_2010, _2172, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2180 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2182 = fma(_2094, _2168, _2180);
        _2146 = _2182;
        _2134 = _2176;
        _2140 = _2178;
    }
    float _2184 = _2146;
    float _2186 = _2134;
    float _2188 = _2140;
    float _2190 = fma(_2064, _2100, _2116);
    float _2192 = -_1884;
    float _2194 = _2192 + _2184;
    float _2196 = -_1800;
    float _2198 = _2196 + _2186;
    float _2200 = -_1760;
    float _2202 = _2200 + _2188;
    float _2204 = -_2114;
    float _2206 = fma(_2122, _2138, _2204);
    float _2208 = _2194 * _2194;
    float _2210 = _1920 + (-0.5);
    float _2212 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2038);
    float _2214 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1638);
    float _2216 = fma(_2198, _2198, _2208);
    float _2218 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2042);
    float _2220 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2088);
    float _2222 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1680);
    float _2224 = fma(_2202, _2202, _2216);
    float _2226 = -_2122;
    float _2228 = fma(_2226, _2210, _2206);
    float _2230 = -_2214;
    float _2232 = _2230 + 1.0;
    float _2234 = sqrt(_2224);
    float _2236 = _2212 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2238 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2240 = _2220 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2242 = -_2222;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2232;
    float _2248 = fma(_1908, _2246, _2190);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2252 = _2238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2254 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2256 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2258 = fma(_1920, _2244, _2228);
    out.m_58.x = _2252;
    out.m_58.y = _2254;
    out.m_58.z = _2256;
    out.m_58.w = _2250;
    bool _2260 = _2234 > 0.0;
    out.m_60.x = _2248;
    out.m_60.y = _2258;
    bool _2262 = !_2260;
    float _2264 = _2254;
    float _2266 = _2256;
    float _2268 = _2184;
    float _2270 = _2188;
    float _2272 = _2186;
    float _2274 = _2248;
    if (!_2262)
    {
        bool _2276 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2278 = _2252;
        if (_2276)
        {
            float _2280 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2278 = _2280;
        }
        float _2282 = _2278;
        float _2284 = _2282;
        if (_2276)
        {
            float _2286 = _2282 * _593;
            _2264 = _2286;
        }
        float _2288 = _2264;
        float _2290 = _2288;
        if (_2276)
        {
            float _2292 = _2282 * _591;
            _2266 = _2292;
        }
        float _2294 = _2266;
        float _2296 = _2294;
        if (_2276)
        {
            float _2298 = _2282 * _595;
            _2284 = _2298;
        }
        float _2300 = _2284;
        float _2302 = _2300;
        float _2304 = _2300;
        if (!_2276)
        {
            float _2306 = _117 + 1.0;
            float _2308 = _2306;
            if (!_157)
            {
                float _2310 = _2306 * _2306;
                float _2312 = _2310 * 0.5;
                _2302 = _2312;
            }
            float _2314 = _2302;
            float _2316 = _2314;
            if (!_157)
            {
                float _2318 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2316 = _2318;
            }
            float _2320 = _2316;
            bool _2322 = !_157;
            float _2324 = _2320;
            if (!_2322)
            {
                float _2326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2328 = log2(_2326);
                float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2332 = _2330 + 1.0;
                float _2334 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2336 = _2328 * _2306;
                float _2338 = 1.0 / _2332;
                float _2340 = _2334 * 0.693147182464599609375;
                float _2342 = exp2(_2336);
                float _2344 = 1.0 / _2340;
                float _2346 = _2342 + (-1.0);
                float _2348 = -_2346;
                float _2350 = fma(_2348, _2344, _2306);
                float _2352 = _2350 * _2338;
                float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2324 = _2354;
            }
            float _2356 = _2324;
            float _2358 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2360 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2362 = !_157;
            if (!_2362)
            {
                float _2364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2366 = log2(_2364);
                float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2370 = _2368 + 1.0;
                float _2372 = 1.0 / _2370;
                float _2374 = _2366 * _2306;
                float _2376 = exp2(_2374);
                float _2378 = -_2376;
                float _2380 = _2378 + 1.0;
                float _2382 = _2380 * _2372;
                _2308 = _2382;
            }
            float _2384 = _2308;
            float _2386 = fma(_2384, _143, _2360);
            float _2388 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2390 = fma(_2384, _141, _2358);
            float _2392 = -_339;
            float _2394 = _2392 + _2386;
            float _2396 = fma(_2384, _145, _2388);
            float _2398 = -_345;
            float _2400 = _2398 + _2390;
            float _2402 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2404 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2406 = -_351;
            float _2408 = _2406 + _2396;
            float _2410 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2402);
            float _2414 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2404);
            float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2410);
            float _2418 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2412);
            float _2420 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2414);
            float _2422 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2416);
            float _2424 = _2418 * _2418;
            float _2426 = fma(_2420, _2420, _2424);
            float _2428 = fma(_2422, _2422, _2426);
            _2130 = _2428;
            _689 = _2418;
            _691 = _2420;
            _693 = _2422;
            _2290 = _2420;
            _2296 = _2418;
            _2304 = _2422;
        }
        float _2430 = _2130;
        float _2432 = _689;
        float _2434 = _691;
        float _2436 = _693;
        float _2438 = _2290;
        float _2440 = _2296;
        float _2442 = _2304;
        float _2444 = sqrt(_2430);
        float _2446 = rsqrt(_2224);
        bool _2448 = _2444 > 0.0;
        float _2450 = _2198 * _2446;
        float _2452 = _2194 * _2446;
        float _2454 = _2202 * _2446;
        bool _2456 = !_2448;
        _695 = _2436;
        if (!_2456)
        {
            float _2458 = rsqrt(_2430);
            float _2460 = _2458 * _2432;
            float _2462 = _2458 * _2434;
            float _2464 = _2452 * _2460;
            float _2466 = _2458 * _2436;
            float _2468 = fma(_2450, _2462, _2464);
            float _2470 = fma(_2454, _2466, _2468);
            float _2472 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2474 = fma(_2438, _2472, _2186);
            float _2476 = fma(_2440, _2472, _2184);
            float _2478 = fma(_2442, _2472, _2188);
            _2268 = _2476;
            _2270 = _2478;
            _2272 = _2474;
        }
    }
    float _2480 = _2268;
    float _2482 = _2270;
    float _2484 = _2272;
    float _2486 = _695;
    float _2488 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2490 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2492 = isnan(0.5);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2498 = _2494 || _2496;
    float _2500 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2488);
    float _2502 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2506 = isnan(0.5);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2512 = _2508 || _2510;
    float _2514 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2500);
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2518 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2502);
    float _2520 = 1.0 / _2516;
    float _2522 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2518);
    float _2524 = _2486;
    float _2526 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2498)
    {
        _2524 = _2480;
    }
    float _2528 = _2524;
    float _2530 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2532 = _2530 + _2516;
    float _2534 = _2532 * _2520;
    float _2536 = _2534 * 0.5;
    float _2538 = _2520;
    float _2540 = _2536;
    float _2542 = _2528;
    if (_2498)
    {
        _2538 = _2482;
    }
    float _2544 = _2538;
    float _2546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2548 = fma(_2536, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2546);
    float _2550 = _2548;
    float _2552 = _2544;
    if (_2498)
    {
        _2540 = _2484;
    }
    float _2554 = _2540;
    float _2556 = _2554;
    if (_2512)
    {
        _2526 = 1.0;
    }
    float _2558 = _2526;
    float _2560 = 1.0 / _2548;
    float _2562 = _2558;
    if (!_2498)
    {
        float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2566 = _1884 + _2564;
        float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2570 = _1800 + _2568;
        float _2572 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2574 = -_1800;
        float _2576 = _2574 + _2484;
        float _2578 = _2566 * _2566;
        float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2582 = _1760 + _2580;
        float _2584 = -_1760;
        float _2586 = _2584 + _2482;
        float _2588 = fma(_2570, _2570, _2578);
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2592 = fma(_2582, _2582, _2588);
        float _2594 = sqrt(_2592);
        float _2596 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2598 = precise::min(_2594, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2600 = _2598 * _2590;
        float _2602 = -_1884;
        float _2604 = _2602 + _2480;
        float _2606 = _2596 * _2600;
        float _2608 = fma(_2576, _2606, _1800);
        float _2610 = fma(_2604, _2606, _1884);
        float _2612 = fma(_2586, _2606, _1760);
        _2550 = _2572;
        _2542 = _2610;
        _2556 = _2608;
        _2552 = _2612;
    }
    float _2614 = _2550;
    float _2616 = _2542;
    float _2618 = _2556;
    float _2620 = _2552;
    float _2622 = _2614;
    if (_2512)
    {
        _2622 = 1.0;
    }
    float _2624 = _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2628 = _2560 * _2626;
    float _2630 = _2624;
    if (!_2512)
    {
        float _2632 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2634 = _2632 * 0.15915493667125701904296875;
        float _2636 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2638 = _2634 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2636 * 0.15915493667125701904296875;
        float _2644 = _2634 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2640;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2662 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2660;
        float _2664 = _2652 * _2654;
        float _2666 = 1.0 / _2662;
        float _2668 = 1.0 / _2664;
        float _2670 = _2658 * _2668;
        float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2674 = fma(_2628, _2670, _2672);
        float _2676 = _2674 * _2666;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _419 = _2634;
        _2562 = _2678;
    }
    float _2680 = _419;
    float _2682 = _2562;
    float _2684 = _2680;
    if (!_2512)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = _2688 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2690 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2694;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2628, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2684 = _2714;
        _2630 = _2736;
    }
    float _2738 = _2684;
    float _2740 = _2630;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2744 = _2616 + _2742;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2748 = _2618 + _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2752 = _2620 + _2750;
    float _2754 = _2744 * _2744;
    float _2756 = fma(_2748, _2748, _2754);
    float _2758 = fma(_2752, _2752, _2756);
    float _2760 = rsqrt(_2758);
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2764 = _2748 * _2762;
    float _2766 = _2752 * _2762;
    float _2768 = _2764 * _2764;
    float _2770 = _2766 * _2766;
    float _2772 = _2768 + _2770;
    float _2774 = sqrt(_2772);
    bool _2776 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2780 = _2774 + _2778;
    float _2782 = _2752;
    float _2784 = _2754;
    float _2786 = _2780;
    float _2788 = _2764;
    if (_2776)
    {
        float _2790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2790;
    }
    float _2792 = _2782;
    if (_2776)
    {
        float _2794 = rsqrt(_2772);
        _2784 = _2794;
    }
    float _2796 = _2784;
    float _2798 = _2796;
    if (_2776)
    {
        float _2800 = _2780 * _2792;
        _2786 = _2800;
    }
    float _2802 = _2786;
    if (_2776)
    {
        float _2804 = _2802 * 0.15915493667125701904296875;
        _421 = _2804;
    }
    float _2806 = _421;
    float _2808 = _2760;
    if (_2776)
    {
        float _2810 = _2806 * 6.283185482025146484375;
        float _2812 = sin(_2810);
        _2808 = _2812;
    }
    float _2814 = _2808;
    float _2816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2818 = precise::max(0.0, _2816);
    float _2820 = _2738;
    float _2822 = _2818;
    float _2824 = _2816;
    if (_2776)
    {
        float _2826 = _2806 * 6.283185482025146484375;
        float _2828 = cos(_2826);
        _2820 = _2828;
    }
    float _2830 = _2820;
    float _2832 = -_2762;
    float _2834 = -_2818;
    float _2836 = fma(_2744, _2832, _2834);
    float _2838 = _2836;
    if (_2776)
    {
        float _2840 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2822 = _2840;
    }
    float _2842 = _2822;
    float _2844 = sqrt(_2758);
    float _2846 = _2814;
    float _2848 = _2842;
    if (_2776)
    {
        float _2850 = fma(_2814, _2842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2846 = _2850;
    }
    float _2852 = _2846;
    float _2854 = _2852;
    if (_2776)
    {
        float _2856 = _2830 + (-1.0);
        _2824 = _2856;
    }
    float _2858 = _2824;
    float _2860 = _2858;
    if (_2776)
    {
        float _2862 = _2796 * _2852;
        _2274 = _2862;
    }
    float _2864 = _2274;
    if (!_2776)
    {
        _2798 = _2836;
    }
    float _2866 = _2798;
    float _2868 = _2866;
    if (_2776)
    {
        float _2870 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2848 = _2870;
    }
    float _2872 = _2848;
    if (_2776)
    {
        float _2874 = _2764 * _2864;
        _2788 = _2874;
    }
    float _2876 = _2788;
    if (!_2776)
    {
        _2854 = _2766;
    }
    float _2878 = _2854;
    float _2880 = _2878;
    if (_2776)
    {
        float _2882 = _2766 * _2864;
        _2880 = _2882;
    }
    float _2884 = _2880;
    if (!_2776)
    {
        _2860 = _2768;
    }
    float _2886 = _2860;
    float _2888 = _2886;
    if (_2776)
    {
        float _2890 = fma(_2836, _2830, _2872);
        _2868 = _2890;
    }
    float _2892 = _2868;
    if (_2776)
    {
        float _2894 = _2876 * _2876;
        _2888 = _2894;
    }
    float _2896 = _2888;
    if (!_2776)
    {
        _2838 = _2770;
    }
    float _2898 = _2838;
    float _2900 = _2898;
    if (_2776)
    {
        float _2902 = _2884 * _2884;
        _2900 = _2902;
    }
    float _2904 = _2900;
    float _2906 = fma(_2892, _2892, _2896);
    float _2908 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2910 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2912 = _2906 + _2904;
    float _2914 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2908);
    float _2916 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2920 = fma(_2844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2918);
    float _2922 = precise::clamp(_2920, 0.0, 1.0);
    float _2924 = rsqrt(_2912);
    float _2926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2928 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2914);
    float _2930 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2916);
    float _2932 = -_2922;
    float _2934 = _2932 + 1.0;
    float _2936 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2938 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2940 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2910);
    float _2942 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2930);
    float _2944 = abs(_2934);
    float _2946 = log2(_2944);
    float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2950 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2936);
    float _2952 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2940);
    float _2954 = _2942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2956 = -_2948;
    float _2958 = fma(_2956, _2926, 1.0);
    float _2960 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2950);
    float _2962 = _2924 * _2876;
    float _2964 = _2952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2966 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2968 = _2924 * _2892;
    float _2970 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2972 = _2924 * _2884;
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2966);
    float _2976 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2978 = -_2970;
    float _2980 = fma(_2968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2978);
    float _2982 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2984 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2974);
    float _2986 = log2(_2958);
    float _2988 = -_2972;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2980);
    float _2992 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2994 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2984);
    float _2996 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2998 = fma(_2990, -0.5, 0.5);
    float _3000 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2992);
    float _3002 = exp2(_2982);
    float _3004 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2996);
    float _3006 = fma(_2990, 0.5, 0.5);
    float _3008 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3000);
    float _3010 = _2968 + 1.0;
    float _3012 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = 1.0 / _2994;
    float _3016 = fma(_3006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3018 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3020 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3008);
    float _3022 = _2986 * 0.693147182464599609375;
    float _3024 = fma(_3006, _3016, -0.212114393711090087890625);
    float _3026 = sqrt(_2998);
    float _3028 = -_2968;
    float _3030 = fma(_3002, _3010, _3028);
    float _3032 = fma(_3006, _3024, 1.570728778839111328125);
    float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3036 = fma(_3030, 0.5, 0.5);
    float _3038 = _3018 * _3014;
    float _3040 = _3020 * _3014;
    float _3042 = fma(_3038, 0.5, 0.5);
    float _3044 = fma(_3040, -0.5, 0.5);
    float _3046 = _3026 * 0.636619746685028076171875;
    float3 _7712 = float3(_3042, _3044, _3034);
    float _3048 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7712, float3(0.0), isnan(_7712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7712, float3(0.0), isnan(_7712)), level(0.0)).x;
    float3 _7723 = float3(_3042, _3044, _3034);
    float4 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7723, float3(0.0), isnan(_7723)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7723, float3(0.0), isnan(_7723)), level(0.0)).xyzw;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = _3051.w;
    float _3061 = -_3032;
    float _3063 = fma(_3046, _3061, 1.0);
    float2 _7745 = float2(_3063, _3036);
    float3 _3067 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7745, float2(0.0), isnan(_7745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7745, float2(0.0), isnan(_7745)), level(0.0)).xyz;
    float _3069 = _3067.x;
    float _3071 = _3067.y;
    float _3073 = _3067.z;
    float _3075 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3077 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3079 = _2682 > 0.0;
    bool _3081 = isnan(_2682);
    bool _3083 = _3079 || _3081;
    bool _3085 = isnan(0.0);
    bool _3087 = _3083 || _3085;
    float _3089 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3077);
    float _3091 = exp2(_3075);
    bool _3093 = _2740 <= 0.0;
    bool _3095 = !_3087;
    bool _3097 = _3093 || _3095;
    float _3099 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3089);
    float _3101 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3099);
    float _3103 = _2682 * _2740;
    float _3105 = _3101 + _2994;
    float _3107 = _3103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3109 = _3105 * 0.5;
    float _3111 = -_3091;
    float _3113 = _3111 + 1.0;
    float _3115 = _3107 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _3018;
    out.gl_Position.y = _3020;
    out.gl_Position.z = _3101;
    out.gl_Position.w = _2994;
    float _3117 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _3109;
    out.m_62.w = _2994;
    out.m_45.x = _3115;
    float _3119 = _3117 * _3048;
    float _3121 = -_3117;
    float _3123 = _3121 + 1.0;
    float _3125 = _3059 * _3119;
    float _3127 = _3073 * _3119;
    float _3129 = fma(_3069, _3125, _3053);
    float _3131 = fma(_3071, _3125, _3055);
    float _3133 = _3059 * _3123;
    float _3135 = fma(_3059, _3127, _3057);
    out.m_64.x = _3129;
    out.m_64.y = _3131;
    out.m_64.z = _3135;
    out.m_64.w = _3133;
    if (!_3097)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3137;
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
    bool _1131 = false;
    bool _1025 = false;
    bool _905 = false;
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
        float _3194 = as_type<float>(_99);
        out.gl_Position.z = _3194;
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
        float _3264 = as_type<float>(_137);
        out.gl_Position.z = _3264;
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
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _729 = _721 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _733 = _721 + _731;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _743;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _749 = 1.0 / _737;
    float _751 = 1.0 / _745;
    bool _753 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_721);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _741;
    float _767 = _725 * _749;
    bool _769 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _771 = isnan(_721);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = _729 * _751;
    bool _783 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _785 = isnan(_721);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_779;
    float _797 = _795 + 1.0;
    bool _799 = _721 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _801 = isnan(_721);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = _763 * _797;
    float _813 = _733 * _765;
    float _815 = -_763;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _819;
    float _823 = _793 * _817;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _825;
    float _829 = -_793;
    float _831 = _829 + 1.0;
    float _833 = fma(_821, _767, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _839 = fma(_827, _767, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _841 = _809 * _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _847 = -_809;
    float _849 = _847 + 1.0;
    float _851 = _839 * _841;
    float _853 = _833 * _841;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _855;
    float _859 = fma(_837, _813, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _861 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[143].x, _851);
    float _863 = fma(_845, _813, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _865;
    float _869 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[143].y, _853);
    float _871 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _873 = fma(_859, _823, _861);
    float _875 = fma(_867, _781, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _877 = fma(_863, _823, _869);
    float _879 = fma(_871, _811, _873);
    float _881 = fma(_875, _811, _877);
    float _883 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[146].x, _879);
    float _885 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[146].y, _881);
    bool _887 = !_747;
    float _903;
    if (!_887)
    {
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _891 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        float _907 = float(_83);
        float _909 = 1.0 / _907;
        float _911 = _117 * _909;
        _903 = _911;
    }
    _905 = false;
    float _913 = _903;
    float _915 = in.m_49.x;
    float _917 = in.m_49.y;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _921 = _913 + _919;
    bool _923 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _925 = isnan(_913);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _935;
    bool _939 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _941 = 1.0 / _937;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _943;
    float _947 = _885 * _917;
    float _949 = _921 * _941;
    bool _951 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _953 = isnan(_913);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_933;
    float _965 = _963 + 1.0;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _971;
    float _975 = fma(_945, _949, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _977 = _961 * _965;
    float _979 = fma(_969, _949, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _981 = fma(_973, _949, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _983 = -_961;
    float _985 = _983 + 1.0;
    float _987 = _979 * _977;
    float _989 = _981 * _977;
    float _991 = _975 * _977;
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].y, _987);
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].x, _989);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[107].z, _991);
    float _999 = _883 * _915;
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].y, _993);
    float _1003 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].x, _995);
    float _1005 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[108].z, _997);
    bool _1007 = !_939;
    float _1023;
    if (!_1007)
    {
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1011 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _1015 = _1013 * _1009;
        float _1017 = floor(_1015);
        float _1019 = -_1017;
        float _1021 = _1015 + _1019;
        _1023 = _1021;
        _1025 = true;
    }
    else
    {
        float _1027 = float(_83);
        float _1029 = 1.0 / _1027;
        float _1031 = _117 * _1029;
        _1023 = _1031;
    }
    _1025 = false;
    float _1033 = _1023;
    bool _1035 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1037 = isnan(_1033);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1051 = _1033 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1053 = isnan(_1033);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1059 = _1055 || _1057;
    float _1061 = float(_1059);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1069 = _1033 + _1067;
    float _1071 = -_1045;
    float _1073 = _1071 + 1.0;
    bool _1075 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1077 = 1.0 / _1049;
    float _1079 = _1061 * _1073;
    float _1081 = -_1061;
    float _1083 = _1081 + 1.0;
    float _1085 = _1065 * _1077;
    float _1087 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1089 = fma(_1085, _1069, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1091 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1093 = _1089 * _1079;
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1097 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1093);
    float _1099 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1097);
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1103 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _1101;
    out.m_53.y = _1103;
    out.m_53.z = _1105;
    out.m_53.w = _1107;
    bool _1109 = !_1075;
    float _1127;
    float _1129;
    if (!_1109)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1113 = _597 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1115 = float(_83);
        float _1117 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1119 = _1117 * _1111;
        float _1121 = floor(_1119);
        float _1123 = -_1121;
        float _1125 = _1119 + _1123;
        _1127 = _1115;
        _1129 = _1125;
        _1131 = true;
    }
    else
    {
        float _1133 = float(_83);
        float _1135 = 1.0 / _1133;
        float _1137 = _117 * _1135;
        _1127 = _1133;
        _1129 = _1137;
    }
    _1131 = false;
    float _1139 = _1127;
    float _1141 = _1129;
    float _1143 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1145 = int(_1143);
    float _1147 = _685 * _999;
    float _1149 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1151 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1149);
    float _1153 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1155 = int(_1153);
    float _1157 = float(_1145);
    float _1159 = 1.0 / _1157;
    float _1161 = float(uint(_1155));
    int _1163 = ~_1155;
    int _1165 = _1163 + 1;
    float _1167 = 1.0 / _1161;
    int _1169 = ~_1155;
    int _1171 = _1169 + 1;
    float _1173 = _117 * _1159;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1177 = _1175 != 0;
    float _1179 = trunc(_1173);
    int _1181 = int(_1179);
    int _1183 = as_type<int>(_1167) + (-2);
    float _1185 = float(uint(_1181));
    float _1187 = as_type<float>(_1183) * _1185;
    float _1189 = trunc(_1187);
    float _1191 = precise::max(_1189, 0.0);
    uint _1194 = uint(_1191);
    float _1196 = float(_1155);
    int _1198 = _1165 * int(_1194);
    int _1200 = _1198 + _1181;
    float _1202 = float(_1181);
    float _1204 = float(uint(_1200));
    bool _1206 = _1202 >= _1196;
    bool _1208 = isnan(_1202);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(_1196);
    bool _1214 = _1210 || _1212;
    float _1216 = float(_1214);
    float _1218 = as_type<float>(_1183) * _1204;
    float _1220 = trunc(_1216);
    int _1222 = int(_1220);
    bool _1224 = !_1177;
    float _1226 = _1224 ? 7.345489978790283203125 : 1.0;
    float _1228 = _1226 * _597;
    float _1230 = trunc(_1218);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    float _1236 = floor(_1228);
    int _1238 = int(_1194) + int(_1234);
    float _1240 = 1.0 / _1139;
    int _1242 = _1171 * _1238;
    int _1244 = _1242 + _1181;
    int _1246 = ~_1222;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = uint(_1244) >= uint(_1155);
    float _1254 = -_1236;
    float _1256 = _1228 + _1254;
    bool _1258 = !_1252;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = _1256 * _1196;
    float _1264 = _117 * _1196;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1276 = _1274 != 0;
    int _1278 = ~_1238;
    int _1280 = _1278 + _1260;
    int _1282 = _1280 + 1;
    float _1284 = _1264 * _1240;
    bool _1286 = _1155 == 0;
    float _1288 = trunc(_1262);
    int _1290 = int(_1288);
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1294 = _1292 != 0;
    int _1296 = _1155 * _1282;
    int _1298 = _1296 + _1181;
    int _1300 = _1155 + (-1);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1304 = _1302 != 0;
    bool _1306 = !_1286;
    int _1308 = _1306 ? _1298 : (-1);
    float _1310 = trunc(_1284);
    int _1312 = int(_1310);
    bool _1314 = !_1294;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1320 = !_1268;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1308 * _1250;
    bool _1326 = !_1272;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1318);
    int _1332 = abs(_1316);
    int _1334 = _1222 * _1300;
    int _1336 = _1334 + _1324;
    int _1338 = abs(_1328);
    bool _1340 = !_1276;
    int _1342 = _1340 ? 0 : 1;
    int _1344 = _1290 * _1332;
    int _1346 = _1344 + _1181;
    int _1348 = abs(_1322);
    bool _1350 = !_1304;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = abs(_1342);
    int _1356 = _1336 * _1338;
    int _1358 = abs(_1352);
    int _1360 = _1312 * _1348;
    int _1362 = _1360 + _1356;
    float _1364 = as_type<float>(int(gl_VertexIndex));
    int _1366 = ~_1155;
    int _1368 = _1366 + 1;
    int _1370 = _1346 * _1354;
    int _1372 = _1370 + _1362;
    int _1374 = ~_1155;
    int _1376 = _1374 + 1;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1380 = _1378 != 0;
    int _1382 = _1290 * _1358;
    int _1384 = _1382 + _1372;
    int _1386 = ~_1155;
    int _1388 = _1386 + 1;
    float _1390 = float(uint(_1346));
    float _1392 = float(uint(_1384));
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1396 = _1394 != 0;
    float _1398 = as_type<float>(_1183) * _1390;
    float _1400 = as_type<float>(_1183) * _1392;
    float _1402 = trunc(_1398);
    float _1404 = precise::max(_1402, 0.0);
    uint _1406 = uint(_1404);
    float _1408 = trunc(_1400);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    int _1414 = _1376 * int(_1406);
    int _1416 = _1414 + _1346;
    int _1418 = _1388 * int(_1412);
    int _1420 = _1418 + _1384;
    float _1422 = float(uint(_1420));
    float _1424 = as_type<float>(_1183) * _1422;
    float _1426 = trunc(_1424);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = float(uint(_1416));
    float _1434 = _685 * _947;
    int _1436 = ~_1155;
    int _1438 = _1436 + 1;
    float _1440 = as_type<float>(_1183) * _1432;
    int _1442 = int(_1412) + int(_1430);
    float _1444 = trunc(_1440);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    int _1450 = _1368 * _1442;
    int _1452 = _1450 + _1384;
    bool _1454 = uint(_1452) >= uint(_1155);
    float _1456 = in.m_51.y;
    bool _1458 = !_1454;
    int _1460 = _1458 ? 0 : (-1);
    int _1462 = ~_1442;
    int _1464 = _1462 + _1460;
    int _1466 = _1464 + 1;
    int _1468 = int(_1406) + int(_1448);
    float _1470 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1472 = _1155 * _1466;
    int _1474 = _1472 + _1384;
    float _1476 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1470);
    float _1478 = _597 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1480 = _1438 * _1468;
    int _1482 = _1480 + _1346;
    bool _1484 = !_1286;
    int _1486 = _1484 ? _1474 : (-1);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1490 = _1486 >> 31;
    float _1492 = -_1488;
    float _1494 = fma(_1478, 2.0, _1492);
    int _1496 = _1486 & 3;
    bool _1498 = _1496 != 0;
    float _1500 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1502 = _1490 & 3;
    float _1504 = -_117;
    float _1506 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1494);
    bool _1508 = uint(_1496) > 1u;
    int _1510 = _1486 + _1502;
    int _1512 = _1486 & 3;
    bool _1514 = _1512 != 0;
    int _1516 = _1510 >> 2;
    int _1518 = _1514 ? 0 : 1;
    int _1520 = _1516 << 4;
    int _1522 = _1520 + 368;
    int _1524 = ~_1518;
    int _1526 = _1524 + 1;
    int _1528 = _1526 + 1;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1532 = _1530 != 0;
    int _1534 = _1528;
    if (!_1508)
    {
        int _1536 = ~_1518;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    uint _1542 = uint(int(uint(_1522) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    bool _1558 = !_1380;
    int _1560 = _1558 ? 0 : 1;
    bool _1562 = uint(_1496) >= 2u;
    bool _1564 = _1496 != 3;
    bool _1566 = !_1498;
    int _1568 = _1566 ? 0 : 1;
    int _1570 = _1562 ? 0 : 1;
    int _1572 = as_type<int>(_1364) & 1;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>(_1364) & 2;
    bool _1578 = _1576 != 0;
    bool _1580 = !_1564;
    int _1582 = _1580 ? 0 : (-1);
    bool _1584 = _1496 != 3;
    int _1586 = _1522 + 8;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    int _1604 = ~_1570;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    int _1610 = abs(_1568);
    bool _1612 = !_1574;
    float _1614 = _1612 ? (-0.5) : 0.5;
    bool _1616 = !_1578;
    float _1618 = _1616 ? (-0.5) : 0.5;
    int _1620 = abs(_1540);
    float _1622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1614);
    int _1624 = _1608;
    if (_1584)
    {
        int _1626 = ~_1570;
        int _1628 = _1626 + 1;
        _1624 = _1628;
    }
    int _1630 = _1624;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1634 = uint(_1482) >= uint(_1155);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1638 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1632);
    bool _1640 = !_1634;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = fma(_1500, -2.0, _1636);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1646;
    int _1650 = ~_1468;
    int _1652 = _1650 + _1642;
    int _1654 = _1652 + 1;
    bool _1656 = _597 > 0.5;
    int _1658 = ~_1620;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1155 * _1654;
    int _1666 = _1664 + _1346;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1670 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1672 = int(_1670);
    int _1674 = _1662 * as_type<int>(_1556);
    bool _1676 = !_1286;
    int _1678 = _1676 ? _1666 : (-1);
    float _1680 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1668);
    float _1682 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1151);
    bool _1684 = _1456 > 0.5;
    float _1686 = 1.0 / _1648;
    int _1688 = abs(_1630);
    float _1690 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1330);
    int _1692 = ~_1610;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    float _1698 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    int _1700 = abs(_1582);
    float _1702 = _1434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1704 = _1696 * as_type<int>(_1548);
    int _1706 = _1704 + _1674;
    float _1708 = _591 * _591;
    int _1710 = ~_1688;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1718 = _1141 + _1716;
    int _1720 = ~_1700;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    float _1726 = fma(_593, _593, _1708);
    float _1728 = float(uint(_1672));
    int _1730 = _1714 * as_type<int>(_1594);
    int _1732 = _1730 + _1706;
    float _1734 = _1718 * _1686;
    float _1736 = fma(_595, _595, _1726);
    int _1738 = abs(_1672);
    int _1740 = _1724 * as_type<int>(_1602);
    int _1742 = _1740 + _1732;
    int _1744 = abs(_1560);
    float _1746 = 1.0 / _1728;
    float _1748 = float(uint(_1738));
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1750;
    int _1754 = ~_1744;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    float _1760 = _1698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1762 = fma(_1752, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1764 = rsqrt(_1736);
    int _1766 = _1742 * _1758;
    float _1768 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1774;
    int _1778 = _1678 * _1744;
    int _1780 = _1778 + _1766;
    int _1782 = ~_1672;
    int _1784 = _1782 + 1;
    float _1786 = fma(_1772, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1788 = 1.0 / _1748;
    int _1790 = as_type<int>(_1746) + (-2);
    float _1792 = fma(_1776, _1734, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1794 = abs(_1780);
    float _1796 = _1768 * _1622;
    float _1798 = float(uint(_1780));
    float _1800 = _1682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1802 = ~_1738;
    int _1804 = _1802 + 1;
    float _1806 = _1764 * _595;
    float _1808 = _1764 * _593;
    float _1810 = _1764 * _591;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1814 = _1806 * _1812;
    float _1816 = as_type<float>(_1790) * _1798;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1820 = _1810 * _1818;
    float _1822 = float(uint(_1794));
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1826 = -_1814;
    float _1828 = fma(_1808, _1824, _1826);
    int _1830 = as_type<int>(_1788) + (-2);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1834 = _1808 * _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1838 = -_1820;
    float _1840 = fma(_1806, _1836, _1838);
    float _1842 = trunc(_1816);
    float _1844 = precise::max(_1842, 0.0);
    uint _1846 = uint(_1844);
    float _1848 = _1828 * _1828;
    float _1850 = as_type<float>(_1830) * _1822;
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1854 = -_1834;
    float _1856 = fma(_1810, _1852, _1854);
    bool _1858 = _1141 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1860 = isnan(_1141);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = fma(_1840, _1840, _1848);
    bool _1872 = _1141 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1874 = isnan(_1141);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1880 = _1876 || _1878;
    float _1882 = float(_1880);
    float _1884 = _1690 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1886 = trunc(_1850);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = fma(_1856, _1856, _1870);
    float _1894 = -_1614;
    int _1896 = _1656 ? as_type<int>(_1894) : as_type<int>(_1614);
    float _1898 = -_1882;
    float _1900 = _1898 + 1.0;
    float _1902 = -_1618;
    int _1904 = _1684 ? as_type<int>(_1902) : as_type<int>(_1618);
    bool _1906 = !_1532;
    float _1908 = _1906 ? _1614 : as_type<float>(_1896);
    float _1910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1618);
    float _1912 = rsqrt(_1892);
    int _1914 = _1784 * int(_1846);
    int _1916 = _1914 + _1780;
    bool _1918 = !_1396;
    float _1920 = _1918 ? _1618 : as_type<float>(_1904);
    float _1922 = _1702 * _1910;
    float _1924 = _1868 * _1900;
    bool _1926 = _1672 == 0;
    float _1928 = float(uint(_1916));
    int _1930 = _1804 * int(_1890);
    int _1932 = _1930 + _1794;
    float _1934 = _1922 * _1806;
    float _1936 = as_type<float>(_1790) * _1928;
    float _1938 = float(uint(_1932));
    float _1940 = _1828 * _1912;
    float _1942 = _1856 * _1912;
    float _1944 = trunc(_1936);
    float _1946 = precise::max(_1944, 0.0);
    uint _1948 = uint(_1946);
    float _1950 = as_type<float>(_1830) * _1938;
    float _1952 = _1840 * _1912;
    float _1954 = _1786 * _1924;
    float _1956 = _1922 * _1808;
    float _1958 = _1808 * _1940;
    float _1960 = _1762 * _1924;
    float _1962 = _1810 * _1942;
    float _1964 = trunc(_1950);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    float _1970 = fma(_1796, _1952, _1956);
    float _1972 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1974 = fma(_1796, _1942, _1934);
    float _1976 = -_1958;
    float _1978 = fma(_1810, _1952, _1976);
    float _1980 = _1792 * _1924;
    float _1982 = -_1962;
    float _1984 = fma(_1806, _1940, _1982);
    float _1986 = _1922 * _1810;
    float _1988 = fma(_1972, _1978, _1974);
    int _1990 = int(_1846) + int(_1948);
    float _1992 = fma(_1972, _1984, _1970);
    int _1994 = ~_1672;
    int _1996 = _1994 + 1;
    float _1998 = _1760 + _1988;
    int _2000 = ~_1738;
    int _2002 = _2000 + 1;
    float _2004 = _1800 + _1992;
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2010 = _1998 + _2008;
    int _2012 = int(_1890) + int(_1968);
    float _2014 = -_1868;
    float _2016 = _2014 + 1.0;
    int _2018 = _1996 * _1990;
    int _2020 = _2018 + _1780;
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2024 = _2004 + _2022;
    float _2026 = _2010 * _2010;
    int _2028 = _2002 * _2012;
    int _2030 = _2028 + _1794;
    float _2032 = _1806 * _1952;
    bool _2034 = uint(_2020) >= uint(_1672);
    float _2036 = fma(_2024, _2024, _2026);
    float _2038 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1954);
    bool _2040 = uint(_2030) >= uint(_1738);
    float _2042 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1960);
    float _2044 = sqrt(_2036);
    bool _2046 = !_2034;
    int _2048 = _2046 ? 0 : (-1);
    float _2050 = fma(_1796, _1940, _1986);
    int _2052 = _1780 ^ _1672;
    float _2054 = -_2032;
    float _2056 = fma(_1808, _1942, _2054);
    int _2058 = ~_1990;
    int _2060 = _2058 + _2048;
    int _2062 = _2060 + 1;
    float _2064 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2066 = _1672 == 0;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2070 = !_2040;
    int _2072 = _2070 ? 0 : (-1);
    int _2074 = _1672 * _2062;
    int _2076 = _2074 + _1780;
    uint _2078 = uint(int(uint(_2052) >> uint(31)));
    float _2080 = fma(_1972, _2056, _2050);
    int _2082 = ~_2072;
    int _2084 = _2012 + _2082;
    int _2086 = _2084 + 1;
    float _2088 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1980);
    int _2090 = ~int(_2078);
    int _2092 = _2090 + 1;
    float _2094 = _1884 + _2080;
    bool _2096 = !_2066;
    int _2098 = _2096 ? _2076 : (-1);
    float _2100 = _1908 + 0.5;
    bool _2102 = _2044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2104 = _2086 ^ _2092;
    float _2106 = float(_2098);
    int _2108 = ~_2092;
    int _2110 = _2108 + _2104;
    int _2112 = _2110 + 1;
    float _2114 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1644);
    float _2116 = fma(_2064, _2106, _1506);
    bool _2118 = !_1926;
    int _2120 = _2118 ? _2112 : (-1);
    float _2122 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2124 = _2068;
    float _2126 = _1644;
    float _2128 = as_type<float>(_1780);
    float _2130 = _1736;
    if (!_2102)
    {
        _2124 = _2004;
    }
    float _2132 = _2124;
    float _2134 = _2132;
    if (!_2102)
    {
        _2126 = _1998;
    }
    float _2136 = _2126;
    float _2138 = float(_2120);
    float _2140 = _2136;
    if (!_2102)
    {
        _2128 = _2094;
    }
    float _2142 = _2128;
    bool _2144 = !_2102;
    float _2146 = _2142;
    if (!_2144)
    {
        float _2148 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2152 = _2044 + _2150;
        float _2154 = rsqrt(_2036);
        float _2156 = _2152 * _2148;
        float _2158 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2160 = _2156 * 0.15915493667125701904296875;
        float _2162 = _2160 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = _2160 * 6.283185482025146484375;
        float _2168 = cos(_2166);
        float _2170 = fma(_2164, _2158, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2172 = _2154 * _2170;
        float _2174 = _2168 + (-1.0);
        float _2176 = fma(_2024, _2172, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2178 = fma(_2010, _2172, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2180 = _2174 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2182 = fma(_2094, _2168, _2180);
        _2146 = _2182;
        _2134 = _2176;
        _2140 = _2178;
    }
    float _2184 = _2146;
    float _2186 = _2134;
    float _2188 = _2140;
    float _2190 = fma(_2064, _2100, _2116);
    float _2192 = -_1884;
    float _2194 = _2192 + _2184;
    float _2196 = -_1800;
    float _2198 = _2196 + _2186;
    float _2200 = -_1760;
    float _2202 = _2200 + _2188;
    float _2204 = -_2114;
    float _2206 = fma(_2122, _2138, _2204);
    float _2208 = _2194 * _2194;
    float _2210 = _1920 + (-0.5);
    float _2212 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2038);
    float _2214 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1638);
    float _2216 = fma(_2198, _2198, _2208);
    float _2218 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2042);
    float _2220 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2088);
    float _2222 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1680);
    float _2224 = fma(_2202, _2202, _2216);
    float _2226 = -_2122;
    float _2228 = fma(_2226, _2210, _2206);
    float _2230 = -_2214;
    float _2232 = _2230 + 1.0;
    float _2234 = sqrt(_2224);
    float _2236 = _2212 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2238 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2240 = _2220 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2242 = -_2222;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2232;
    float _2248 = fma(_1908, _2246, _2190);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2252 = _2238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2254 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2256 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2258 = fma(_1920, _2244, _2228);
    out.m_58.x = _2252;
    out.m_58.y = _2254;
    out.m_58.z = _2256;
    out.m_58.w = _2250;
    bool _2260 = _2234 > 0.0;
    out.m_60.x = _2248;
    out.m_60.y = _2258;
    bool _2262 = !_2260;
    float _2264 = _2254;
    float _2266 = _2256;
    float _2268 = _2184;
    float _2270 = _2188;
    float _2272 = _2186;
    float _2274 = _2248;
    if (!_2262)
    {
        bool _2276 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2278 = _2252;
        if (_2276)
        {
            float _2280 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2278 = _2280;
        }
        float _2282 = _2278;
        float _2284 = _2282;
        if (_2276)
        {
            float _2286 = _2282 * _593;
            _2264 = _2286;
        }
        float _2288 = _2264;
        float _2290 = _2288;
        if (_2276)
        {
            float _2292 = _2282 * _591;
            _2266 = _2292;
        }
        float _2294 = _2266;
        float _2296 = _2294;
        if (_2276)
        {
            float _2298 = _2282 * _595;
            _2284 = _2298;
        }
        float _2300 = _2284;
        float _2302 = _2300;
        float _2304 = _2300;
        if (!_2276)
        {
            float _2306 = _117 + 1.0;
            float _2308 = _2306;
            if (!_157)
            {
                float _2310 = _2306 * _2306;
                float _2312 = _2310 * 0.5;
                _2302 = _2312;
            }
            float _2314 = _2302;
            float _2316 = _2314;
            if (!_157)
            {
                float _2318 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2316 = _2318;
            }
            float _2320 = _2316;
            bool _2322 = !_157;
            float _2324 = _2320;
            if (!_2322)
            {
                float _2326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2328 = log2(_2326);
                float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2332 = _2330 + 1.0;
                float _2334 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2336 = _2328 * _2306;
                float _2338 = 1.0 / _2332;
                float _2340 = _2334 * 0.693147182464599609375;
                float _2342 = exp2(_2336);
                float _2344 = 1.0 / _2340;
                float _2346 = _2342 + (-1.0);
                float _2348 = -_2346;
                float _2350 = fma(_2348, _2344, _2306);
                float _2352 = _2350 * _2338;
                float _2354 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2324 = _2354;
            }
            float _2356 = _2324;
            float _2358 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2360 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2362 = !_157;
            if (!_2362)
            {
                float _2364 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2366 = log2(_2364);
                float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2370 = _2368 + 1.0;
                float _2372 = 1.0 / _2370;
                float _2374 = _2366 * _2306;
                float _2376 = exp2(_2374);
                float _2378 = -_2376;
                float _2380 = _2378 + 1.0;
                float _2382 = _2380 * _2372;
                _2308 = _2382;
            }
            float _2384 = _2308;
            float _2386 = fma(_2384, _143, _2360);
            float _2388 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2390 = fma(_2384, _141, _2358);
            float _2392 = -_339;
            float _2394 = _2392 + _2386;
            float _2396 = fma(_2384, _145, _2388);
            float _2398 = -_345;
            float _2400 = _2398 + _2390;
            float _2402 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2404 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2406 = -_351;
            float _2408 = _2406 + _2396;
            float _2410 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2402);
            float _2414 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2404);
            float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2410);
            float _2418 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2412);
            float _2420 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2414);
            float _2422 = fma(_2408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2416);
            float _2424 = _2418 * _2418;
            float _2426 = fma(_2420, _2420, _2424);
            float _2428 = fma(_2422, _2422, _2426);
            _2130 = _2428;
            _689 = _2418;
            _691 = _2420;
            _693 = _2422;
            _2290 = _2420;
            _2296 = _2418;
            _2304 = _2422;
        }
        float _2430 = _2130;
        float _2432 = _689;
        float _2434 = _691;
        float _2436 = _693;
        float _2438 = _2290;
        float _2440 = _2296;
        float _2442 = _2304;
        float _2444 = sqrt(_2430);
        float _2446 = rsqrt(_2224);
        bool _2448 = _2444 > 0.0;
        float _2450 = _2198 * _2446;
        float _2452 = _2194 * _2446;
        float _2454 = _2202 * _2446;
        bool _2456 = !_2448;
        _695 = _2436;
        if (!_2456)
        {
            float _2458 = rsqrt(_2430);
            float _2460 = _2458 * _2432;
            float _2462 = _2458 * _2434;
            float _2464 = _2452 * _2460;
            float _2466 = _2458 * _2436;
            float _2468 = fma(_2450, _2462, _2464);
            float _2470 = fma(_2454, _2466, _2468);
            float _2472 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2474 = fma(_2438, _2472, _2186);
            float _2476 = fma(_2440, _2472, _2184);
            float _2478 = fma(_2442, _2472, _2188);
            _2268 = _2476;
            _2270 = _2478;
            _2272 = _2474;
        }
    }
    float _2480 = _2268;
    float _2482 = _2270;
    float _2484 = _2272;
    float _2486 = _695;
    float _2488 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2490 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2492 = isnan(0.5);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2498 = _2494 || _2496;
    float _2500 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2488);
    float _2502 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2504 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2506 = isnan(0.5);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2512 = _2508 || _2510;
    float _2514 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2500);
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2518 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2502);
    float _2520 = 1.0 / _2516;
    float _2522 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2518);
    float _2524 = _2486;
    float _2526 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2498)
    {
        _2524 = _2480;
    }
    float _2528 = _2524;
    float _2530 = _2522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2532 = _2530 + _2516;
    float _2534 = _2532 * _2520;
    float _2536 = _2534 * 0.5;
    float _2538 = _2520;
    float _2540 = _2536;
    float _2542 = _2528;
    if (_2498)
    {
        _2538 = _2482;
    }
    float _2544 = _2538;
    float _2546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2548 = fma(_2536, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2546);
    float _2550 = _2548;
    float _2552 = _2544;
    if (_2498)
    {
        _2540 = _2484;
    }
    float _2554 = _2540;
    float _2556 = _2554;
    if (_2512)
    {
        _2526 = 1.0;
    }
    float _2558 = _2526;
    float _2560 = 1.0 / _2548;
    float _2562 = _2558;
    if (!_2498)
    {
        float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2566 = _1884 + _2564;
        float _2568 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2570 = _1800 + _2568;
        float _2572 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2574 = -_1800;
        float _2576 = _2574 + _2484;
        float _2578 = _2566 * _2566;
        float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2582 = _1760 + _2580;
        float _2584 = -_1760;
        float _2586 = _2584 + _2482;
        float _2588 = fma(_2570, _2570, _2578);
        float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2592 = fma(_2582, _2582, _2588);
        float _2594 = sqrt(_2592);
        float _2596 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2598 = precise::min(_2594, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2600 = _2598 * _2590;
        float _2602 = -_1884;
        float _2604 = _2602 + _2480;
        float _2606 = _2596 * _2600;
        float _2608 = fma(_2576, _2606, _1800);
        float _2610 = fma(_2604, _2606, _1884);
        float _2612 = fma(_2586, _2606, _1760);
        _2550 = _2572;
        _2542 = _2610;
        _2556 = _2608;
        _2552 = _2612;
    }
    float _2614 = _2550;
    float _2616 = _2542;
    float _2618 = _2556;
    float _2620 = _2552;
    float _2622 = _2614;
    if (_2512)
    {
        _2622 = 1.0;
    }
    float _2624 = _2622;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2628 = _2560 * _2626;
    float _2630 = _2624;
    if (!_2512)
    {
        float _2632 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2634 = _2632 * 0.15915493667125701904296875;
        float _2636 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2638 = _2634 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2636 * 0.15915493667125701904296875;
        float _2644 = _2634 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2640;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2662 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2660;
        float _2664 = _2652 * _2654;
        float _2666 = 1.0 / _2662;
        float _2668 = 1.0 / _2664;
        float _2670 = _2658 * _2668;
        float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2674 = fma(_2628, _2670, _2672);
        float _2676 = _2674 * _2666;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _419 = _2634;
        _2562 = _2678;
    }
    float _2680 = _419;
    float _2682 = _2562;
    float _2684 = _2680;
    if (!_2512)
    {
        float _2686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2692 = _2688 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2690 * 0.15915493667125701904296875;
        float _2698 = _2688 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = 1.0 / _2694;
        float _2704 = _2696 * 6.283185482025146484375;
        float _2706 = cos(_2704);
        float _2708 = _2700 * _2702;
        float _2710 = _2696 * 6.283185482025146484375;
        float _2712 = sin(_2710);
        float _2714 = _2706 * _2708;
        float _2716 = 1.0 / _2714;
        float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2720 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2718;
        float _2722 = 1.0 / _2720;
        float _2724 = _2712 * _2716;
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2728 = fma(_2628, _2724, _2726);
        float _2730 = _2728 * _2722;
        float _2732 = precise::clamp(_2730, 0.0, 1.0);
        float _2734 = -_2732;
        float _2736 = _2734 + 1.0;
        _2684 = _2714;
        _2630 = _2736;
    }
    float _2738 = _2684;
    float _2740 = _2630;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2744 = _2616 + _2742;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2748 = _2618 + _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2752 = _2620 + _2750;
    float _2754 = _2744 * _2744;
    float _2756 = fma(_2748, _2748, _2754);
    float _2758 = fma(_2752, _2752, _2756);
    float _2760 = rsqrt(_2758);
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2764 = _2748 * _2762;
    float _2766 = _2752 * _2762;
    float _2768 = _2764 * _2764;
    float _2770 = _2766 * _2766;
    float _2772 = _2768 + _2770;
    float _2774 = sqrt(_2772);
    bool _2776 = _2774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2780 = _2774 + _2778;
    float _2782 = _2752;
    float _2784 = _2754;
    float _2786 = _2780;
    float _2788 = _2764;
    if (_2776)
    {
        float _2790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2782 = _2790;
    }
    float _2792 = _2782;
    if (_2776)
    {
        float _2794 = rsqrt(_2772);
        _2784 = _2794;
    }
    float _2796 = _2784;
    float _2798 = _2796;
    if (_2776)
    {
        float _2800 = _2780 * _2792;
        _2786 = _2800;
    }
    float _2802 = _2786;
    if (_2776)
    {
        float _2804 = _2802 * 0.15915493667125701904296875;
        _421 = _2804;
    }
    float _2806 = _421;
    float _2808 = _2760;
    if (_2776)
    {
        float _2810 = _2806 * 6.283185482025146484375;
        float _2812 = sin(_2810);
        _2808 = _2812;
    }
    float _2814 = _2808;
    float _2816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2818 = precise::max(0.0, _2816);
    float _2820 = _2738;
    float _2822 = _2818;
    float _2824 = _2816;
    if (_2776)
    {
        float _2826 = _2806 * 6.283185482025146484375;
        float _2828 = cos(_2826);
        _2820 = _2828;
    }
    float _2830 = _2820;
    float _2832 = -_2762;
    float _2834 = -_2818;
    float _2836 = fma(_2744, _2832, _2834);
    float _2838 = _2836;
    if (_2776)
    {
        float _2840 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2822 = _2840;
    }
    float _2842 = _2822;
    float _2844 = sqrt(_2758);
    float _2846 = _2814;
    float _2848 = _2842;
    if (_2776)
    {
        float _2850 = fma(_2814, _2842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2846 = _2850;
    }
    float _2852 = _2846;
    float _2854 = _2852;
    if (_2776)
    {
        float _2856 = _2830 + (-1.0);
        _2824 = _2856;
    }
    float _2858 = _2824;
    float _2860 = _2858;
    if (_2776)
    {
        float _2862 = _2796 * _2852;
        _2274 = _2862;
    }
    float _2864 = _2274;
    if (!_2776)
    {
        _2798 = _2836;
    }
    float _2866 = _2798;
    float _2868 = _2866;
    if (_2776)
    {
        float _2870 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2848 = _2870;
    }
    float _2872 = _2848;
    if (_2776)
    {
        float _2874 = _2764 * _2864;
        _2788 = _2874;
    }
    float _2876 = _2788;
    if (!_2776)
    {
        _2854 = _2766;
    }
    float _2878 = _2854;
    float _2880 = _2878;
    if (_2776)
    {
        float _2882 = _2766 * _2864;
        _2880 = _2882;
    }
    float _2884 = _2880;
    if (!_2776)
    {
        _2860 = _2768;
    }
    float _2886 = _2860;
    float _2888 = _2886;
    if (_2776)
    {
        float _2890 = fma(_2836, _2830, _2872);
        _2868 = _2890;
    }
    float _2892 = _2868;
    if (_2776)
    {
        float _2894 = _2876 * _2876;
        _2888 = _2894;
    }
    float _2896 = _2888;
    if (!_2776)
    {
        _2838 = _2770;
    }
    float _2898 = _2838;
    float _2900 = _2898;
    if (_2776)
    {
        float _2902 = _2884 * _2884;
        _2900 = _2902;
    }
    float _2904 = _2900;
    float _2906 = fma(_2892, _2892, _2896);
    float _2908 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2910 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2912 = _2906 + _2904;
    float _2914 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2908);
    float _2916 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2920 = fma(_2844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2918);
    float _2922 = precise::clamp(_2920, 0.0, 1.0);
    float _2924 = rsqrt(_2912);
    float _2926 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2928 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2914);
    float _2930 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2916);
    float _2932 = -_2922;
    float _2934 = _2932 + 1.0;
    float _2936 = _2616 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2938 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2940 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2910);
    float _2942 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2930);
    float _2944 = abs(_2934);
    float _2946 = log2(_2944);
    float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2950 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2936);
    float _2952 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2940);
    float _2954 = _2942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2956 = -_2948;
    float _2958 = fma(_2956, _2926, 1.0);
    float _2960 = fma(_2620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2950);
    float _2962 = _2924 * _2876;
    float _2964 = _2952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2966 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2968 = _2924 * _2892;
    float _2970 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2972 = _2924 * _2884;
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2966);
    float _2976 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2978 = -_2970;
    float _2980 = fma(_2968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2978);
    float _2982 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2984 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2974);
    float _2986 = log2(_2958);
    float _2988 = -_2972;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2980);
    float _2992 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2994 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2984);
    float _2996 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2998 = fma(_2990, -0.5, 0.5);
    float _3000 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2992);
    float _3002 = exp2(_2982);
    float _3004 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2996);
    float _3006 = fma(_2990, 0.5, 0.5);
    float _3008 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3000);
    float _3010 = _2968 + 1.0;
    float _3012 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = 1.0 / _2994;
    float _3016 = fma(_3006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3018 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3020 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3008);
    float _3022 = _2986 * 0.693147182464599609375;
    float _3024 = fma(_3006, _3016, -0.212114393711090087890625);
    float _3026 = sqrt(_2998);
    float _3028 = -_2968;
    float _3030 = fma(_3002, _3010, _3028);
    float _3032 = fma(_3006, _3024, 1.570728778839111328125);
    float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3036 = fma(_3030, 0.5, 0.5);
    float _3038 = _3018 * _3014;
    float _3040 = _3020 * _3014;
    float _3042 = fma(_3038, 0.5, 0.5);
    float _3044 = fma(_3040, -0.5, 0.5);
    float _3046 = _3026 * 0.636619746685028076171875;
    float3 _7712 = float3(_3042, _3044, _3034);
    float _3048 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7712, float3(0.0), isnan(_7712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7712, float3(0.0), isnan(_7712)), level(0.0)).x;
    float3 _7723 = float3(_3042, _3044, _3034);
    float4 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7723, float3(0.0), isnan(_7723)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7723, float3(0.0), isnan(_7723)), level(0.0)).xyzw;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = _3051.w;
    float _3061 = -_3032;
    float _3063 = fma(_3046, _3061, 1.0);
    float2 _7745 = float2(_3063, _3036);
    float3 _3067 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7745, float2(0.0), isnan(_7745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7745, float2(0.0), isnan(_7745)), level(0.0)).xyz;
    float _3069 = _3067.x;
    float _3071 = _3067.y;
    float _3073 = _3067.z;
    float _3075 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3077 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3079 = _2682 > 0.0;
    bool _3081 = isnan(_2682);
    bool _3083 = _3079 || _3081;
    bool _3085 = isnan(0.0);
    bool _3087 = _3083 || _3085;
    float _3089 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3077);
    float _3091 = exp2(_3075);
    bool _3093 = _2740 <= 0.0;
    bool _3095 = !_3087;
    bool _3097 = _3093 || _3095;
    float _3099 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3089);
    float _3101 = fma(_2976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3099);
    float _3103 = _2682 * _2740;
    float _3105 = _3101 + _2994;
    float _3107 = _3103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3109 = _3105 * 0.5;
    float _3111 = -_3091;
    float _3113 = _3111 + 1.0;
    float _3115 = _3107 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _3018;
    out.gl_Position.y = _3020;
    out.gl_Position.z = _3101;
    out.gl_Position.w = _2994;
    float _3117 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _3109;
    out.m_62.w = _2994;
    out.m_45.x = _3115;
    float _3119 = _3117 * _3048;
    float _3121 = -_3117;
    float _3123 = _3121 + 1.0;
    float _3125 = _3059 * _3119;
    float _3127 = _3073 * _3119;
    float _3129 = fma(_3069, _3125, _3053);
    float _3131 = fma(_3071, _3125, _3055);
    float _3133 = _3059 * _3123;
    float _3135 = fma(_3059, _3127, _3057);
    out.m_64.x = _3129;
    out.m_64.y = _3131;
    out.m_64.z = _3135;
    out.m_64.w = _3133;
    if (!_3097)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3137;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

