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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2015 = false;
    bool _745 = false;
    bool _625 = false;
    bool _475 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2645 = as_type<float>(_107);
        out.gl_Position.z = _2645;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _125;
    if (_121)
    {
        float _133 = float(_89);
        _101 = _133;
    }
    float _135 = _101;
    bool _137 = _125 >= _135;
    bool _139 = !_121;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _109 = as_type<int>(_147);
    }
    int _149 = _109;
    float _151 = as_type<float>(_149);
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2717 = as_type<float>(_149);
        out.gl_Position.z = _2717;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _159;
    if (!_169)
    {
        float _173 = _159 * _159;
        float _175 = _173 * 0.5;
        _151 = _175;
    }
    float _177 = _151;
    float _179 = 0.0;
    float _181 = _177;
    if (!_169)
    {
        float _183 = _125 * _125;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_169)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_169;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _159 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _159);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _127 = _211;
        _195 = _225;
        _129 = _213;
    }
    float _227 = _127;
    float _229 = _195;
    float _231 = _129;
    bool _233 = !_169;
    float _235 = _227;
    float _237 = _231;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _159 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _235 = _251;
        _237 = _245;
        _171 = _257;
    }
    float _259 = _235;
    float _261 = _237;
    float _263 = _171;
    float _265 = _261;
    float _267 = _259;
    if (!_169)
    {
        _265 = _125;
    }
    float _269 = _265;
    float _271 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _269;
    if (!_169)
    {
        float _275 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _275;
    }
    float _277 = _267;
    bool _279 = !_169;
    float _281 = _277;
    if (!_279)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _125 * _285;
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _287 * 0.693147182464599609375;
        float _299 = exp2(_289);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _125);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _311;
    }
    float _313 = _281;
    bool _315 = !_169;
    if (!_315)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = 1.0 / _323;
        float _327 = _125 * _319;
        float _329 = exp2(_327);
        float _331 = -_329;
        float _333 = _331 + 1.0;
        float _335 = _333 * _325;
        _273 = _335;
    }
    float _337 = _273;
    float _339 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = fma(_263, _155, _271);
    float _343 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _347 = fma(_337, _155, _339);
    float _349 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = fma(_263, _153, _343);
    float _355 = fma(_337, _153, _345);
    float _357 = -_347;
    float _359 = _341 + _357;
    float _361 = fma(_263, _157, _349);
    float _363 = fma(_337, _157, _351);
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _359 * _359;
    float _371 = in.m_51.w;
    float _373 = -_363;
    float _375 = _361 + _373;
    float _377 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _379 = fma(_367, _367, _369);
    float _381 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _383 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _385 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _377);
    float _387 = fma(_375, _375, _379);
    float _389 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _381);
    float _391 = in.m_44.x;
    float _393 = in.m_44.y;
    float _395 = in.m_44.z;
    float _397 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _399 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _383);
    float _401 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _389);
    float _403 = sqrt(_387);
    float _405 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _399);
    bool _407 = _403 >= 9.9999999747524270787835121154785e-07;
    bool _409 = isnan(_403);
    bool _411 = _407 || _409;
    bool _413 = isnan(9.9999999747524270787835121154785e-07);
    bool _415 = _411 || _413;
    float _417 = fma(_353, _371, _391);
    float _419 = fma(_341, _371, _393);
    float _421 = fma(_361, _371, _395);
    float _423 = _371;
    float _425 = _341;
    float _427 = _405;
    if (_415)
    {
        _423 = _397;
    }
    float _429 = _423;
    float _431 = _429;
    if (_415)
    {
        _425 = _401;
    }
    float _433 = _425;
    float _435 = _433;
    if (!_415)
    {
        bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _439 = !_437;
        if (!_439)
        {
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _451);
            float _459 = _453 * _453;
            float _461 = fma(_455, _455, _459);
            float _463 = fma(_457, _457, _461);
            float _465 = rsqrt(_463);
            float _467 = _465 * 9.9999999747524270787835121154785e-07;
            float _469 = _455 * _467;
            float _471 = _453 * _467;
            float _473 = _457 * _467;
            _435 = _471;
            _431 = _469;
            _427 = _473;
            _475 = true;
        }
        else
        {
            float _477 = _155 * _155;
            float _479 = fma(_153, _153, _477);
            float _481 = fma(_157, _157, _479);
            float _483 = sqrt(_481);
            bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
            bool _487 = isnan(_483);
            bool _489 = _485 || _487;
            bool _491 = isnan(9.9999999747524270787835121154785e-07);
            bool _493 = _489 || _491;
            if (!_493)
            {
                float _495 = _393 * _393;
                float _497 = fma(_391, _391, _495);
                float _499 = fma(_395, _395, _497);
                float _501 = sqrt(_499);
                bool _503 = _501 >= 9.9999999747524270787835121154785e-07;
                bool _505 = isnan(_501);
                bool _507 = _503 || _505;
                bool _509 = isnan(9.9999999747524270787835121154785e-07);
                bool _511 = _507 || _509;
                if (!_511)
                {
                    float _513 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _513);
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _515);
                    float _519 = rsqrt(_517);
                    float _521 = _519 * 9.9999999747524270787835121154785e-07;
                    float _523 = _521 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _521 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _521 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _435 = _525;
                    _431 = _523;
                    _427 = _527;
                    _475 = true;
                }
                else
                {
                    float _529 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _535 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _529);
                    float _537 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
                    float _539 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
                    float _541 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _535);
                    float _543 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _537);
                    float _545 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
                    float _547 = _541 * _541;
                    float _549 = fma(_543, _543, _547);
                    float _551 = fma(_545, _545, _549);
                    float _553 = rsqrt(_551);
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    float _557 = _543 * _555;
                    float _559 = _541 * _555;
                    float _561 = _545 * _555;
                    _435 = _559;
                    _431 = _557;
                    _427 = _561;
                    _475 = true;
                }
            }
            else
            {
                float _563 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _565 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _567 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _569 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _565);
                float _573 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
                float _575 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _569);
                float _577 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
                float _579 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _573);
                float _581 = _575 * _575;
                float _583 = fma(_577, _577, _581);
                float _585 = fma(_579, _579, _583);
                float _587 = rsqrt(_585);
                float _589 = _587 * 9.9999999747524270787835121154785e-07;
                float _591 = _577 * _589;
                float _593 = _575 * _589;
                float _595 = _579 * _589;
                _435 = _593;
                _431 = _591;
                _427 = _595;
            }
        }
    }
    _475 = false;
    float _597 = _435;
    float _599 = _431;
    float _601 = _427;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _605 = !_603;
    float _623;
    if (!_605)
    {
        float _607 = in.m_53.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_89);
        float _629 = 1.0 / _627;
        float _631 = _125 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    bool _635 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_633);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _651 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_633);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _633 + _667;
    float _671 = -_645;
    float _673 = _671 + 1.0;
    float _675 = 1.0 / _649;
    float _677 = _661 * _673;
    float _679 = -_661;
    float _681 = _679 + 1.0;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _665 * _675;
    float _703 = fma(_701, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = _703 * _677;
    float _707 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _709 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[116].x, _707);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _713 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_55.x = _691;
    out.m_55.y = _695;
    out.m_55.z = _697;
    out.m_55.w = _713;
    float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _719;
    out.m_57.y = _721;
    out.m_57.z = _699;
    out.m_57.w = _711;
    bool _723 = !_687;
    float _725 = _675;
    float _743;
    if (!_723)
    {
        float _727 = in.m_53.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_89);
        float _749 = 1.0 / _747;
        float _751 = _125 * _749;
        _97 = _747;
        _743 = _751;
    }
    _745 = false;
    float _753 = _97;
    float _755 = _743;
    float _757 = in.m_53.z;
    bool _759 = _417 > 0.0;
    float _761 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _763 = log2(_761);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _767 = _765 != 0;
    float _769 = in.m_53.x;
    bool _771 = _417 >= 0.0;
    bool _773 = isnan(_417);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _783 = as_type<float>(int(gl_VertexIndex));
    int _785 = _779 ? 0 : 1;
    float _787 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _781);
    float _789 = in.m_53.w;
    int _791 = ~_785;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    int _797 = _795;
    if (!_759)
    {
        int _799 = ~_785;
        int _801 = _799 + 1;
        _797 = _801;
    }
    int _803 = _797;
    float _805 = _753;
    if (!_767)
    {
        float _807 = in.m_53.y;
        _805 = _807;
    }
    float _809 = _805;
    float _811 = _757 * 2.0;
    float _813 = _769 * 2.0;
    float _815 = floor(_811);
    int _817 = as_type<int>(_783) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>(_783) & 2;
    bool _823 = _821 != 0;
    bool _825 = _789 > 0.5;
    float _827 = _763 * _125;
    float _829 = floor(_813);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_767)
    {
        _725 = _809;
    }
    float _833 = _725;
    float _835 = _833;
    float _837 = _809;
    if (_767)
    {
        float _839 = in.m_53.x;
        float _841 = in.m_53.y;
        _835 = _839;
        _837 = _841;
    }
    float _843 = _835;
    float _845 = _837;
    bool _847 = _815 >= 0.0;
    bool _849 = isnan(_815);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = exp2(_827);
    bool _859 = _815 > 0.0;
    int _861 = _855 ? 0 : 1;
    bool _863 = _829 > 0.0;
    bool _865 = _829 >= 0.0;
    bool _867 = isnan(_829);
    bool _869 = _865 || _867;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _877 = ~_861;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _885 = _881;
    if (!_767)
    {
        _831 = _757;
    }
    float _887 = _831;
    float _889 = _887;
    if (!_859)
    {
        int _891 = ~_861;
        int _893 = _891 + 1;
        _885 = _893;
    }
    int _895 = _885;
    float _897 = -_857;
    float _899 = _897 + 1.0;
    float _901 = float(_895);
    float _903 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[83].z, _875);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _907 = _845 * 2.0;
    float _909 = _843 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_767)
    {
        _889 = _845;
    }
    float _911 = _889;
    bool _913 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _915 = isnan(1.0);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _921 = _917 || _919;
    float _923 = floor(_907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _927 = 1.0 + _925;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[83].w, _905);
    float _931 = -_883;
    float _933 = fma(_909, 2.0, _931);
    float _935 = _911;
    if (!_767)
    {
        _935 = _757;
    }
    float _937 = _935;
    float _939 = -_125;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[81].x, _933);
    float _943 = 1.0 / _927;
    float _945 = _937;
    if (_767)
    {
        _945 = _845;
    }
    float _947 = _945;
    float _949 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _929);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _953 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _961 = _957 || _959;
    float _963 = _947 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _965 = _873 ? 0 : 1;
    float _967 = _961 ? _899 : 0.0;
    float _969 = fma(_963, -2.0, _951);
    int _971 = ~_965;
    int _973 = _971 + 1;
    int _975 = _973 + 1;
    bool _977 = _923 > 0.0;
    float _979 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _969);
    int _981 = _975;
    if (!_863)
    {
        int _983 = ~_965;
        int _985 = _983 + 1;
        _981 = _985;
    }
    int _987 = _981;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _993 = _923 >= 0.0;
    bool _995 = isnan(_923);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _903);
    if (_921)
    {
        float _1005 = _967 * _943;
        _131 = _1005;
    }
    float _1007 = _131;
    float _1009 = 1.0 / _991;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1015 = _1001 ? 0 : 1;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1027 = _1025 != 0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1033 = 1.0 / _1013;
    int _1035 = ~_1015;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _1039;
    if (!_977)
    {
        int _1043 = ~_1015;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    bool _1049 = !_819;
    float _1051 = _1049 ? (-0.5) : 0.5;
    float _1053 = 1.0 / _1031;
    bool _1055 = !_1019;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1063 = !_1023;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1069 = _1067 != 0;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1073 = _1071 != 0;
    float _1075 = 1.0 / _1061;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1079 = _1077 != 0;
    float _1081 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1085 = _1083 != 0;
    float _1087 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1093 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1081);
    float _1095 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1087);
    float _1097 = 1.0 / _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1103;
    float _1107 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1095);
    float _1109 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1093);
    float _1111 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _787);
    float _1113 = _597 * _597;
    float _1115 = _1105 * _1009;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1121 = fma(_599, _599, _1113);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1127 = 1.0 / _1101;
    float _1129 = _1119 * _1033;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1139 = _1125 * _1075;
    float _1141 = _1133 * _1053;
    float _1143 = fma(_601, _601, _1121);
    float _1145 = 1.0 / _1137;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1153 = _755 + _1151;
    float _1155 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1161 = _1149 * _1097;
    float _1163 = fma(_1115, _1153, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1165 = rsqrt(_1143);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1167;
    float _1171 = _769 + _757;
    float _1173 = float(_987);
    float _1175 = _1107 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1177 = _1159 * _1127;
    float _1179 = _1171 + (-1.0);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1183 = _755 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1187 = _755 + _1185;
    float _1189 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1191 = abs(_1065);
    float _1193 = fma(_1129, _1183, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1195 = fma(_1141, _1187, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1197 = _757 + _845;
    float _1199 = float(_1191);
    float _1201 = _1165 * _599;
    float _1203 = _1165 * _597;
    float _1205 = _1165 * _601;
    int _1207 = abs(_1057);
    float _1209 = _1197 + (-1.0);
    float _1211 = in.m_62.x;
    float _1213 = in.m_62.y;
    float _1215 = in.m_62.z;
    float _1217 = _1199 * _1173;
    float _1219 = float(_1207);
    float _1221 = _1111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1175 + _1223;
    float _1227 = _1169 * _1145;
    float _1229 = _769 + _845;
    float _1231 = _1219 * _901;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1235 = _1155 + _1233;
    float _1237 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1241 = _1221 + _1239;
    float _1243 = _1229 + (-1.0);
    float _1245 = _1235 * _1235;
    float _1247 = _1231 * (-2.0);
    float _1249 = _1217 * (-2.0);
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1253 = fma(_1225, _1225, _1245);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1257 = _1205 * _1255;
    float _1259 = float(_1047);
    float _1261 = fma(_1251, _1247, _1251);
    float _1263 = fma(_1241, _1241, _1253);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1267 = _1203 * _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1271 = -_1257;
    float _1273 = fma(_1201, _1269, _1271);
    float _1275 = rsqrt(_1263);
    float _1277 = fma(_1247, _1211, _1211);
    bool _1279 = !_1027;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1285 = _1201 * _1283;
    bool _1287 = _769 > 0.5;
    float _1289 = _769 + (-0.5);
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1293 = -_1267;
    float _1295 = fma(_1205, _1291, _1293);
    float _1297 = _1273 * _1273;
    int _1299 = abs(_1281);
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1277);
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1305 = -_1285;
    float _1307 = fma(_1203, _1303, _1305);
    float _1309 = fma(_1295, _1295, _1297);
    float _1311 = fma(_1237, _1249, _1237);
    float _1313 = fma(_1249, _1213, _1213);
    float _1315 = fma(_1261, _1007, _1301);
    float _1317 = float(_1299);
    float _1319 = _1235 * _1275;
    float _1321 = _845 + (-0.5);
    float _1323 = _1225 * _1275;
    float _1325 = _1315 * 0.15915493667125701904296875;
    float _1327 = -_1319;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1331 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1313);
    float _1333 = -_1323;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1337 = _1317 * _1259;
    float _1339 = _1329 * _1329;
    float _1341 = _1241 * _1275;
    float _1343 = fma(_1307, _1307, _1309);
    float _1345 = _1337 * (-2.0);
    float _1347 = fma(_1335, _1335, _1339);
    float _1349 = fma(_1311, _1007, _1331);
    float _1351 = -_1341;
    float _1353 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1355 = in.m_51.x;
    float _1357 = in.m_51.y;
    float _1359 = rsqrt(_1343);
    float _1361 = fma(_1353, _1353, _1347);
    float _1363 = fma(_1345, _1215, _1215);
    bool _1365 = !_823;
    float _1367 = _1365 ? (-0.5) : 0.5;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1371 = _755 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _1377 = _757 > 0.5;
    float _1379 = _757 + (-0.5);
    float _1381 = float(_803);
    float _1383 = _1325 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1363);
    float _1389 = fma(_1139, _1371, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1391 = 0.0 + _1381;
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1397 = _755 + _1395;
    float _1399 = _1295 * _1359;
    float _1401 = sqrt(_1361);
    float _1403 = fma(_1393, _1375, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1405 = fma(_1189, _1345, _1189);
    float _1407 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1051);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1411 = _1403 + _1409;
    float _1413 = fma(_1405, _1007, _1387);
    float _1415 = fma(_1161, _1397, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1417 = _1325 * 6.283185482025146484375;
    float _1419 = cos(_1417);
    float _1421 = abs(_1381);
    float _1423 = fma(_1421, _1411, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1425 = _1413 * 0.15915493667125701904296875;
    float _1427 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1429 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1433 = _755 + _1431;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1367);
    float _1437 = _1423 * _1427;
    float _1439 = _1425 * 6.283185482025146484375;
    float _1441 = cos(_1439);
    float _1443 = _1349 * 0.15915493667125701904296875;
    float _1445 = _1275 * _1401;
    float _1447 = _1423 * _1429;
    float _1449 = _1437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1451 = fma(_1177, _1433, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1453 = _1307 * _1359;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = _1443 * 6.283185482025146484375;
    float _1459 = sin(_1457);
    float _1461 = _1449 * _1445;
    float _1463 = _1455 * _1445;
    float _1465 = _1273 * _1359;
    float _1467 = _1461 * _1407;
    float _1469 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1471 = _1469 * 0.5;
    float _1473 = _1463 * _1435;
    float _1475 = _1443 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    float _1479 = _1385 * _1441;
    float _1481 = _1425 * 6.283185482025146484375;
    float _1483 = sin(_1481);
    float _1485 = _1385 * _1459;
    float _1487 = _1419 * _1459;
    float _1489 = _1459 * _1441;
    float _1491 = _1419 * _1477;
    float _1493 = _1385 * _1477;
    float _1495 = _1477 * _1441;
    float _1497 = _1419 * _1441;
    float _1499 = _1497 * _1201;
    float _1501 = fma(_1483, _1491, _1485);
    float _1503 = -_1493;
    float _1505 = fma(_1483, _1487, _1503);
    float _1507 = fma(_1483, _1485, _1491);
    float _1509 = _1203 * _1453;
    float _1511 = _1501 * _1201;
    float _1513 = _1505 * _1201;
    float _1515 = -_1487;
    float _1517 = fma(_1483, _1493, _1515);
    float _1519 = -_1509;
    float _1521 = fma(_1205, _1465, _1519);
    float _1523 = fma(_1495, _1399, _1511);
    float _1525 = -_1483;
    float _1527 = fma(_1525, _1399, _1499);
    bool _1529 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1531 = isnan(_755);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = fma(_1489, _1399, _1513);
    float _1543 = _1201 * _1465;
    float _1545 = _1501 * _1205;
    float _1547 = _1497 * _1205;
    float _1549 = _1505 * _1205;
    float _1551 = fma(_1517, _1521, _1523);
    float _1553 = fma(_1479, _1521, _1527);
    bool _1555 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1557 = isnan(_755);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = fma(_1507, _1521, _1541);
    float _1569 = -_1539;
    float _1571 = _1569 + 1.0;
    float _1573 = -_1543;
    float _1575 = fma(_1203, _1399, _1573);
    float _1577 = fma(_1495, _1453, _1545);
    float _1579 = -_1483;
    float _1581 = fma(_1579, _1453, _1547);
    float _1583 = fma(_1489, _1453, _1549);
    bool _1585 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1587 = isnan(_755);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1593 = _1589 || _1591;
    float _1595 = float(_1593);
    float _1597 = _1565 * _1571;
    float _1599 = fma(_1517, _1575, _1577);
    float _1601 = fma(_1479, _1575, _1581);
    float _1603 = -_1565;
    float _1605 = _1603 + 1.0;
    float _1607 = fma(_1507, _1575, _1583);
    float _1609 = _1473 * _1553;
    bool _1611 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1613 = isnan(_755);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = -_1595;
    float _1625 = _1623 + 1.0;
    float _1627 = _1595 * _1605;
    float _1629 = fma(_1467, _1551, _1609);
    float _1631 = _1473 * _1601;
    bool _1633 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1635 = isnan(_755);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1621 * _1625;
    float _1647 = -_1621;
    float _1649 = _1647 + 1.0;
    float _1651 = fma(_1467, _1599, _1631);
    bool _1653 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1655 = isnan(_755);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = fma(_1471, _1567, _1629);
    float _1667 = _1643 * _1649;
    float _1669 = -_1643;
    float _1671 = _1669 + 1.0;
    float _1673 = fma(_1471, _1607, _1651);
    bool _1675 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1677 = isnan(_755);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1175 + _1665;
    float _1689 = _1663 * _1671;
    float _1691 = -_1663;
    float _1693 = _1691 + 1.0;
    float _1695 = _1221 + _1673;
    bool _1697 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1699 = isnan(_755);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    float _1709 = -_1685;
    float _1711 = _1709 + 1.0;
    float _1713 = _1685 * _1693;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1717 = _1687 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1721 = _1695 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1725 = _755 + _1723;
    float _1727 = _1707 * _1711;
    float _1729 = _1717 * _1717;
    float _1731 = _1721 * _1721;
    float _1733 = _1205 * _1399;
    float _1735 = _1163 * _1727;
    float _1737 = fma(_1227, _1725, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1739 = _1729 + _1731;
    float _1741 = -_1051;
    int _1743 = _1377 ? as_type<int>(_1741) : as_type<int>(_1051);
    float _1745 = -_1707;
    float _1747 = _1745 + 1.0;
    float _1749 = -_1051;
    int _1751 = _1287 ? as_type<int>(_1749) : as_type<int>(_1051);
    float _1753 = sqrt(_1739);
    bool _1755 = !_1069;
    float _1757 = _1755 ? _1051 : as_type<float>(_1743);
    float _1759 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1735);
    bool _1761 = !_1079;
    float _1763 = _1761 ? _1051 : as_type<float>(_1751);
    float _1765 = _1497 * _1203;
    float _1767 = -_1733;
    float _1769 = fma(_1201, _1453, _1767);
    float _1771 = _1501 * _1203;
    float _1773 = _1505 * _1203;
    float _1775 = -_1483;
    float _1777 = fma(_1775, _1465, _1765);
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1781 = fma(_1495, _1465, _1771);
    float _1783 = fma(_1193, _1713, _1759);
    float _1785 = fma(_1479, _1769, _1777);
    float _1787 = fma(_1489, _1465, _1773);
    float _1789 = fma(_1517, _1769, _1781);
    bool _1791 = _845 > 0.5;
    float _1793 = _1473 * _1785;
    bool _1795 = _1753 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1797 = fma(_1195, _1689, _1783);
    float _1799 = fma(_1507, _1769, _1787);
    float _1801 = fma(_1467, _1789, _1793);
    float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1805 = -_1367;
    int _1807 = _1791 ? as_type<int>(_1805) : as_type<int>(_1367);
    float _1809 = fma(_1389, _1667, _1797);
    float _1811 = fma(_1471, _1799, _1801);
    float _1813 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1815 = -_1367;
    int _1817 = _825 ? as_type<int>(_1815) : as_type<int>(_1367);
    float _1819 = _1757 + 0.5;
    float _1821 = _1155 + _1811;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1825 = !_1073;
    float _1827 = _1825 ? _1367 : as_type<float>(_1817);
    float _1829 = fma(_1813, _1819, _941);
    bool _1831 = !_1085;
    float _1833 = _1831 ? _1367 : as_type<float>(_1807);
    float _1835 = fma(_1415, _1645, _1809);
    float _1837 = _1367;
    float _1839 = _1729;
    float _1841 = _1731;
    float _1843 = _1687;
    float _1845 = _1695;
    if (!_1795)
    {
        _1837 = _1821;
    }
    float _1847 = _1837;
    bool _1849 = !_1795;
    float _1851 = _1847;
    float _1853 = _1823;
    if (!_1849)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1859 = _1753 + _1857;
        float _1861 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1863 = rsqrt(_1739);
        float _1865 = _1859 * _1855;
        float _1867 = _1865 * 0.15915493667125701904296875;
        float _1869 = _1867 * 6.283185482025146484375;
        float _1871 = sin(_1869);
        float _1873 = _1867 * 6.283185482025146484375;
        float _1875 = cos(_1873);
        float _1877 = fma(_1871, _1861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1879 = _1863 * _1877;
        float _1881 = _1875 + (-1.0);
        float _1883 = fma(_1717, _1879, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1885 = fma(_1721, _1879, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1887 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1891 = _1883 + _1889;
        float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1895 = _1885 + _1893;
        float _1897 = fma(_1821, _1875, _1887);
        float _1899 = _1891 * _1891;
        float _1901 = _1895 * _1895;
        _1851 = _1897;
        _1839 = _1899;
        _1841 = _1901;
        _1843 = _1883;
        _1845 = _1885;
    }
    float _1903 = _1851;
    float _1905 = _1839;
    float _1907 = _1841;
    float _1909 = _1843;
    float _1911 = _1845;
    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1915 = _1903 + _1913;
    float _1917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1919 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1921 = _1827 + (-0.5);
    float _1923 = fma(_1915, _1915, _1905);
    float _1925 = fma(_1451, _1627, _1835);
    float _1927 = _1763 + 0.5;
    float _1929 = -_1833;
    float _1931 = _1929 + 0.5;
    float _1933 = _1923 + _1907;
    float _1935 = -_1919;
    float _1937 = -_979;
    float _1939 = fma(_1935, _1921, _1937);
    float _1941 = fma(_1737, _1597, _1925);
    float _1943 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1945 = -_1003;
    float _1947 = _1945 + 1.0;
    float _1949 = -_949;
    float _1951 = _1949 + 1.0;
    float _1953 = sqrt(_1933);
    float _1955 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1957 = _1943 * _1823;
    float _1959 = -_1947;
    float _1961 = fma(_1757, _1959, _1829);
    float _1963 = fma(_1827, _1951, _1939);
    float _1965 = _1955 * _1917;
    float _1967 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1941);
    out.m_64.x = _1957;
    out.m_64.y = _1965;
    out.m_64.z = _1961;
    out.m_64.w = _1963;
    out.m_66.x = _1967;
    bool _1969 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1971 = isnan(_1953);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1977 = _1973 || _1975;
    float _1979 = _1931;
    if (!_1977)
    {
        _1853 = 1.0;
    }
    float _1981 = _1853;
    bool _1983 = !_1977;
    float _1985 = _1981;
    if (!_1983)
    {
        bool _1987 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1989 = isnan(_1953);
        bool _1991 = _1987 || _1989;
        bool _1993 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1995 = _1991 || _1993;
        if (!_1995)
        {
            float _1997 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1999 = _1953 + _1997;
            float _2001 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2003 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2001;
            float _2005 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2009 = 1.0 / _2003;
            float _2011 = _1999 * _2009;
            float _2013 = fma(_2011, _2007, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1985 = _2013;
            _2015 = true;
        }
        else
        {
            bool _2017 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2019 = isnan(_1953);
            bool _2021 = _2017 || _2019;
            bool _2023 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2025 = _2021 || _2023;
            if (!_2025)
            {
                float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2029 = _1953 + _2027;
                float _2031 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2033 = _2031 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2035 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2037 = _2035 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2039 = 1.0 / _2033;
                float _2041 = _2029 * _2039;
                float _2043 = fma(_2041, _2037, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1985 = _2043;
                _2015 = true;
            }
            else
            {
                _1985 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2015 = false;
    float _2045 = _1985;
    float _2047 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2049 = _1903 + _2047;
    float _2051 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2053 = _1909 + _2051;
    float _2055 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2057 = _1911 + _2055;
    float _2059 = fma(_2049, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2061 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2063 = fma(_2057, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2065 = -_1319;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2059);
    float _2069 = -_1323;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2073 = -_1341;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2063);
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2079 = _2067 + _2077;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2083 = _2071 + _2081;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2087 = _2075 + _2085;
    float _2089 = _2079 * _2079;
    float _2091 = fma(_2083, _2083, _2089);
    float _2093 = fma(_2087, _2087, _2091);
    float _2095 = rsqrt(_2093);
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2099 = _2083 * _2097;
    float _2101 = _2087 * _2097;
    float _2103 = _2099 * _2099;
    float _2105 = _2101 * _2101;
    float _2107 = _2103 + _2105;
    float _2109 = sqrt(_2107);
    bool _2111 = _2109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2115 = _2109 + _2113;
    float _2117 = _1953;
    float _2119 = _2107;
    float _2121 = _2115;
    float _2123 = _2079;
    float _2125 = _2097;
    float _2127 = _2099;
    if (_2111)
    {
        float _2129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2117 = _2129;
    }
    float _2131 = _2117;
    if (_2111)
    {
        float _2133 = rsqrt(_2107);
        _2119 = _2133;
    }
    float _2135 = _2119;
    float _2137 = _2131;
    float _2139 = _2135;
    if (_2111)
    {
        float _2141 = _2115 * _2131;
        _2121 = _2141;
    }
    float _2143 = _2121;
    if (_2111)
    {
        float _2145 = _2143 * 0.15915493667125701904296875;
        _1979 = _2145;
    }
    float _2147 = _1979;
    float _2149 = _2087;
    if (_2111)
    {
        float _2151 = _2147 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        _2149 = _2153;
    }
    float _2155 = _2149;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2159 = precise::max(0.0, _2157);
    float _2161 = _1961;
    float _2163 = _2159;
    if (_2111)
    {
        float _2165 = _2147 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        _2161 = _2167;
    }
    float _2169 = _2161;
    float _2171 = -_2097;
    float _2173 = -_2159;
    float _2175 = fma(_2079, _2171, _2173);
    if (_2111)
    {
        float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2177;
    }
    float _2179 = _2123;
    float _2181 = sqrt(_2093);
    float _2183 = _2155;
    float _2185 = _2179;
    if (_2111)
    {
        float _2187 = fma(_2155, _2179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2183 = _2187;
    }
    float _2189 = _2183;
    float _2191 = _2189;
    if (!_2111)
    {
        _2185 = _2101;
    }
    float _2193 = _2185;
    float _2195 = _2193;
    if (_2111)
    {
        float _2197 = _2169 + (-1.0);
        _2163 = _2197;
    }
    float _2199 = _2163;
    float _2201 = _2199;
    if (_2111)
    {
        float _2203 = _2135 * _2189;
        _2125 = _2203;
    }
    float _2205 = _2125;
    if (!_2111)
    {
        _2191 = _2175;
    }
    float _2207 = _2191;
    float _2209 = _2207;
    if (_2111)
    {
        float _2211 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2137 = _2211;
    }
    float _2213 = _2137;
    if (_2111)
    {
        float _2215 = _2099 * _2205;
        _2127 = _2215;
    }
    float _2217 = _2127;
    if (!_2111)
    {
        _2139 = _2103;
    }
    float _2219 = _2139;
    float _2221 = _2219;
    if (_2111)
    {
        float _2223 = _2101 * _2205;
        _2195 = _2223;
    }
    float _2225 = _2195;
    if (_2111)
    {
        float _2227 = fma(_2175, _2169, _2213);
        _2209 = _2227;
    }
    float _2229 = _2209;
    if (_2111)
    {
        float _2231 = _2217 * _2217;
        _2221 = _2231;
    }
    float _2233 = _2221;
    if (!_2111)
    {
        _2201 = _2105;
    }
    float _2235 = _2201;
    float _2237 = _2235;
    if (_2111)
    {
        float _2239 = _2225 * _2225;
        _2237 = _2239;
    }
    float _2241 = _2237;
    float _2243 = fma(_2229, _2229, _2233);
    float _2245 = _2243 + _2241;
    float _2247 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2251 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2249);
    float _2253 = precise::clamp(_2251, 0.0, 1.0);
    float _2255 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2257 = rsqrt(_2245);
    float _2259 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2247);
    float _2261 = -_2253;
    float _2263 = _2261 + 1.0;
    float _2265 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2267 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2269 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2259);
    float _2271 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2273 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2265);
    float _2275 = abs(_2263);
    float _2277 = log2(_2275);
    float _2279 = _2269 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2281 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2267);
    float _2283 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2273);
    float _2285 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2271);
    float _2287 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2289 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2281);
    float _2291 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2293 = _2257 * _2217;
    float _2295 = _2257 * _2229;
    float _2297 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2301 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2303 = _2257 * _2225;
    float _2305 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2285);
    float _2307 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2299);
    float _2309 = -_2301;
    float _2311 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2309);
    float _2313 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2315 = -_2287;
    float _2317 = fma(_2315, _2255, 1.0);
    float _2319 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2321 = -_2303;
    float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2311);
    float _2325 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2307);
    float _2327 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2329 = exp2(_2313);
    float _2331 = fma(_2323, -0.5, 0.5);
    float _2333 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2325);
    float _2335 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2337 = fma(_2323, 0.5, 0.5);
    float _2339 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2327);
    float _2341 = _2295 + 1.0;
    float _2343 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2335);
    float _2345 = log2(_2317);
    float _2347 = fma(_2337, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2349 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2339);
    float _2351 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2343);
    float _2353 = fma(_2337, _2347, -0.212114393711090087890625);
    float _2355 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2349);
    float _2357 = 1.0 / _2333;
    float _2359 = -_2295;
    float _2361 = fma(_2329, _2341, _2359);
    float _2363 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2351);
    float _2365 = fma(_2337, _2353, 1.570728778839111328125);
    float _2367 = sqrt(_2331);
    float _2369 = _2345 * 0.693147182464599609375;
    float _2371 = _2355 * _2357;
    float _2373 = _2363 * _2357;
    float _2375 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2377 = fma(_2361, 0.5, 0.5);
    float _2379 = fma(_2371, 0.5, 0.5);
    float _2381 = fma(_2373, -0.5, 0.5);
    float _2383 = _2367 * 0.636619746685028076171875;
    float _2385 = -_2365;
    float _2387 = fma(_2383, _2385, 1.0);
    float3 _6294 = float3(_2379, _2381, _2375);
    float _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6294, float3(0.0), isnan(_6294)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6294, float3(0.0), isnan(_6294)), level(0.0)).x;
    float3 _6305 = float3(_2379, _2381, _2375);
    float4 _2392 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6305, float3(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6305, float3(0.0), isnan(_6305)), level(0.0)).xyzw;
    float _2394 = _2392.x;
    float _2396 = _2392.y;
    float _2398 = _2392.z;
    float _2400 = _2392.w;
    float2 _6322 = float2(_2387, _2377);
    float3 _2404 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6322, float2(0.0), isnan(_6322)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6322, float2(0.0), isnan(_6322)), level(0.0)).xyz;
    float _2406 = _2404.x;
    float _2408 = _2404.y;
    float _2410 = _2404.z;
    float _2412 = -_1319;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1155);
    float _2416 = -_1323;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _2420 = -_1341;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _2424 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2426 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2424);
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2430 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2426);
    float _2432 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2428);
    float _2434 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2436 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2432);
    float _2438 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2440 = 1.0 / _2434;
    bool _2442 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan(0.5);
    bool _2450 = _2446 || _2448;
    float _2452 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2454 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2456 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2438);
    float _2458 = _2454 + _2434;
    float _2460 = exp2(_2452);
    float _2462 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2456);
    float _2464 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2462);
    float _2466 = _2458 * _2440;
    float _2468 = _2466 * 0.5;
    float _2470 = _2458;
    if (_2450)
    {
        _2470 = 1.0;
    }
    float _2472 = _2470;
    float _2474 = _2472;
    if (!_2450)
    {
        float _2476 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2480 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2478);
        float _2482 = _2476 * 0.15915493667125701904296875;
        float _2484 = _2482 * 6.283185482025146484375;
        float _2486 = cos(_2484);
        float _2488 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2490 = _2488 * 0.15915493667125701904296875;
        float _2492 = _2482 * 6.283185482025146484375;
        float _2494 = sin(_2492);
        float _2496 = 1.0 / _2486;
        float _2498 = _2490 * 6.283185482025146484375;
        float _2500 = cos(_2498);
        float _2502 = _2494 * _2496;
        float _2504 = 1.0 / _2480;
        float _2506 = _2500 * _2502;
        float _2508 = _2490 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2514 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2512;
        float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2518 = _2504 * _2516;
        float _2520 = 1.0 / _2506;
        float _2522 = 1.0 / _2514;
        float _2524 = _2510 * _2520;
        float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2528 = fma(_2524, _2518, _2526);
        float _2530 = _2528 * _2522;
        float _2532 = precise::clamp(_2530, 0.0, 1.0);
        _2474 = _2532;
    }
    float _2534 = _2474;
    float _2536 = -_2460;
    float _2538 = _2536 + 1.0;
    float _2540 = _2333 * 0.5;
    bool _2542 = _2534 > 0.0;
    bool _2544 = isnan(_2534);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2534 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2554 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2556 = fma(_2363, -0.5, _2540);
    float _2558 = _2464 + _2333;
    float _2560 = _2355 + _2333;
    float _2562 = _2554 * _2389;
    float _2564 = -_2554;
    float _2566 = _2564 + 1.0;
    float _2568 = _2558 * 0.5;
    float _2570 = _2400 * _2562;
    float _2572 = _2410 * _2562;
    float _2574 = _2400 * _2566;
    float _2576 = _2560 * 0.5;
    float _2578 = _2552 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2406, _2570, _2394);
    float _2582 = fma(_2408, _2570, _2396);
    float _2584 = fma(_2400, _2572, _2398);
    out.gl_Position.x = _2355;
    out.gl_Position.y = _2363;
    out.gl_Position.z = _2464;
    out.gl_Position.w = _2333;
    out.m_68.x = _2576;
    out.m_68.y = _2556;
    out.m_68.z = _2568;
    out.m_68.w = _2333;
    out.m_47.x = _2578;
    out.m_70.x = _2580;
    out.m_70.y = _2582;
    out.m_70.z = _2584;
    out.m_70.w = _2574;
    if (_2550)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2015 = false;
    bool _745 = false;
    bool _625 = false;
    bool _475 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2645 = as_type<float>(_107);
        out.gl_Position.z = _2645;
    }
    if (!_93)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _125;
    if (_121)
    {
        float _133 = float(_89);
        _101 = _133;
    }
    float _135 = _101;
    bool _137 = _125 >= _135;
    bool _139 = !_121;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _109 = as_type<int>(_147);
    }
    int _149 = _109;
    float _151 = as_type<float>(_149);
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2717 = as_type<float>(_149);
        out.gl_Position.z = _2717;
    }
    if (_141)
    {
        return out;
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _159;
    if (!_169)
    {
        float _173 = _159 * _159;
        float _175 = _173 * 0.5;
        _151 = _175;
    }
    float _177 = _151;
    float _179 = 0.0;
    float _181 = _177;
    if (!_169)
    {
        float _183 = _125 * _125;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_169)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_169;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _159 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _159);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _127 = _211;
        _195 = _225;
        _129 = _213;
    }
    float _227 = _127;
    float _229 = _195;
    float _231 = _129;
    bool _233 = !_169;
    float _235 = _227;
    float _237 = _231;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _159 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _235 = _251;
        _237 = _245;
        _171 = _257;
    }
    float _259 = _235;
    float _261 = _237;
    float _263 = _171;
    float _265 = _261;
    float _267 = _259;
    if (!_169)
    {
        _265 = _125;
    }
    float _269 = _265;
    float _271 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _269;
    if (!_169)
    {
        float _275 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _275;
    }
    float _277 = _267;
    bool _279 = !_169;
    float _281 = _277;
    if (!_279)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _125 * _285;
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _287 * 0.693147182464599609375;
        float _299 = exp2(_289);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _125);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _311;
    }
    float _313 = _281;
    bool _315 = !_169;
    if (!_315)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = 1.0 / _323;
        float _327 = _125 * _319;
        float _329 = exp2(_327);
        float _331 = -_329;
        float _333 = _331 + 1.0;
        float _335 = _333 * _325;
        _273 = _335;
    }
    float _337 = _273;
    float _339 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = fma(_263, _155, _271);
    float _343 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _347 = fma(_337, _155, _339);
    float _349 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = fma(_263, _153, _343);
    float _355 = fma(_337, _153, _345);
    float _357 = -_347;
    float _359 = _341 + _357;
    float _361 = fma(_263, _157, _349);
    float _363 = fma(_337, _157, _351);
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _359 * _359;
    float _371 = in.m_51.w;
    float _373 = -_363;
    float _375 = _361 + _373;
    float _377 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _379 = fma(_367, _367, _369);
    float _381 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _383 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _385 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _377);
    float _387 = fma(_375, _375, _379);
    float _389 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _381);
    float _391 = in.m_44.x;
    float _393 = in.m_44.y;
    float _395 = in.m_44.z;
    float _397 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _399 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _383);
    float _401 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _389);
    float _403 = sqrt(_387);
    float _405 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _399);
    bool _407 = _403 >= 9.9999999747524270787835121154785e-07;
    bool _409 = isnan(_403);
    bool _411 = _407 || _409;
    bool _413 = isnan(9.9999999747524270787835121154785e-07);
    bool _415 = _411 || _413;
    float _417 = fma(_353, _371, _391);
    float _419 = fma(_341, _371, _393);
    float _421 = fma(_361, _371, _395);
    float _423 = _371;
    float _425 = _341;
    float _427 = _405;
    if (_415)
    {
        _423 = _397;
    }
    float _429 = _423;
    float _431 = _429;
    if (_415)
    {
        _425 = _401;
    }
    float _433 = _425;
    float _435 = _433;
    if (!_415)
    {
        bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _439 = !_437;
        if (!_439)
        {
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _451);
            float _459 = _453 * _453;
            float _461 = fma(_455, _455, _459);
            float _463 = fma(_457, _457, _461);
            float _465 = rsqrt(_463);
            float _467 = _465 * 9.9999999747524270787835121154785e-07;
            float _469 = _455 * _467;
            float _471 = _453 * _467;
            float _473 = _457 * _467;
            _435 = _471;
            _431 = _469;
            _427 = _473;
            _475 = true;
        }
        else
        {
            float _477 = _155 * _155;
            float _479 = fma(_153, _153, _477);
            float _481 = fma(_157, _157, _479);
            float _483 = sqrt(_481);
            bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
            bool _487 = isnan(_483);
            bool _489 = _485 || _487;
            bool _491 = isnan(9.9999999747524270787835121154785e-07);
            bool _493 = _489 || _491;
            if (!_493)
            {
                float _495 = _393 * _393;
                float _497 = fma(_391, _391, _495);
                float _499 = fma(_395, _395, _497);
                float _501 = sqrt(_499);
                bool _503 = _501 >= 9.9999999747524270787835121154785e-07;
                bool _505 = isnan(_501);
                bool _507 = _503 || _505;
                bool _509 = isnan(9.9999999747524270787835121154785e-07);
                bool _511 = _507 || _509;
                if (!_511)
                {
                    float _513 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _513);
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _515);
                    float _519 = rsqrt(_517);
                    float _521 = _519 * 9.9999999747524270787835121154785e-07;
                    float _523 = _521 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _521 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _521 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _435 = _525;
                    _431 = _523;
                    _427 = _527;
                    _475 = true;
                }
                else
                {
                    float _529 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _535 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _529);
                    float _537 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
                    float _539 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
                    float _541 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _535);
                    float _543 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _537);
                    float _545 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
                    float _547 = _541 * _541;
                    float _549 = fma(_543, _543, _547);
                    float _551 = fma(_545, _545, _549);
                    float _553 = rsqrt(_551);
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    float _557 = _543 * _555;
                    float _559 = _541 * _555;
                    float _561 = _545 * _555;
                    _435 = _559;
                    _431 = _557;
                    _427 = _561;
                    _475 = true;
                }
            }
            else
            {
                float _563 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _565 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _567 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _569 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _565);
                float _573 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
                float _575 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _569);
                float _577 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
                float _579 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _573);
                float _581 = _575 * _575;
                float _583 = fma(_577, _577, _581);
                float _585 = fma(_579, _579, _583);
                float _587 = rsqrt(_585);
                float _589 = _587 * 9.9999999747524270787835121154785e-07;
                float _591 = _577 * _589;
                float _593 = _575 * _589;
                float _595 = _579 * _589;
                _435 = _593;
                _431 = _591;
                _427 = _595;
            }
        }
    }
    _475 = false;
    float _597 = _435;
    float _599 = _431;
    float _601 = _427;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _605 = !_603;
    float _623;
    if (!_605)
    {
        float _607 = in.m_53.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_89);
        float _629 = 1.0 / _627;
        float _631 = _125 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    bool _635 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_633);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _651 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_633);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _633 + _667;
    float _671 = -_645;
    float _673 = _671 + 1.0;
    float _675 = 1.0 / _649;
    float _677 = _661 * _673;
    float _679 = -_661;
    float _681 = _679 + 1.0;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _665 * _675;
    float _703 = fma(_701, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = _703 * _677;
    float _707 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _709 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[116].x, _707);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _713 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_55.x = _691;
    out.m_55.y = _695;
    out.m_55.z = _697;
    out.m_55.w = _713;
    float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _719;
    out.m_57.y = _721;
    out.m_57.z = _699;
    out.m_57.w = _711;
    bool _723 = !_687;
    float _725 = _675;
    float _743;
    if (!_723)
    {
        float _727 = in.m_53.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_89);
        float _749 = 1.0 / _747;
        float _751 = _125 * _749;
        _97 = _747;
        _743 = _751;
    }
    _745 = false;
    float _753 = _97;
    float _755 = _743;
    float _757 = in.m_53.z;
    bool _759 = _417 > 0.0;
    float _761 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _763 = log2(_761);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _767 = _765 != 0;
    float _769 = in.m_53.x;
    bool _771 = _417 >= 0.0;
    bool _773 = isnan(_417);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _783 = as_type<float>(int(gl_VertexIndex));
    int _785 = _779 ? 0 : 1;
    float _787 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _781);
    float _789 = in.m_53.w;
    int _791 = ~_785;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    int _797 = _795;
    if (!_759)
    {
        int _799 = ~_785;
        int _801 = _799 + 1;
        _797 = _801;
    }
    int _803 = _797;
    float _805 = _753;
    if (!_767)
    {
        float _807 = in.m_53.y;
        _805 = _807;
    }
    float _809 = _805;
    float _811 = _757 * 2.0;
    float _813 = _769 * 2.0;
    float _815 = floor(_811);
    int _817 = as_type<int>(_783) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>(_783) & 2;
    bool _823 = _821 != 0;
    bool _825 = _789 > 0.5;
    float _827 = _763 * _125;
    float _829 = floor(_813);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_767)
    {
        _725 = _809;
    }
    float _833 = _725;
    float _835 = _833;
    float _837 = _809;
    if (_767)
    {
        float _839 = in.m_53.x;
        float _841 = in.m_53.y;
        _835 = _839;
        _837 = _841;
    }
    float _843 = _835;
    float _845 = _837;
    bool _847 = _815 >= 0.0;
    bool _849 = isnan(_815);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = exp2(_827);
    bool _859 = _815 > 0.0;
    int _861 = _855 ? 0 : 1;
    bool _863 = _829 > 0.0;
    bool _865 = _829 >= 0.0;
    bool _867 = isnan(_829);
    bool _869 = _865 || _867;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _877 = ~_861;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _885 = _881;
    if (!_767)
    {
        _831 = _757;
    }
    float _887 = _831;
    float _889 = _887;
    if (!_859)
    {
        int _891 = ~_861;
        int _893 = _891 + 1;
        _885 = _893;
    }
    int _895 = _885;
    float _897 = -_857;
    float _899 = _897 + 1.0;
    float _901 = float(_895);
    float _903 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[83].z, _875);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _907 = _845 * 2.0;
    float _909 = _843 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_767)
    {
        _889 = _845;
    }
    float _911 = _889;
    bool _913 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _915 = isnan(1.0);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _921 = _917 || _919;
    float _923 = floor(_907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _927 = 1.0 + _925;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[83].w, _905);
    float _931 = -_883;
    float _933 = fma(_909, 2.0, _931);
    float _935 = _911;
    if (!_767)
    {
        _935 = _757;
    }
    float _937 = _935;
    float _939 = -_125;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[81].x, _933);
    float _943 = 1.0 / _927;
    float _945 = _937;
    if (_767)
    {
        _945 = _845;
    }
    float _947 = _945;
    float _949 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _929);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _953 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _961 = _957 || _959;
    float _963 = _947 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _965 = _873 ? 0 : 1;
    float _967 = _961 ? _899 : 0.0;
    float _969 = fma(_963, -2.0, _951);
    int _971 = ~_965;
    int _973 = _971 + 1;
    int _975 = _973 + 1;
    bool _977 = _923 > 0.0;
    float _979 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _969);
    int _981 = _975;
    if (!_863)
    {
        int _983 = ~_965;
        int _985 = _983 + 1;
        _981 = _985;
    }
    int _987 = _981;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _993 = _923 >= 0.0;
    bool _995 = isnan(_923);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _903);
    if (_921)
    {
        float _1005 = _967 * _943;
        _131 = _1005;
    }
    float _1007 = _131;
    float _1009 = 1.0 / _991;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1015 = _1001 ? 0 : 1;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1027 = _1025 != 0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1033 = 1.0 / _1013;
    int _1035 = ~_1015;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _1039;
    if (!_977)
    {
        int _1043 = ~_1015;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    bool _1049 = !_819;
    float _1051 = _1049 ? (-0.5) : 0.5;
    float _1053 = 1.0 / _1031;
    bool _1055 = !_1019;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1063 = !_1023;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1069 = _1067 != 0;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1073 = _1071 != 0;
    float _1075 = 1.0 / _1061;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1079 = _1077 != 0;
    float _1081 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1085 = _1083 != 0;
    float _1087 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1093 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1081);
    float _1095 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1087);
    float _1097 = 1.0 / _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1103;
    float _1107 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1095);
    float _1109 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1093);
    float _1111 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _787);
    float _1113 = _597 * _597;
    float _1115 = _1105 * _1009;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1121 = fma(_599, _599, _1113);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1127 = 1.0 / _1101;
    float _1129 = _1119 * _1033;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1139 = _1125 * _1075;
    float _1141 = _1133 * _1053;
    float _1143 = fma(_601, _601, _1121);
    float _1145 = 1.0 / _1137;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1153 = _755 + _1151;
    float _1155 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1161 = _1149 * _1097;
    float _1163 = fma(_1115, _1153, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1165 = rsqrt(_1143);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1167;
    float _1171 = _769 + _757;
    float _1173 = float(_987);
    float _1175 = _1107 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1177 = _1159 * _1127;
    float _1179 = _1171 + (-1.0);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1183 = _755 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1187 = _755 + _1185;
    float _1189 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1191 = abs(_1065);
    float _1193 = fma(_1129, _1183, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1195 = fma(_1141, _1187, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1197 = _757 + _845;
    float _1199 = float(_1191);
    float _1201 = _1165 * _599;
    float _1203 = _1165 * _597;
    float _1205 = _1165 * _601;
    int _1207 = abs(_1057);
    float _1209 = _1197 + (-1.0);
    float _1211 = in.m_62.x;
    float _1213 = in.m_62.y;
    float _1215 = in.m_62.z;
    float _1217 = _1199 * _1173;
    float _1219 = float(_1207);
    float _1221 = _1111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1175 + _1223;
    float _1227 = _1169 * _1145;
    float _1229 = _769 + _845;
    float _1231 = _1219 * _901;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1235 = _1155 + _1233;
    float _1237 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1241 = _1221 + _1239;
    float _1243 = _1229 + (-1.0);
    float _1245 = _1235 * _1235;
    float _1247 = _1231 * (-2.0);
    float _1249 = _1217 * (-2.0);
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1253 = fma(_1225, _1225, _1245);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1257 = _1205 * _1255;
    float _1259 = float(_1047);
    float _1261 = fma(_1251, _1247, _1251);
    float _1263 = fma(_1241, _1241, _1253);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1267 = _1203 * _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1271 = -_1257;
    float _1273 = fma(_1201, _1269, _1271);
    float _1275 = rsqrt(_1263);
    float _1277 = fma(_1247, _1211, _1211);
    bool _1279 = !_1027;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1285 = _1201 * _1283;
    bool _1287 = _769 > 0.5;
    float _1289 = _769 + (-0.5);
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1293 = -_1267;
    float _1295 = fma(_1205, _1291, _1293);
    float _1297 = _1273 * _1273;
    int _1299 = abs(_1281);
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1277);
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1305 = -_1285;
    float _1307 = fma(_1203, _1303, _1305);
    float _1309 = fma(_1295, _1295, _1297);
    float _1311 = fma(_1237, _1249, _1237);
    float _1313 = fma(_1249, _1213, _1213);
    float _1315 = fma(_1261, _1007, _1301);
    float _1317 = float(_1299);
    float _1319 = _1235 * _1275;
    float _1321 = _845 + (-0.5);
    float _1323 = _1225 * _1275;
    float _1325 = _1315 * 0.15915493667125701904296875;
    float _1327 = -_1319;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1331 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1313);
    float _1333 = -_1323;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1337 = _1317 * _1259;
    float _1339 = _1329 * _1329;
    float _1341 = _1241 * _1275;
    float _1343 = fma(_1307, _1307, _1309);
    float _1345 = _1337 * (-2.0);
    float _1347 = fma(_1335, _1335, _1339);
    float _1349 = fma(_1311, _1007, _1331);
    float _1351 = -_1341;
    float _1353 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1355 = in.m_51.x;
    float _1357 = in.m_51.y;
    float _1359 = rsqrt(_1343);
    float _1361 = fma(_1353, _1353, _1347);
    float _1363 = fma(_1345, _1215, _1215);
    bool _1365 = !_823;
    float _1367 = _1365 ? (-0.5) : 0.5;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1371 = _755 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _1377 = _757 > 0.5;
    float _1379 = _757 + (-0.5);
    float _1381 = float(_803);
    float _1383 = _1325 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1363);
    float _1389 = fma(_1139, _1371, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1391 = 0.0 + _1381;
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1397 = _755 + _1395;
    float _1399 = _1295 * _1359;
    float _1401 = sqrt(_1361);
    float _1403 = fma(_1393, _1375, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1405 = fma(_1189, _1345, _1189);
    float _1407 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1051);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1411 = _1403 + _1409;
    float _1413 = fma(_1405, _1007, _1387);
    float _1415 = fma(_1161, _1397, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1417 = _1325 * 6.283185482025146484375;
    float _1419 = cos(_1417);
    float _1421 = abs(_1381);
    float _1423 = fma(_1421, _1411, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1425 = _1413 * 0.15915493667125701904296875;
    float _1427 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1429 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1433 = _755 + _1431;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1367);
    float _1437 = _1423 * _1427;
    float _1439 = _1425 * 6.283185482025146484375;
    float _1441 = cos(_1439);
    float _1443 = _1349 * 0.15915493667125701904296875;
    float _1445 = _1275 * _1401;
    float _1447 = _1423 * _1429;
    float _1449 = _1437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1451 = fma(_1177, _1433, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1453 = _1307 * _1359;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = _1443 * 6.283185482025146484375;
    float _1459 = sin(_1457);
    float _1461 = _1449 * _1445;
    float _1463 = _1455 * _1445;
    float _1465 = _1273 * _1359;
    float _1467 = _1461 * _1407;
    float _1469 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1471 = _1469 * 0.5;
    float _1473 = _1463 * _1435;
    float _1475 = _1443 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    float _1479 = _1385 * _1441;
    float _1481 = _1425 * 6.283185482025146484375;
    float _1483 = sin(_1481);
    float _1485 = _1385 * _1459;
    float _1487 = _1419 * _1459;
    float _1489 = _1459 * _1441;
    float _1491 = _1419 * _1477;
    float _1493 = _1385 * _1477;
    float _1495 = _1477 * _1441;
    float _1497 = _1419 * _1441;
    float _1499 = _1497 * _1201;
    float _1501 = fma(_1483, _1491, _1485);
    float _1503 = -_1493;
    float _1505 = fma(_1483, _1487, _1503);
    float _1507 = fma(_1483, _1485, _1491);
    float _1509 = _1203 * _1453;
    float _1511 = _1501 * _1201;
    float _1513 = _1505 * _1201;
    float _1515 = -_1487;
    float _1517 = fma(_1483, _1493, _1515);
    float _1519 = -_1509;
    float _1521 = fma(_1205, _1465, _1519);
    float _1523 = fma(_1495, _1399, _1511);
    float _1525 = -_1483;
    float _1527 = fma(_1525, _1399, _1499);
    bool _1529 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1531 = isnan(_755);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = fma(_1489, _1399, _1513);
    float _1543 = _1201 * _1465;
    float _1545 = _1501 * _1205;
    float _1547 = _1497 * _1205;
    float _1549 = _1505 * _1205;
    float _1551 = fma(_1517, _1521, _1523);
    float _1553 = fma(_1479, _1521, _1527);
    bool _1555 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1557 = isnan(_755);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = fma(_1507, _1521, _1541);
    float _1569 = -_1539;
    float _1571 = _1569 + 1.0;
    float _1573 = -_1543;
    float _1575 = fma(_1203, _1399, _1573);
    float _1577 = fma(_1495, _1453, _1545);
    float _1579 = -_1483;
    float _1581 = fma(_1579, _1453, _1547);
    float _1583 = fma(_1489, _1453, _1549);
    bool _1585 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1587 = isnan(_755);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1593 = _1589 || _1591;
    float _1595 = float(_1593);
    float _1597 = _1565 * _1571;
    float _1599 = fma(_1517, _1575, _1577);
    float _1601 = fma(_1479, _1575, _1581);
    float _1603 = -_1565;
    float _1605 = _1603 + 1.0;
    float _1607 = fma(_1507, _1575, _1583);
    float _1609 = _1473 * _1553;
    bool _1611 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1613 = isnan(_755);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = -_1595;
    float _1625 = _1623 + 1.0;
    float _1627 = _1595 * _1605;
    float _1629 = fma(_1467, _1551, _1609);
    float _1631 = _1473 * _1601;
    bool _1633 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1635 = isnan(_755);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1621 * _1625;
    float _1647 = -_1621;
    float _1649 = _1647 + 1.0;
    float _1651 = fma(_1467, _1599, _1631);
    bool _1653 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1655 = isnan(_755);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = fma(_1471, _1567, _1629);
    float _1667 = _1643 * _1649;
    float _1669 = -_1643;
    float _1671 = _1669 + 1.0;
    float _1673 = fma(_1471, _1607, _1651);
    bool _1675 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1677 = isnan(_755);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1175 + _1665;
    float _1689 = _1663 * _1671;
    float _1691 = -_1663;
    float _1693 = _1691 + 1.0;
    float _1695 = _1221 + _1673;
    bool _1697 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1699 = isnan(_755);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    float _1709 = -_1685;
    float _1711 = _1709 + 1.0;
    float _1713 = _1685 * _1693;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1717 = _1687 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1721 = _1695 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1725 = _755 + _1723;
    float _1727 = _1707 * _1711;
    float _1729 = _1717 * _1717;
    float _1731 = _1721 * _1721;
    float _1733 = _1205 * _1399;
    float _1735 = _1163 * _1727;
    float _1737 = fma(_1227, _1725, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1739 = _1729 + _1731;
    float _1741 = -_1051;
    int _1743 = _1377 ? as_type<int>(_1741) : as_type<int>(_1051);
    float _1745 = -_1707;
    float _1747 = _1745 + 1.0;
    float _1749 = -_1051;
    int _1751 = _1287 ? as_type<int>(_1749) : as_type<int>(_1051);
    float _1753 = sqrt(_1739);
    bool _1755 = !_1069;
    float _1757 = _1755 ? _1051 : as_type<float>(_1743);
    float _1759 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1735);
    bool _1761 = !_1079;
    float _1763 = _1761 ? _1051 : as_type<float>(_1751);
    float _1765 = _1497 * _1203;
    float _1767 = -_1733;
    float _1769 = fma(_1201, _1453, _1767);
    float _1771 = _1501 * _1203;
    float _1773 = _1505 * _1203;
    float _1775 = -_1483;
    float _1777 = fma(_1775, _1465, _1765);
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1781 = fma(_1495, _1465, _1771);
    float _1783 = fma(_1193, _1713, _1759);
    float _1785 = fma(_1479, _1769, _1777);
    float _1787 = fma(_1489, _1465, _1773);
    float _1789 = fma(_1517, _1769, _1781);
    bool _1791 = _845 > 0.5;
    float _1793 = _1473 * _1785;
    bool _1795 = _1753 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1797 = fma(_1195, _1689, _1783);
    float _1799 = fma(_1507, _1769, _1787);
    float _1801 = fma(_1467, _1789, _1793);
    float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1805 = -_1367;
    int _1807 = _1791 ? as_type<int>(_1805) : as_type<int>(_1367);
    float _1809 = fma(_1389, _1667, _1797);
    float _1811 = fma(_1471, _1799, _1801);
    float _1813 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1815 = -_1367;
    int _1817 = _825 ? as_type<int>(_1815) : as_type<int>(_1367);
    float _1819 = _1757 + 0.5;
    float _1821 = _1155 + _1811;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1825 = !_1073;
    float _1827 = _1825 ? _1367 : as_type<float>(_1817);
    float _1829 = fma(_1813, _1819, _941);
    bool _1831 = !_1085;
    float _1833 = _1831 ? _1367 : as_type<float>(_1807);
    float _1835 = fma(_1415, _1645, _1809);
    float _1837 = _1367;
    float _1839 = _1729;
    float _1841 = _1731;
    float _1843 = _1687;
    float _1845 = _1695;
    if (!_1795)
    {
        _1837 = _1821;
    }
    float _1847 = _1837;
    bool _1849 = !_1795;
    float _1851 = _1847;
    float _1853 = _1823;
    if (!_1849)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1859 = _1753 + _1857;
        float _1861 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1863 = rsqrt(_1739);
        float _1865 = _1859 * _1855;
        float _1867 = _1865 * 0.15915493667125701904296875;
        float _1869 = _1867 * 6.283185482025146484375;
        float _1871 = sin(_1869);
        float _1873 = _1867 * 6.283185482025146484375;
        float _1875 = cos(_1873);
        float _1877 = fma(_1871, _1861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1879 = _1863 * _1877;
        float _1881 = _1875 + (-1.0);
        float _1883 = fma(_1717, _1879, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1885 = fma(_1721, _1879, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1887 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1891 = _1883 + _1889;
        float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1895 = _1885 + _1893;
        float _1897 = fma(_1821, _1875, _1887);
        float _1899 = _1891 * _1891;
        float _1901 = _1895 * _1895;
        _1851 = _1897;
        _1839 = _1899;
        _1841 = _1901;
        _1843 = _1883;
        _1845 = _1885;
    }
    float _1903 = _1851;
    float _1905 = _1839;
    float _1907 = _1841;
    float _1909 = _1843;
    float _1911 = _1845;
    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1915 = _1903 + _1913;
    float _1917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1919 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1921 = _1827 + (-0.5);
    float _1923 = fma(_1915, _1915, _1905);
    float _1925 = fma(_1451, _1627, _1835);
    float _1927 = _1763 + 0.5;
    float _1929 = -_1833;
    float _1931 = _1929 + 0.5;
    float _1933 = _1923 + _1907;
    float _1935 = -_1919;
    float _1937 = -_979;
    float _1939 = fma(_1935, _1921, _1937);
    float _1941 = fma(_1737, _1597, _1925);
    float _1943 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1945 = -_1003;
    float _1947 = _1945 + 1.0;
    float _1949 = -_949;
    float _1951 = _1949 + 1.0;
    float _1953 = sqrt(_1933);
    float _1955 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1957 = _1943 * _1823;
    float _1959 = -_1947;
    float _1961 = fma(_1757, _1959, _1829);
    float _1963 = fma(_1827, _1951, _1939);
    float _1965 = _1955 * _1917;
    float _1967 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1941);
    out.m_64.x = _1957;
    out.m_64.y = _1965;
    out.m_64.z = _1961;
    out.m_64.w = _1963;
    out.m_66.x = _1967;
    bool _1969 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1971 = isnan(_1953);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1977 = _1973 || _1975;
    float _1979 = _1931;
    if (!_1977)
    {
        _1853 = 1.0;
    }
    float _1981 = _1853;
    bool _1983 = !_1977;
    float _1985 = _1981;
    if (!_1983)
    {
        bool _1987 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1989 = isnan(_1953);
        bool _1991 = _1987 || _1989;
        bool _1993 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1995 = _1991 || _1993;
        if (!_1995)
        {
            float _1997 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1999 = _1953 + _1997;
            float _2001 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2003 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2001;
            float _2005 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2009 = 1.0 / _2003;
            float _2011 = _1999 * _2009;
            float _2013 = fma(_2011, _2007, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1985 = _2013;
            _2015 = true;
        }
        else
        {
            bool _2017 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2019 = isnan(_1953);
            bool _2021 = _2017 || _2019;
            bool _2023 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2025 = _2021 || _2023;
            if (!_2025)
            {
                float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2029 = _1953 + _2027;
                float _2031 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2033 = _2031 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2035 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2037 = _2035 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2039 = 1.0 / _2033;
                float _2041 = _2029 * _2039;
                float _2043 = fma(_2041, _2037, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1985 = _2043;
                _2015 = true;
            }
            else
            {
                _1985 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2015 = false;
    float _2045 = _1985;
    float _2047 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2049 = _1903 + _2047;
    float _2051 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2053 = _1909 + _2051;
    float _2055 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2057 = _1911 + _2055;
    float _2059 = fma(_2049, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2061 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2063 = fma(_2057, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2065 = -_1319;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2059);
    float _2069 = -_1323;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2073 = -_1341;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2063);
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2079 = _2067 + _2077;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2083 = _2071 + _2081;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2087 = _2075 + _2085;
    float _2089 = _2079 * _2079;
    float _2091 = fma(_2083, _2083, _2089);
    float _2093 = fma(_2087, _2087, _2091);
    float _2095 = rsqrt(_2093);
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2099 = _2083 * _2097;
    float _2101 = _2087 * _2097;
    float _2103 = _2099 * _2099;
    float _2105 = _2101 * _2101;
    float _2107 = _2103 + _2105;
    float _2109 = sqrt(_2107);
    bool _2111 = _2109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2115 = _2109 + _2113;
    float _2117 = _1953;
    float _2119 = _2107;
    float _2121 = _2115;
    float _2123 = _2079;
    float _2125 = _2097;
    float _2127 = _2099;
    if (_2111)
    {
        float _2129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2117 = _2129;
    }
    float _2131 = _2117;
    if (_2111)
    {
        float _2133 = rsqrt(_2107);
        _2119 = _2133;
    }
    float _2135 = _2119;
    float _2137 = _2131;
    float _2139 = _2135;
    if (_2111)
    {
        float _2141 = _2115 * _2131;
        _2121 = _2141;
    }
    float _2143 = _2121;
    if (_2111)
    {
        float _2145 = _2143 * 0.15915493667125701904296875;
        _1979 = _2145;
    }
    float _2147 = _1979;
    float _2149 = _2087;
    if (_2111)
    {
        float _2151 = _2147 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        _2149 = _2153;
    }
    float _2155 = _2149;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2159 = precise::max(0.0, _2157);
    float _2161 = _1961;
    float _2163 = _2159;
    if (_2111)
    {
        float _2165 = _2147 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        _2161 = _2167;
    }
    float _2169 = _2161;
    float _2171 = -_2097;
    float _2173 = -_2159;
    float _2175 = fma(_2079, _2171, _2173);
    if (_2111)
    {
        float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2177;
    }
    float _2179 = _2123;
    float _2181 = sqrt(_2093);
    float _2183 = _2155;
    float _2185 = _2179;
    if (_2111)
    {
        float _2187 = fma(_2155, _2179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2183 = _2187;
    }
    float _2189 = _2183;
    float _2191 = _2189;
    if (!_2111)
    {
        _2185 = _2101;
    }
    float _2193 = _2185;
    float _2195 = _2193;
    if (_2111)
    {
        float _2197 = _2169 + (-1.0);
        _2163 = _2197;
    }
    float _2199 = _2163;
    float _2201 = _2199;
    if (_2111)
    {
        float _2203 = _2135 * _2189;
        _2125 = _2203;
    }
    float _2205 = _2125;
    if (!_2111)
    {
        _2191 = _2175;
    }
    float _2207 = _2191;
    float _2209 = _2207;
    if (_2111)
    {
        float _2211 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2137 = _2211;
    }
    float _2213 = _2137;
    if (_2111)
    {
        float _2215 = _2099 * _2205;
        _2127 = _2215;
    }
    float _2217 = _2127;
    if (!_2111)
    {
        _2139 = _2103;
    }
    float _2219 = _2139;
    float _2221 = _2219;
    if (_2111)
    {
        float _2223 = _2101 * _2205;
        _2195 = _2223;
    }
    float _2225 = _2195;
    if (_2111)
    {
        float _2227 = fma(_2175, _2169, _2213);
        _2209 = _2227;
    }
    float _2229 = _2209;
    if (_2111)
    {
        float _2231 = _2217 * _2217;
        _2221 = _2231;
    }
    float _2233 = _2221;
    if (!_2111)
    {
        _2201 = _2105;
    }
    float _2235 = _2201;
    float _2237 = _2235;
    if (_2111)
    {
        float _2239 = _2225 * _2225;
        _2237 = _2239;
    }
    float _2241 = _2237;
    float _2243 = fma(_2229, _2229, _2233);
    float _2245 = _2243 + _2241;
    float _2247 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2251 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2249);
    float _2253 = precise::clamp(_2251, 0.0, 1.0);
    float _2255 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2257 = rsqrt(_2245);
    float _2259 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2247);
    float _2261 = -_2253;
    float _2263 = _2261 + 1.0;
    float _2265 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2267 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2269 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2259);
    float _2271 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2273 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2265);
    float _2275 = abs(_2263);
    float _2277 = log2(_2275);
    float _2279 = _2269 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2281 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2267);
    float _2283 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2273);
    float _2285 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2271);
    float _2287 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2289 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2281);
    float _2291 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2293 = _2257 * _2217;
    float _2295 = _2257 * _2229;
    float _2297 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2301 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2303 = _2257 * _2225;
    float _2305 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2285);
    float _2307 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2299);
    float _2309 = -_2301;
    float _2311 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2309);
    float _2313 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2315 = -_2287;
    float _2317 = fma(_2315, _2255, 1.0);
    float _2319 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2321 = -_2303;
    float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2311);
    float _2325 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2307);
    float _2327 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2329 = exp2(_2313);
    float _2331 = fma(_2323, -0.5, 0.5);
    float _2333 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2325);
    float _2335 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2337 = fma(_2323, 0.5, 0.5);
    float _2339 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2327);
    float _2341 = _2295 + 1.0;
    float _2343 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2335);
    float _2345 = log2(_2317);
    float _2347 = fma(_2337, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2349 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2339);
    float _2351 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2343);
    float _2353 = fma(_2337, _2347, -0.212114393711090087890625);
    float _2355 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2349);
    float _2357 = 1.0 / _2333;
    float _2359 = -_2295;
    float _2361 = fma(_2329, _2341, _2359);
    float _2363 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2351);
    float _2365 = fma(_2337, _2353, 1.570728778839111328125);
    float _2367 = sqrt(_2331);
    float _2369 = _2345 * 0.693147182464599609375;
    float _2371 = _2355 * _2357;
    float _2373 = _2363 * _2357;
    float _2375 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2377 = fma(_2361, 0.5, 0.5);
    float _2379 = fma(_2371, 0.5, 0.5);
    float _2381 = fma(_2373, -0.5, 0.5);
    float _2383 = _2367 * 0.636619746685028076171875;
    float _2385 = -_2365;
    float _2387 = fma(_2383, _2385, 1.0);
    float3 _6294 = float3(_2379, _2381, _2375);
    float _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6294, float3(0.0), isnan(_6294)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6294, float3(0.0), isnan(_6294)), level(0.0)).x;
    float3 _6305 = float3(_2379, _2381, _2375);
    float4 _2392 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6305, float3(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6305, float3(0.0), isnan(_6305)), level(0.0)).xyzw;
    float _2394 = _2392.x;
    float _2396 = _2392.y;
    float _2398 = _2392.z;
    float _2400 = _2392.w;
    float2 _6322 = float2(_2387, _2377);
    float3 _2404 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6322, float2(0.0), isnan(_6322)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6322, float2(0.0), isnan(_6322)), level(0.0)).xyz;
    float _2406 = _2404.x;
    float _2408 = _2404.y;
    float _2410 = _2404.z;
    float _2412 = -_1319;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1155);
    float _2416 = -_1323;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _2420 = -_1341;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _2424 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2426 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2424);
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2430 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2426);
    float _2432 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2428);
    float _2434 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2436 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2432);
    float _2438 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2440 = 1.0 / _2434;
    bool _2442 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan(0.5);
    bool _2450 = _2446 || _2448;
    float _2452 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2454 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2456 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2438);
    float _2458 = _2454 + _2434;
    float _2460 = exp2(_2452);
    float _2462 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2456);
    float _2464 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2462);
    float _2466 = _2458 * _2440;
    float _2468 = _2466 * 0.5;
    float _2470 = _2458;
    if (_2450)
    {
        _2470 = 1.0;
    }
    float _2472 = _2470;
    float _2474 = _2472;
    if (!_2450)
    {
        float _2476 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2480 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2478);
        float _2482 = _2476 * 0.15915493667125701904296875;
        float _2484 = _2482 * 6.283185482025146484375;
        float _2486 = cos(_2484);
        float _2488 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2490 = _2488 * 0.15915493667125701904296875;
        float _2492 = _2482 * 6.283185482025146484375;
        float _2494 = sin(_2492);
        float _2496 = 1.0 / _2486;
        float _2498 = _2490 * 6.283185482025146484375;
        float _2500 = cos(_2498);
        float _2502 = _2494 * _2496;
        float _2504 = 1.0 / _2480;
        float _2506 = _2500 * _2502;
        float _2508 = _2490 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2514 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2512;
        float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2518 = _2504 * _2516;
        float _2520 = 1.0 / _2506;
        float _2522 = 1.0 / _2514;
        float _2524 = _2510 * _2520;
        float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2528 = fma(_2524, _2518, _2526);
        float _2530 = _2528 * _2522;
        float _2532 = precise::clamp(_2530, 0.0, 1.0);
        _2474 = _2532;
    }
    float _2534 = _2474;
    float _2536 = -_2460;
    float _2538 = _2536 + 1.0;
    float _2540 = _2333 * 0.5;
    bool _2542 = _2534 > 0.0;
    bool _2544 = isnan(_2534);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2534 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2554 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2556 = fma(_2363, -0.5, _2540);
    float _2558 = _2464 + _2333;
    float _2560 = _2355 + _2333;
    float _2562 = _2554 * _2389;
    float _2564 = -_2554;
    float _2566 = _2564 + 1.0;
    float _2568 = _2558 * 0.5;
    float _2570 = _2400 * _2562;
    float _2572 = _2410 * _2562;
    float _2574 = _2400 * _2566;
    float _2576 = _2560 * 0.5;
    float _2578 = _2552 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2406, _2570, _2394);
    float _2582 = fma(_2408, _2570, _2396);
    float _2584 = fma(_2400, _2572, _2398);
    out.gl_Position.x = _2355;
    out.gl_Position.y = _2363;
    out.gl_Position.z = _2464;
    out.gl_Position.w = _2333;
    out.m_68.x = _2576;
    out.m_68.y = _2556;
    out.m_68.z = _2568;
    out.m_68.w = _2333;
    out.m_47.x = _2578;
    out.m_70.x = _2580;
    out.m_70.y = _2582;
    out.m_70.z = _2584;
    out.m_70.w = _2574;
    if (_2550)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2015 = false;
    bool _745 = false;
    bool _625 = false;
    bool _475 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2645 = as_type<float>(_107);
        out.gl_Position.z = _2645;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _125;
    if (_121)
    {
        float _133 = float(_89);
        _101 = _133;
    }
    float _135 = _101;
    bool _137 = _125 >= _135;
    bool _139 = !_121;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _109 = as_type<int>(_147);
    }
    int _149 = _109;
    float _151 = as_type<float>(_149);
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2717 = as_type<float>(_149);
        out.gl_Position.z = _2717;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _159;
    if (!_169)
    {
        float _173 = _159 * _159;
        float _175 = _173 * 0.5;
        _151 = _175;
    }
    float _177 = _151;
    float _179 = 0.0;
    float _181 = _177;
    if (!_169)
    {
        float _183 = _125 * _125;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_169)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_169;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _159 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _159);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _127 = _211;
        _195 = _225;
        _129 = _213;
    }
    float _227 = _127;
    float _229 = _195;
    float _231 = _129;
    bool _233 = !_169;
    float _235 = _227;
    float _237 = _231;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _159 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _235 = _251;
        _237 = _245;
        _171 = _257;
    }
    float _259 = _235;
    float _261 = _237;
    float _263 = _171;
    float _265 = _261;
    float _267 = _259;
    if (!_169)
    {
        _265 = _125;
    }
    float _269 = _265;
    float _271 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _269;
    if (!_169)
    {
        float _275 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _275;
    }
    float _277 = _267;
    bool _279 = !_169;
    float _281 = _277;
    if (!_279)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _125 * _285;
        float _291 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _293 = _291 + 1.0;
        float _295 = 1.0 / _293;
        float _297 = _287 * 0.693147182464599609375;
        float _299 = exp2(_289);
        float _301 = 1.0 / _297;
        float _303 = _299 + (-1.0);
        float _305 = -_303;
        float _307 = fma(_305, _301, _125);
        float _309 = _307 * _295;
        float _311 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _311;
    }
    float _313 = _281;
    bool _315 = !_169;
    if (!_315)
    {
        float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = log2(_317);
        float _321 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _323 = _321 + 1.0;
        float _325 = 1.0 / _323;
        float _327 = _125 * _319;
        float _329 = exp2(_327);
        float _331 = -_329;
        float _333 = _331 + 1.0;
        float _335 = _333 * _325;
        _273 = _335;
    }
    float _337 = _273;
    float _339 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = fma(_263, _155, _271);
    float _343 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _347 = fma(_337, _155, _339);
    float _349 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = fma(_263, _153, _343);
    float _355 = fma(_337, _153, _345);
    float _357 = -_347;
    float _359 = _341 + _357;
    float _361 = fma(_263, _157, _349);
    float _363 = fma(_337, _157, _351);
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _359 * _359;
    float _371 = in.m_51.w;
    float _373 = -_363;
    float _375 = _361 + _373;
    float _377 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _379 = fma(_367, _367, _369);
    float _381 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _383 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _385 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _377);
    float _387 = fma(_375, _375, _379);
    float _389 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _381);
    float _391 = in.m_44.x;
    float _393 = in.m_44.y;
    float _395 = in.m_44.z;
    float _397 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _399 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _383);
    float _401 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].z, _389);
    float _403 = sqrt(_387);
    float _405 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].z, _399);
    bool _407 = _403 >= 9.9999999747524270787835121154785e-07;
    bool _409 = isnan(_403);
    bool _411 = _407 || _409;
    bool _413 = isnan(9.9999999747524270787835121154785e-07);
    bool _415 = _411 || _413;
    float _417 = fma(_353, _371, _391);
    float _419 = fma(_341, _371, _393);
    float _421 = fma(_361, _371, _395);
    float _423 = _371;
    float _425 = _341;
    float _427 = _405;
    if (_415)
    {
        _423 = _397;
    }
    float _429 = _423;
    float _431 = _429;
    if (_415)
    {
        _425 = _401;
    }
    float _433 = _425;
    float _435 = _433;
    if (!_415)
    {
        bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _439 = !_437;
        if (!_439)
        {
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _451);
            float _459 = _453 * _453;
            float _461 = fma(_455, _455, _459);
            float _463 = fma(_457, _457, _461);
            float _465 = rsqrt(_463);
            float _467 = _465 * 9.9999999747524270787835121154785e-07;
            float _469 = _455 * _467;
            float _471 = _453 * _467;
            float _473 = _457 * _467;
            _435 = _471;
            _431 = _469;
            _427 = _473;
            _475 = true;
        }
        else
        {
            float _477 = _155 * _155;
            float _479 = fma(_153, _153, _477);
            float _481 = fma(_157, _157, _479);
            float _483 = sqrt(_481);
            bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
            bool _487 = isnan(_483);
            bool _489 = _485 || _487;
            bool _491 = isnan(9.9999999747524270787835121154785e-07);
            bool _493 = _489 || _491;
            if (!_493)
            {
                float _495 = _393 * _393;
                float _497 = fma(_391, _391, _495);
                float _499 = fma(_395, _395, _497);
                float _501 = sqrt(_499);
                bool _503 = _501 >= 9.9999999747524270787835121154785e-07;
                bool _505 = isnan(_501);
                bool _507 = _503 || _505;
                bool _509 = isnan(9.9999999747524270787835121154785e-07);
                bool _511 = _507 || _509;
                if (!_511)
                {
                    float _513 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _513);
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _515);
                    float _519 = rsqrt(_517);
                    float _521 = _519 * 9.9999999747524270787835121154785e-07;
                    float _523 = _521 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _521 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _521 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _435 = _525;
                    _431 = _523;
                    _427 = _527;
                    _475 = true;
                }
                else
                {
                    float _529 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _533 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _535 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _529);
                    float _537 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _531);
                    float _539 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
                    float _541 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _535);
                    float _543 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _537);
                    float _545 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
                    float _547 = _541 * _541;
                    float _549 = fma(_543, _543, _547);
                    float _551 = fma(_545, _545, _549);
                    float _553 = rsqrt(_551);
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    float _557 = _543 * _555;
                    float _559 = _541 * _555;
                    float _561 = _545 * _555;
                    _435 = _559;
                    _431 = _557;
                    _427 = _561;
                    _475 = true;
                }
            }
            else
            {
                float _563 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _565 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _567 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _569 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _565);
                float _573 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
                float _575 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _569);
                float _577 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _571);
                float _579 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _573);
                float _581 = _575 * _575;
                float _583 = fma(_577, _577, _581);
                float _585 = fma(_579, _579, _583);
                float _587 = rsqrt(_585);
                float _589 = _587 * 9.9999999747524270787835121154785e-07;
                float _591 = _577 * _589;
                float _593 = _575 * _589;
                float _595 = _579 * _589;
                _435 = _593;
                _431 = _591;
                _427 = _595;
            }
        }
    }
    _475 = false;
    float _597 = _435;
    float _599 = _431;
    float _601 = _427;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _605 = !_603;
    float _623;
    if (!_605)
    {
        float _607 = in.m_53.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _623 = _621;
        _625 = true;
    }
    else
    {
        float _627 = float(_89);
        float _629 = 1.0 / _627;
        float _631 = _125 * _629;
        _623 = _631;
    }
    _625 = false;
    float _633 = _623;
    bool _635 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_633);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _651 = _633 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_633);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _633 + _667;
    float _671 = -_645;
    float _673 = _671 + 1.0;
    float _675 = 1.0 / _649;
    float _677 = _661 * _673;
    float _679 = -_661;
    float _681 = _679 + 1.0;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _691 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _695 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _665 * _675;
    float _703 = fma(_701, _669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = _703 * _677;
    float _707 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _709 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[116].x, _707);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _713 = _709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_55.x = _691;
    out.m_55.y = _695;
    out.m_55.z = _697;
    out.m_55.w = _713;
    float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _719;
    out.m_57.y = _721;
    out.m_57.z = _699;
    out.m_57.w = _711;
    bool _723 = !_687;
    float _725 = _675;
    float _743;
    if (!_723)
    {
        float _727 = in.m_53.x;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _731 = _727 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[14].x, _125);
        float _735 = _733 * _729;
        float _737 = floor(_735);
        float _739 = -_737;
        float _741 = _735 + _739;
        _743 = _741;
        _745 = true;
    }
    else
    {
        float _747 = float(_89);
        float _749 = 1.0 / _747;
        float _751 = _125 * _749;
        _97 = _747;
        _743 = _751;
    }
    _745 = false;
    float _753 = _97;
    float _755 = _743;
    float _757 = in.m_53.z;
    bool _759 = _417 > 0.0;
    float _761 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _763 = log2(_761);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _767 = _765 != 0;
    float _769 = in.m_53.x;
    bool _771 = _417 >= 0.0;
    bool _773 = isnan(_417);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _783 = as_type<float>(int(gl_VertexIndex));
    int _785 = _779 ? 0 : 1;
    float _787 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _781);
    float _789 = in.m_53.w;
    int _791 = ~_785;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    int _797 = _795;
    if (!_759)
    {
        int _799 = ~_785;
        int _801 = _799 + 1;
        _797 = _801;
    }
    int _803 = _797;
    float _805 = _753;
    if (!_767)
    {
        float _807 = in.m_53.y;
        _805 = _807;
    }
    float _809 = _805;
    float _811 = _757 * 2.0;
    float _813 = _769 * 2.0;
    float _815 = floor(_811);
    int _817 = as_type<int>(_783) & 1;
    bool _819 = _817 != 0;
    int _821 = as_type<int>(_783) & 2;
    bool _823 = _821 != 0;
    bool _825 = _789 > 0.5;
    float _827 = _763 * _125;
    float _829 = floor(_813);
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_767)
    {
        _725 = _809;
    }
    float _833 = _725;
    float _835 = _833;
    float _837 = _809;
    if (_767)
    {
        float _839 = in.m_53.x;
        float _841 = in.m_53.y;
        _835 = _839;
        _837 = _841;
    }
    float _843 = _835;
    float _845 = _837;
    bool _847 = _815 >= 0.0;
    bool _849 = isnan(_815);
    bool _851 = _847 || _849;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    float _857 = exp2(_827);
    bool _859 = _815 > 0.0;
    int _861 = _855 ? 0 : 1;
    bool _863 = _829 > 0.0;
    bool _865 = _829 >= 0.0;
    bool _867 = isnan(_829);
    bool _869 = _865 || _867;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _877 = ~_861;
    int _879 = _877 + 1;
    int _881 = _879 + 1;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _885 = _881;
    if (!_767)
    {
        _831 = _757;
    }
    float _887 = _831;
    float _889 = _887;
    if (!_859)
    {
        int _891 = ~_861;
        int _893 = _891 + 1;
        _885 = _893;
    }
    int _895 = _885;
    float _897 = -_857;
    float _899 = _897 + 1.0;
    float _901 = float(_895);
    float _903 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[83].z, _875);
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _907 = _845 * 2.0;
    float _909 = _843 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_767)
    {
        _889 = _845;
    }
    float _911 = _889;
    bool _913 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _915 = isnan(1.0);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _921 = _917 || _919;
    float _923 = floor(_907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _927 = 1.0 + _925;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[83].w, _905);
    float _931 = -_883;
    float _933 = fma(_909, 2.0, _931);
    float _935 = _911;
    if (!_767)
    {
        _935 = _757;
    }
    float _937 = _935;
    float _939 = -_125;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[81].x, _933);
    float _943 = 1.0 / _927;
    float _945 = _937;
    if (_767)
    {
        _945 = _845;
    }
    float _947 = _945;
    float _949 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _929);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _953 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _961 = _957 || _959;
    float _963 = _947 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _965 = _873 ? 0 : 1;
    float _967 = _961 ? _899 : 0.0;
    float _969 = fma(_963, -2.0, _951);
    int _971 = ~_965;
    int _973 = _971 + 1;
    int _975 = _973 + 1;
    bool _977 = _923 > 0.0;
    float _979 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _969);
    int _981 = _975;
    if (!_863)
    {
        int _983 = ~_965;
        int _985 = _983 + 1;
        _981 = _985;
    }
    int _987 = _981;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _993 = _923 >= 0.0;
    bool _995 = isnan(_923);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _903);
    if (_921)
    {
        float _1005 = _967 * _943;
        _131 = _1005;
    }
    float _1007 = _131;
    float _1009 = 1.0 / _991;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1015 = _1001 ? 0 : 1;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1027 = _1025 != 0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1033 = 1.0 / _1013;
    int _1035 = ~_1015;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _1039;
    if (!_977)
    {
        int _1043 = ~_1015;
        int _1045 = _1043 + 1;
        _1041 = _1045;
    }
    int _1047 = _1041;
    bool _1049 = !_819;
    float _1051 = _1049 ? (-0.5) : 0.5;
    float _1053 = 1.0 / _1031;
    bool _1055 = !_1019;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1063 = !_1023;
    int _1065 = _1063 ? 0 : 1;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1069 = _1067 != 0;
    int _1071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1073 = _1071 != 0;
    float _1075 = 1.0 / _1061;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1079 = _1077 != 0;
    float _1081 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1085 = _1083 != 0;
    float _1087 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1093 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1081);
    float _1095 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1087);
    float _1097 = 1.0 / _1091;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1103;
    float _1107 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1095);
    float _1109 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1093);
    float _1111 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _787);
    float _1113 = _597 * _597;
    float _1115 = _1105 * _1009;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1121 = fma(_599, _599, _1113);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1127 = 1.0 / _1101;
    float _1129 = _1119 * _1033;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1139 = _1125 * _1075;
    float _1141 = _1133 * _1053;
    float _1143 = fma(_601, _601, _1121);
    float _1145 = 1.0 / _1137;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1153 = _755 + _1151;
    float _1155 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1159 = _1157 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1161 = _1149 * _1097;
    float _1163 = fma(_1115, _1153, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1165 = rsqrt(_1143);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1167;
    float _1171 = _769 + _757;
    float _1173 = float(_987);
    float _1175 = _1107 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1177 = _1159 * _1127;
    float _1179 = _1171 + (-1.0);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1183 = _755 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1187 = _755 + _1185;
    float _1189 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1191 = abs(_1065);
    float _1193 = fma(_1129, _1183, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1195 = fma(_1141, _1187, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1197 = _757 + _845;
    float _1199 = float(_1191);
    float _1201 = _1165 * _599;
    float _1203 = _1165 * _597;
    float _1205 = _1165 * _601;
    int _1207 = abs(_1057);
    float _1209 = _1197 + (-1.0);
    float _1211 = in.m_62.x;
    float _1213 = in.m_62.y;
    float _1215 = in.m_62.z;
    float _1217 = _1199 * _1173;
    float _1219 = float(_1207);
    float _1221 = _1111 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1225 = _1175 + _1223;
    float _1227 = _1169 * _1145;
    float _1229 = _769 + _845;
    float _1231 = _1219 * _901;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1235 = _1155 + _1233;
    float _1237 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1241 = _1221 + _1239;
    float _1243 = _1229 + (-1.0);
    float _1245 = _1235 * _1235;
    float _1247 = _1231 * (-2.0);
    float _1249 = _1217 * (-2.0);
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1253 = fma(_1225, _1225, _1245);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1257 = _1205 * _1255;
    float _1259 = float(_1047);
    float _1261 = fma(_1251, _1247, _1251);
    float _1263 = fma(_1241, _1241, _1253);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1267 = _1203 * _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1271 = -_1257;
    float _1273 = fma(_1201, _1269, _1271);
    float _1275 = rsqrt(_1263);
    float _1277 = fma(_1247, _1211, _1211);
    bool _1279 = !_1027;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1285 = _1201 * _1283;
    bool _1287 = _769 > 0.5;
    float _1289 = _769 + (-0.5);
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1293 = -_1267;
    float _1295 = fma(_1205, _1291, _1293);
    float _1297 = _1273 * _1273;
    int _1299 = abs(_1281);
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1277);
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1305 = -_1285;
    float _1307 = fma(_1203, _1303, _1305);
    float _1309 = fma(_1295, _1295, _1297);
    float _1311 = fma(_1237, _1249, _1237);
    float _1313 = fma(_1249, _1213, _1213);
    float _1315 = fma(_1261, _1007, _1301);
    float _1317 = float(_1299);
    float _1319 = _1235 * _1275;
    float _1321 = _845 + (-0.5);
    float _1323 = _1225 * _1275;
    float _1325 = _1315 * 0.15915493667125701904296875;
    float _1327 = -_1319;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1331 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1313);
    float _1333 = -_1323;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1225);
    float _1337 = _1317 * _1259;
    float _1339 = _1329 * _1329;
    float _1341 = _1241 * _1275;
    float _1343 = fma(_1307, _1307, _1309);
    float _1345 = _1337 * (-2.0);
    float _1347 = fma(_1335, _1335, _1339);
    float _1349 = fma(_1311, _1007, _1331);
    float _1351 = -_1341;
    float _1353 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1355 = in.m_51.x;
    float _1357 = in.m_51.y;
    float _1359 = rsqrt(_1343);
    float _1361 = fma(_1353, _1353, _1347);
    float _1363 = fma(_1345, _1215, _1215);
    bool _1365 = !_823;
    float _1367 = _1365 ? (-0.5) : 0.5;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1371 = _755 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1375 = _1373 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _1377 = _757 > 0.5;
    float _1379 = _757 + (-0.5);
    float _1381 = float(_803);
    float _1383 = _1325 * 6.283185482025146484375;
    float _1385 = sin(_1383);
    float _1387 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1363);
    float _1389 = fma(_1139, _1371, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1391 = 0.0 + _1381;
    float _1393 = precise::clamp(_1391, 0.0, 1.0);
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1397 = _755 + _1395;
    float _1399 = _1295 * _1359;
    float _1401 = sqrt(_1361);
    float _1403 = fma(_1393, _1375, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1405 = fma(_1189, _1345, _1189);
    float _1407 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1051);
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1411 = _1403 + _1409;
    float _1413 = fma(_1405, _1007, _1387);
    float _1415 = fma(_1161, _1397, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1417 = _1325 * 6.283185482025146484375;
    float _1419 = cos(_1417);
    float _1421 = abs(_1381);
    float _1423 = fma(_1421, _1411, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1425 = _1413 * 0.15915493667125701904296875;
    float _1427 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1429 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1433 = _755 + _1431;
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1367);
    float _1437 = _1423 * _1427;
    float _1439 = _1425 * 6.283185482025146484375;
    float _1441 = cos(_1439);
    float _1443 = _1349 * 0.15915493667125701904296875;
    float _1445 = _1275 * _1401;
    float _1447 = _1423 * _1429;
    float _1449 = _1437 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1451 = fma(_1177, _1433, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1453 = _1307 * _1359;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = _1443 * 6.283185482025146484375;
    float _1459 = sin(_1457);
    float _1461 = _1449 * _1445;
    float _1463 = _1455 * _1445;
    float _1465 = _1273 * _1359;
    float _1467 = _1461 * _1407;
    float _1469 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1471 = _1469 * 0.5;
    float _1473 = _1463 * _1435;
    float _1475 = _1443 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    float _1479 = _1385 * _1441;
    float _1481 = _1425 * 6.283185482025146484375;
    float _1483 = sin(_1481);
    float _1485 = _1385 * _1459;
    float _1487 = _1419 * _1459;
    float _1489 = _1459 * _1441;
    float _1491 = _1419 * _1477;
    float _1493 = _1385 * _1477;
    float _1495 = _1477 * _1441;
    float _1497 = _1419 * _1441;
    float _1499 = _1497 * _1201;
    float _1501 = fma(_1483, _1491, _1485);
    float _1503 = -_1493;
    float _1505 = fma(_1483, _1487, _1503);
    float _1507 = fma(_1483, _1485, _1491);
    float _1509 = _1203 * _1453;
    float _1511 = _1501 * _1201;
    float _1513 = _1505 * _1201;
    float _1515 = -_1487;
    float _1517 = fma(_1483, _1493, _1515);
    float _1519 = -_1509;
    float _1521 = fma(_1205, _1465, _1519);
    float _1523 = fma(_1495, _1399, _1511);
    float _1525 = -_1483;
    float _1527 = fma(_1525, _1399, _1499);
    bool _1529 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1531 = isnan(_755);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = fma(_1489, _1399, _1513);
    float _1543 = _1201 * _1465;
    float _1545 = _1501 * _1205;
    float _1547 = _1497 * _1205;
    float _1549 = _1505 * _1205;
    float _1551 = fma(_1517, _1521, _1523);
    float _1553 = fma(_1479, _1521, _1527);
    bool _1555 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1557 = isnan(_755);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = fma(_1507, _1521, _1541);
    float _1569 = -_1539;
    float _1571 = _1569 + 1.0;
    float _1573 = -_1543;
    float _1575 = fma(_1203, _1399, _1573);
    float _1577 = fma(_1495, _1453, _1545);
    float _1579 = -_1483;
    float _1581 = fma(_1579, _1453, _1547);
    float _1583 = fma(_1489, _1453, _1549);
    bool _1585 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1587 = isnan(_755);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1593 = _1589 || _1591;
    float _1595 = float(_1593);
    float _1597 = _1565 * _1571;
    float _1599 = fma(_1517, _1575, _1577);
    float _1601 = fma(_1479, _1575, _1581);
    float _1603 = -_1565;
    float _1605 = _1603 + 1.0;
    float _1607 = fma(_1507, _1575, _1583);
    float _1609 = _1473 * _1553;
    bool _1611 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1613 = isnan(_755);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = -_1595;
    float _1625 = _1623 + 1.0;
    float _1627 = _1595 * _1605;
    float _1629 = fma(_1467, _1551, _1609);
    float _1631 = _1473 * _1601;
    bool _1633 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1635 = isnan(_755);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1621 * _1625;
    float _1647 = -_1621;
    float _1649 = _1647 + 1.0;
    float _1651 = fma(_1467, _1599, _1631);
    bool _1653 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1655 = isnan(_755);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = fma(_1471, _1567, _1629);
    float _1667 = _1643 * _1649;
    float _1669 = -_1643;
    float _1671 = _1669 + 1.0;
    float _1673 = fma(_1471, _1607, _1651);
    bool _1675 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1677 = isnan(_755);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1175 + _1665;
    float _1689 = _1663 * _1671;
    float _1691 = -_1663;
    float _1693 = _1691 + 1.0;
    float _1695 = _1221 + _1673;
    bool _1697 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1699 = isnan(_755);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    float _1709 = -_1685;
    float _1711 = _1709 + 1.0;
    float _1713 = _1685 * _1693;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1717 = _1687 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1721 = _1695 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1725 = _755 + _1723;
    float _1727 = _1707 * _1711;
    float _1729 = _1717 * _1717;
    float _1731 = _1721 * _1721;
    float _1733 = _1205 * _1399;
    float _1735 = _1163 * _1727;
    float _1737 = fma(_1227, _1725, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1739 = _1729 + _1731;
    float _1741 = -_1051;
    int _1743 = _1377 ? as_type<int>(_1741) : as_type<int>(_1051);
    float _1745 = -_1707;
    float _1747 = _1745 + 1.0;
    float _1749 = -_1051;
    int _1751 = _1287 ? as_type<int>(_1749) : as_type<int>(_1051);
    float _1753 = sqrt(_1739);
    bool _1755 = !_1069;
    float _1757 = _1755 ? _1051 : as_type<float>(_1743);
    float _1759 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1735);
    bool _1761 = !_1079;
    float _1763 = _1761 ? _1051 : as_type<float>(_1751);
    float _1765 = _1497 * _1203;
    float _1767 = -_1733;
    float _1769 = fma(_1201, _1453, _1767);
    float _1771 = _1501 * _1203;
    float _1773 = _1505 * _1203;
    float _1775 = -_1483;
    float _1777 = fma(_1775, _1465, _1765);
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1781 = fma(_1495, _1465, _1771);
    float _1783 = fma(_1193, _1713, _1759);
    float _1785 = fma(_1479, _1769, _1777);
    float _1787 = fma(_1489, _1465, _1773);
    float _1789 = fma(_1517, _1769, _1781);
    bool _1791 = _845 > 0.5;
    float _1793 = _1473 * _1785;
    bool _1795 = _1753 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1797 = fma(_1195, _1689, _1783);
    float _1799 = fma(_1507, _1769, _1787);
    float _1801 = fma(_1467, _1789, _1793);
    float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1805 = -_1367;
    int _1807 = _1791 ? as_type<int>(_1805) : as_type<int>(_1367);
    float _1809 = fma(_1389, _1667, _1797);
    float _1811 = fma(_1471, _1799, _1801);
    float _1813 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1815 = -_1367;
    int _1817 = _825 ? as_type<int>(_1815) : as_type<int>(_1367);
    float _1819 = _1757 + 0.5;
    float _1821 = _1155 + _1811;
    float _1823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1825 = !_1073;
    float _1827 = _1825 ? _1367 : as_type<float>(_1817);
    float _1829 = fma(_1813, _1819, _941);
    bool _1831 = !_1085;
    float _1833 = _1831 ? _1367 : as_type<float>(_1807);
    float _1835 = fma(_1415, _1645, _1809);
    float _1837 = _1367;
    float _1839 = _1729;
    float _1841 = _1731;
    float _1843 = _1687;
    float _1845 = _1695;
    if (!_1795)
    {
        _1837 = _1821;
    }
    float _1847 = _1837;
    bool _1849 = !_1795;
    float _1851 = _1847;
    float _1853 = _1823;
    if (!_1849)
    {
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1859 = _1753 + _1857;
        float _1861 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1863 = rsqrt(_1739);
        float _1865 = _1859 * _1855;
        float _1867 = _1865 * 0.15915493667125701904296875;
        float _1869 = _1867 * 6.283185482025146484375;
        float _1871 = sin(_1869);
        float _1873 = _1867 * 6.283185482025146484375;
        float _1875 = cos(_1873);
        float _1877 = fma(_1871, _1861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1879 = _1863 * _1877;
        float _1881 = _1875 + (-1.0);
        float _1883 = fma(_1717, _1879, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1885 = fma(_1721, _1879, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1887 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1891 = _1883 + _1889;
        float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1895 = _1885 + _1893;
        float _1897 = fma(_1821, _1875, _1887);
        float _1899 = _1891 * _1891;
        float _1901 = _1895 * _1895;
        _1851 = _1897;
        _1839 = _1899;
        _1841 = _1901;
        _1843 = _1883;
        _1845 = _1885;
    }
    float _1903 = _1851;
    float _1905 = _1839;
    float _1907 = _1841;
    float _1909 = _1843;
    float _1911 = _1845;
    float _1913 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1915 = _1903 + _1913;
    float _1917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1919 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1921 = _1827 + (-0.5);
    float _1923 = fma(_1915, _1915, _1905);
    float _1925 = fma(_1451, _1627, _1835);
    float _1927 = _1763 + 0.5;
    float _1929 = -_1833;
    float _1931 = _1929 + 0.5;
    float _1933 = _1923 + _1907;
    float _1935 = -_1919;
    float _1937 = -_979;
    float _1939 = fma(_1935, _1921, _1937);
    float _1941 = fma(_1737, _1597, _1925);
    float _1943 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1945 = -_1003;
    float _1947 = _1945 + 1.0;
    float _1949 = -_949;
    float _1951 = _1949 + 1.0;
    float _1953 = sqrt(_1933);
    float _1955 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1957 = _1943 * _1823;
    float _1959 = -_1947;
    float _1961 = fma(_1757, _1959, _1829);
    float _1963 = fma(_1827, _1951, _1939);
    float _1965 = _1955 * _1917;
    float _1967 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1941);
    out.m_64.x = _1957;
    out.m_64.y = _1965;
    out.m_64.z = _1961;
    out.m_64.w = _1963;
    out.m_66.x = _1967;
    bool _1969 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1971 = isnan(_1953);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1977 = _1973 || _1975;
    float _1979 = _1931;
    if (!_1977)
    {
        _1853 = 1.0;
    }
    float _1981 = _1853;
    bool _1983 = !_1977;
    float _1985 = _1981;
    if (!_1983)
    {
        bool _1987 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1989 = isnan(_1953);
        bool _1991 = _1987 || _1989;
        bool _1993 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1995 = _1991 || _1993;
        if (!_1995)
        {
            float _1997 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1999 = _1953 + _1997;
            float _2001 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2003 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2001;
            float _2005 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2009 = 1.0 / _2003;
            float _2011 = _1999 * _2009;
            float _2013 = fma(_2011, _2007, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1985 = _2013;
            _2015 = true;
        }
        else
        {
            bool _2017 = _1953 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2019 = isnan(_1953);
            bool _2021 = _2017 || _2019;
            bool _2023 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2025 = _2021 || _2023;
            if (!_2025)
            {
                float _2027 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2029 = _1953 + _2027;
                float _2031 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2033 = _2031 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2035 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2037 = _2035 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2039 = 1.0 / _2033;
                float _2041 = _2029 * _2039;
                float _2043 = fma(_2041, _2037, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1985 = _2043;
                _2015 = true;
            }
            else
            {
                _1985 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2015 = false;
    float _2045 = _1985;
    float _2047 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2049 = _1903 + _2047;
    float _2051 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2053 = _1909 + _2051;
    float _2055 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2057 = _1911 + _2055;
    float _2059 = fma(_2049, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2061 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2063 = fma(_2057, _2045, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2065 = -_1319;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2059);
    float _2069 = -_1323;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2061);
    float _2073 = -_1341;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2063);
    float _2077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2079 = _2067 + _2077;
    float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2083 = _2071 + _2081;
    float _2085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2087 = _2075 + _2085;
    float _2089 = _2079 * _2079;
    float _2091 = fma(_2083, _2083, _2089);
    float _2093 = fma(_2087, _2087, _2091);
    float _2095 = rsqrt(_2093);
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2099 = _2083 * _2097;
    float _2101 = _2087 * _2097;
    float _2103 = _2099 * _2099;
    float _2105 = _2101 * _2101;
    float _2107 = _2103 + _2105;
    float _2109 = sqrt(_2107);
    bool _2111 = _2109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2115 = _2109 + _2113;
    float _2117 = _1953;
    float _2119 = _2107;
    float _2121 = _2115;
    float _2123 = _2079;
    float _2125 = _2097;
    float _2127 = _2099;
    if (_2111)
    {
        float _2129 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2117 = _2129;
    }
    float _2131 = _2117;
    if (_2111)
    {
        float _2133 = rsqrt(_2107);
        _2119 = _2133;
    }
    float _2135 = _2119;
    float _2137 = _2131;
    float _2139 = _2135;
    if (_2111)
    {
        float _2141 = _2115 * _2131;
        _2121 = _2141;
    }
    float _2143 = _2121;
    if (_2111)
    {
        float _2145 = _2143 * 0.15915493667125701904296875;
        _1979 = _2145;
    }
    float _2147 = _1979;
    float _2149 = _2087;
    if (_2111)
    {
        float _2151 = _2147 * 6.283185482025146484375;
        float _2153 = sin(_2151);
        _2149 = _2153;
    }
    float _2155 = _2149;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2159 = precise::max(0.0, _2157);
    float _2161 = _1961;
    float _2163 = _2159;
    if (_2111)
    {
        float _2165 = _2147 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        _2161 = _2167;
    }
    float _2169 = _2161;
    float _2171 = -_2097;
    float _2173 = -_2159;
    float _2175 = fma(_2079, _2171, _2173);
    if (_2111)
    {
        float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2123 = _2177;
    }
    float _2179 = _2123;
    float _2181 = sqrt(_2093);
    float _2183 = _2155;
    float _2185 = _2179;
    if (_2111)
    {
        float _2187 = fma(_2155, _2179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2183 = _2187;
    }
    float _2189 = _2183;
    float _2191 = _2189;
    if (!_2111)
    {
        _2185 = _2101;
    }
    float _2193 = _2185;
    float _2195 = _2193;
    if (_2111)
    {
        float _2197 = _2169 + (-1.0);
        _2163 = _2197;
    }
    float _2199 = _2163;
    float _2201 = _2199;
    if (_2111)
    {
        float _2203 = _2135 * _2189;
        _2125 = _2203;
    }
    float _2205 = _2125;
    if (!_2111)
    {
        _2191 = _2175;
    }
    float _2207 = _2191;
    float _2209 = _2207;
    if (_2111)
    {
        float _2211 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2137 = _2211;
    }
    float _2213 = _2137;
    if (_2111)
    {
        float _2215 = _2099 * _2205;
        _2127 = _2215;
    }
    float _2217 = _2127;
    if (!_2111)
    {
        _2139 = _2103;
    }
    float _2219 = _2139;
    float _2221 = _2219;
    if (_2111)
    {
        float _2223 = _2101 * _2205;
        _2195 = _2223;
    }
    float _2225 = _2195;
    if (_2111)
    {
        float _2227 = fma(_2175, _2169, _2213);
        _2209 = _2227;
    }
    float _2229 = _2209;
    if (_2111)
    {
        float _2231 = _2217 * _2217;
        _2221 = _2231;
    }
    float _2233 = _2221;
    if (!_2111)
    {
        _2201 = _2105;
    }
    float _2235 = _2201;
    float _2237 = _2235;
    if (_2111)
    {
        float _2239 = _2225 * _2225;
        _2237 = _2239;
    }
    float _2241 = _2237;
    float _2243 = fma(_2229, _2229, _2233);
    float _2245 = _2243 + _2241;
    float _2247 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2251 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2249);
    float _2253 = precise::clamp(_2251, 0.0, 1.0);
    float _2255 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2257 = rsqrt(_2245);
    float _2259 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2247);
    float _2261 = -_2253;
    float _2263 = _2261 + 1.0;
    float _2265 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2267 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2269 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2259);
    float _2271 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2273 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2265);
    float _2275 = abs(_2263);
    float _2277 = log2(_2275);
    float _2279 = _2269 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2281 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2267);
    float _2283 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2273);
    float _2285 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2271);
    float _2287 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2289 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2281);
    float _2291 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2293 = _2257 * _2217;
    float _2295 = _2257 * _2229;
    float _2297 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2299 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2301 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2303 = _2257 * _2225;
    float _2305 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2285);
    float _2307 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2299);
    float _2309 = -_2301;
    float _2311 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2309);
    float _2313 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2315 = -_2287;
    float _2317 = fma(_2315, _2255, 1.0);
    float _2319 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2321 = -_2303;
    float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2311);
    float _2325 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2307);
    float _2327 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2329 = exp2(_2313);
    float _2331 = fma(_2323, -0.5, 0.5);
    float _2333 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2325);
    float _2335 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2337 = fma(_2323, 0.5, 0.5);
    float _2339 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2327);
    float _2341 = _2295 + 1.0;
    float _2343 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2335);
    float _2345 = log2(_2317);
    float _2347 = fma(_2337, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2349 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2339);
    float _2351 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2343);
    float _2353 = fma(_2337, _2347, -0.212114393711090087890625);
    float _2355 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2349);
    float _2357 = 1.0 / _2333;
    float _2359 = -_2295;
    float _2361 = fma(_2329, _2341, _2359);
    float _2363 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2351);
    float _2365 = fma(_2337, _2353, 1.570728778839111328125);
    float _2367 = sqrt(_2331);
    float _2369 = _2345 * 0.693147182464599609375;
    float _2371 = _2355 * _2357;
    float _2373 = _2363 * _2357;
    float _2375 = _2369 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2377 = fma(_2361, 0.5, 0.5);
    float _2379 = fma(_2371, 0.5, 0.5);
    float _2381 = fma(_2373, -0.5, 0.5);
    float _2383 = _2367 * 0.636619746685028076171875;
    float _2385 = -_2365;
    float _2387 = fma(_2383, _2385, 1.0);
    float3 _6294 = float3(_2379, _2381, _2375);
    float _2389 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6294, float3(0.0), isnan(_6294)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6294, float3(0.0), isnan(_6294)), level(0.0)).x;
    float3 _6305 = float3(_2379, _2381, _2375);
    float4 _2392 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6305, float3(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6305, float3(0.0), isnan(_6305)), level(0.0)).xyzw;
    float _2394 = _2392.x;
    float _2396 = _2392.y;
    float _2398 = _2392.z;
    float _2400 = _2392.w;
    float2 _6322 = float2(_2387, _2377);
    float3 _2404 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6322, float2(0.0), isnan(_6322)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6322, float2(0.0), isnan(_6322)), level(0.0)).xyz;
    float _2406 = _2404.x;
    float _2408 = _2404.y;
    float _2410 = _2404.z;
    float _2412 = -_1319;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1155);
    float _2416 = -_1323;
    float _2418 = fma(_2416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _2420 = -_1341;
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _2424 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2426 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2424);
    float _2428 = _2414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2430 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2426);
    float _2432 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2428);
    float _2434 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2436 = fma(_2422, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2432);
    float _2438 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2440 = 1.0 / _2434;
    bool _2442 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan(0.5);
    bool _2450 = _2446 || _2448;
    float _2452 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2454 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2456 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2438);
    float _2458 = _2454 + _2434;
    float _2460 = exp2(_2452);
    float _2462 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2456);
    float _2464 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2462);
    float _2466 = _2458 * _2440;
    float _2468 = _2466 * 0.5;
    float _2470 = _2458;
    if (_2450)
    {
        _2470 = 1.0;
    }
    float _2472 = _2470;
    float _2474 = _2472;
    if (!_2450)
    {
        float _2476 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2480 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2478);
        float _2482 = _2476 * 0.15915493667125701904296875;
        float _2484 = _2482 * 6.283185482025146484375;
        float _2486 = cos(_2484);
        float _2488 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2490 = _2488 * 0.15915493667125701904296875;
        float _2492 = _2482 * 6.283185482025146484375;
        float _2494 = sin(_2492);
        float _2496 = 1.0 / _2486;
        float _2498 = _2490 * 6.283185482025146484375;
        float _2500 = cos(_2498);
        float _2502 = _2494 * _2496;
        float _2504 = 1.0 / _2480;
        float _2506 = _2500 * _2502;
        float _2508 = _2490 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2514 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2512;
        float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2518 = _2504 * _2516;
        float _2520 = 1.0 / _2506;
        float _2522 = 1.0 / _2514;
        float _2524 = _2510 * _2520;
        float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2528 = fma(_2524, _2518, _2526);
        float _2530 = _2528 * _2522;
        float _2532 = precise::clamp(_2530, 0.0, 1.0);
        _2474 = _2532;
    }
    float _2534 = _2474;
    float _2536 = -_2460;
    float _2538 = _2536 + 1.0;
    float _2540 = _2333 * 0.5;
    bool _2542 = _2534 > 0.0;
    bool _2544 = isnan(_2534);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(0.0);
    bool _2550 = _2546 || _2548;
    float _2552 = _2534 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2554 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2556 = fma(_2363, -0.5, _2540);
    float _2558 = _2464 + _2333;
    float _2560 = _2355 + _2333;
    float _2562 = _2554 * _2389;
    float _2564 = -_2554;
    float _2566 = _2564 + 1.0;
    float _2568 = _2558 * 0.5;
    float _2570 = _2400 * _2562;
    float _2572 = _2410 * _2562;
    float _2574 = _2400 * _2566;
    float _2576 = _2560 * 0.5;
    float _2578 = _2552 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2406, _2570, _2394);
    float _2582 = fma(_2408, _2570, _2396);
    float _2584 = fma(_2400, _2572, _2398);
    out.gl_Position.x = _2355;
    out.gl_Position.y = _2363;
    out.gl_Position.z = _2464;
    out.gl_Position.w = _2333;
    out.m_68.x = _2576;
    out.m_68.y = _2556;
    out.m_68.z = _2568;
    out.m_68.w = _2333;
    out.m_47.x = _2578;
    out.m_70.x = _2580;
    out.m_70.y = _2582;
    out.m_70.z = _2584;
    out.m_70.w = _2574;
    if (_2550)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

