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
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1525 = false;
    bool _617 = false;
    bool _467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_103);
        out.gl_Position.z = _2235;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = 0.0;
    float _129 = _121;
    if (_117)
    {
        float _131 = float(_87);
        _123 = _131;
    }
    float _133 = _123;
    bool _135 = _121 >= _133;
    bool _137 = !_117;
    bool _139 = _135 || _137;
    if (_139)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _97;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _105 = as_type<int>(_143);
    }
    int _145 = _105;
    float _147 = as_type<float>(_145);
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2306 = as_type<float>(_145);
        out.gl_Position.z = _2306;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = _155;
    if (!_165)
    {
        float _169 = _155 * _155;
        float _171 = _169 * 0.5;
        _147 = _171;
    }
    float _173 = _147;
    float _175 = 0.0;
    float _177 = _173;
    if (!_165)
    {
        float _179 = _121 * _121;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    if (!_165)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _185;
    }
    float _187 = _177;
    bool _189 = !_165;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _155 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _155);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _125 = _207;
        _191 = _221;
        _127 = _209;
    }
    float _223 = _125;
    float _225 = _191;
    float _227 = _127;
    bool _229 = !_165;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _155 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _167 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _167;
    float _261 = _257;
    float _263 = _255;
    if (!_165)
    {
        _261 = _121;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_165)
    {
        float _271 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_165;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _121 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _121);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_165;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _121 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = fma(_259, _151, _267);
    float _339 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _151, _335);
    float _345 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_259, _149, _339);
    float _351 = fma(_333, _149, _341);
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_259, _153, _345);
    float _359 = fma(_333, _153, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_44.x;
    float _389 = in.m_44.y;
    float _391 = in.m_44.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = sqrt(_383);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    bool _403 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_337, _367, _389);
    float _415 = fma(_349, _367, _387);
    float _417 = fma(_357, _367, _391);
    float _419 = _337;
    float _421 = _401;
    float _423 = _395;
    if (_411)
    {
        _419 = _399;
    }
    float _425 = _419;
    float _427 = _425;
    if (!_411)
    {
        bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _431 = !_429;
        if (!_431)
        {
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
            float _451 = _445 * _445;
            float _453 = fma(_447, _447, _451);
            float _455 = fma(_449, _449, _453);
            float _457 = rsqrt(_455);
            float _459 = _457 * 9.9999999747524270787835121154785e-07;
            float _461 = _447 * _459;
            float _463 = _445 * _459;
            float _465 = _449 * _459;
            _421 = _463;
            _423 = _461;
            _427 = _465;
            _467 = true;
        }
        else
        {
            float _469 = _151 * _151;
            float _471 = fma(_149, _149, _469);
            float _473 = fma(_153, _153, _471);
            float _475 = sqrt(_473);
            bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
            bool _479 = isnan(_475);
            bool _481 = _477 || _479;
            bool _483 = isnan(9.9999999747524270787835121154785e-07);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = _389 * _389;
                float _489 = fma(_387, _387, _487);
                float _491 = fma(_391, _391, _489);
                float _493 = sqrt(_491);
                bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
                bool _497 = isnan(_493);
                bool _499 = _495 || _497;
                bool _501 = isnan(9.9999999747524270787835121154785e-07);
                bool _503 = _499 || _501;
                if (!_503)
                {
                    float _505 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _505);
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _507);
                    float _511 = rsqrt(_509);
                    float _513 = _511 * 9.9999999747524270787835121154785e-07;
                    float _515 = _513 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _513 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _421 = _517;
                    _423 = _515;
                    _427 = _519;
                    _467 = true;
                }
                else
                {
                    float _521 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
                    float _529 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
                    float _531 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
                    float _533 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
                    float _535 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _529);
                    float _537 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _531);
                    float _539 = _533 * _533;
                    float _541 = fma(_535, _535, _539);
                    float _543 = fma(_537, _537, _541);
                    float _545 = rsqrt(_543);
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    float _549 = _535 * _547;
                    float _551 = _533 * _547;
                    float _553 = _537 * _547;
                    _421 = _551;
                    _423 = _549;
                    _427 = _553;
                    _467 = true;
                }
            }
            else
            {
                float _555 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _557 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _559 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _555);
                float _563 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _557);
                float _565 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _559);
                float _567 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
                float _569 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
                float _573 = _567 * _567;
                float _575 = fma(_569, _569, _573);
                float _577 = fma(_571, _571, _575);
                float _579 = rsqrt(_577);
                float _581 = _579 * 9.9999999747524270787835121154785e-07;
                float _583 = _569 * _581;
                float _585 = _567 * _581;
                float _587 = _571 * _581;
                _421 = _585;
                _423 = _583;
                _427 = _587;
            }
        }
    }
    _467 = false;
    float _589 = _421;
    float _591 = _423;
    float _593 = _427;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _597 = !_595;
    float _615;
    if (!_597)
    {
        float _599 = in.m_53.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_87);
        float _621 = 1.0 / _619;
        float _623 = _121 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = in.m_53.z;
    float _629 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _631 = log2(_629);
    float _633 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _635 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _637 = in.m_53.x;
    float _639 = in.m_53.y;
    float _641 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _643 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _633);
    float _645 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _635);
    float _647 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _649 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    float _651 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _645);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _663 = _661 != 0;
    float _665 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _667 = _649 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _667 + _669;
    float _673 = _627 * 2.0;
    float _675 = floor(_673);
    float _677 = _637 * 2.0;
    float _679 = _639 * 2.0;
    float _681 = _639 + _627;
    float _683 = _627 + _637;
    float _685 = _637 + (-0.5);
    float _687 = _627 + (-0.5);
    float _689 = _681 + (-1.0);
    float _691 = floor(_677);
    float _693 = _683 + (-1.0);
    float _695 = _631 * _121;
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _699 = _639 + _637;
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _703 = _675 > 0.0;
    float _705 = _589 * _589;
    float _707 = floor(_679);
    bool _709 = _675 >= 0.0;
    bool _711 = isnan(_675);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = _699 + (-1.0);
    float _721 = fma(_591, _591, _705);
    int _723 = _717 ? 0 : 1;
    float _725 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _727 = fma(_593, _593, _721);
    float _729 = exp2(_695);
    int _731 = ~_723;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    int _737 = _735;
    float _739 = _639;
    if (!_703)
    {
        int _741 = ~_723;
        int _743 = _741 + 1;
        _737 = _743;
    }
    int _745 = _737;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _749 = 1.0 + _747;
    bool _751 = !_655;
    int _753 = _751 ? 0 : 1;
    float _755 = rsqrt(_727);
    bool _757 = _707 > 0.0;
    bool _759 = _707 >= 0.0;
    bool _761 = isnan(_707);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    int _769 = abs(_753);
    bool _771 = _691 >= 0.0;
    bool _773 = isnan(_691);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = 1.0 / _749;
    bool _783 = _691 > 0.0;
    float _785 = -_729;
    float _787 = _785 + 1.0;
    bool _789 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _791 = isnan(1.0);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _797 = _793 || _795;
    float _799 = float(_745);
    int _801 = _779 ? 0 : 1;
    float _803 = _755 * _591;
    float _805 = float(_769);
    float _807 = _755 * _589;
    bool _809 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _817 = _813 || _815;
    float _819 = _755 * _593;
    int _821 = _767 ? 0 : 1;
    float _823 = _805 * _799;
    bool _825 = !_659;
    int _827 = _825 ? 0 : 1;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _831 = _803 * _829;
    float _833 = _817 ? _787 : 0.0;
    float _835 = _823 * (-2.0);
    int _837 = abs(_827);
    float _839 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _841 = ~_801;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    int _847 = _845;
    float _849 = _807;
    if (_797)
    {
        float _851 = _833 * _781;
        _129 = _851;
    }
    float _853 = _129;
    if (!_783)
    {
        int _855 = ~_801;
        int _857 = _855 + 1;
        _847 = _857;
    }
    int _859 = _847;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _863 = _839 + _861;
    float _865 = in.m_55.x;
    float _867 = in.m_55.y;
    float _869 = in.m_55.z;
    int _871 = ~_821;
    int _873 = _871 + 1;
    int _875 = _873 + 1;
    float _877 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _879 = _875;
    if (!_757)
    {
        int _881 = ~_821;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = _863 * _863;
    bool _889 = !_663;
    int _891 = _889 ? 0 : 1;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _877 + _893;
    float _897 = float(_837);
    float _899 = fma(_671, _671, _887);
    int _901 = abs(_891);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _905 = _819 * _903;
    float _907 = float(_859);
    float _909 = fma(_725, _835, _725);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _913 = -_905;
    float _915 = fma(_803, _911, _913);
    float _917 = fma(_895, _895, _899);
    float _919 = _897 * _907;
    float _921 = float(_901);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _923;
    float _927 = float(_885);
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _931 = _807 * _929;
    float _933 = rsqrt(_917);
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _937 = -_831;
    float _939 = fma(_807, _935, _937);
    float _941 = _915 * _915;
    float _943 = fma(_835, _865, _865);
    float _945 = _919 * (-2.0);
    float _947 = _921 * _927;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _951 = -_931;
    float _953 = fma(_819, _949, _951);
    float _955 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _943);
    float _957 = fma(_697, _945, _697);
    float _959 = fma(_945, _867, _867);
    float _961 = _639 + (-0.5);
    float _963 = 1.0 / _925;
    float _965 = _947 * (-2.0);
    float _967 = fma(_909, _853, _955);
    float _969 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[196].y, _959);
    float _971 = _863 * _933;
    float _973 = fma(_965, _869, _869);
    float _975 = fma(_957, _853, _969);
    float _977 = _671 * _933;
    float _979 = -_971;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _983 = fma(_701, _965, _701);
    float _985 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].z, _973);
    float _987 = -_977;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _991 = _981 * _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _995 = _625 + _993;
    float _997 = _967 * 0.15915493667125701904296875;
    float _999 = _975 * 0.15915493667125701904296875;
    float _1001 = fma(_989, _989, _991);
    float _1003 = _995 * _963;
    float _1005 = _895 * _933;
    float _1007 = fma(_983, _853, _985);
    float _1009 = in.m_51.x;
    float _1011 = in.m_51.y;
    bool _1013 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1015 = isnan(_625);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = _997 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = fma(_953, _953, _941);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1031;
    float _1035 = as_type<float>(int(gl_VertexIndex));
    float _1037 = -_1023;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_939, _939, _1029);
    float _1043 = fma(_1033, _1003, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1045 = _1007 * 0.15915493667125701904296875;
    float _1047 = _997 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = rsqrt(_1041);
    float _1053 = -_1005;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    bool _1057 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1059 = isnan(_625);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1069;
    float _1073 = fma(_1055, _1055, _1001);
    float _1075 = _1067 * _1039;
    float _1077 = fma(_1071, _1003, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1079 = -_1067;
    float _1081 = _1079 + 1.0;
    float _1083 = _999 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1043 * _1075;
    float _1089 = _1077 * _1075;
    int _1091 = as_type<int>(_1035) & 1;
    bool _1093 = _1091 != 0;
    int _1095 = as_type<int>(_1035) & 2;
    bool _1097 = _1095 != 0;
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1087);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1089);
    float _1103 = _999 * 6.283185482025146484375;
    float _1105 = cos(_1103);
    float _1107 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1099);
    float _1109 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1101);
    float _1111 = _1107 * _1009;
    float _1113 = _1109 * _1011;
    float _1115 = _953 * _1051;
    float _1117 = _1045 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _915 * _1051;
    float _1123 = _1027 * _1085;
    float _1125 = _1049 * _1085;
    bool _1127 = !_1093;
    float _1129 = _1127 ? (-0.5) : 0.5;
    float _1131 = _939 * _1051;
    bool _1133 = _637 > 0.5;
    float _1135 = sqrt(_1073);
    float _1137 = _1049 * _1105;
    float _1139 = -_1129;
    float _1141 = _1133 ? _1139 : _1129;
    bool _1143 = _639 > 0.5;
    float _1145 = _1045 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = _1085 * _1119;
    float _1151 = _1027 * _1105;
    float _1153 = _1105 * _1119;
    float _1155 = _1027 * _1119;
    float _1157 = _933 * _1135;
    float _1159 = _1049 * _1119;
    float _1161 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1163 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1165 = !_1097;
    float _1167 = _1165 ? (-0.5) : 0.5;
    float _1169 = _1159 * _803;
    float _1171 = _1161 * _1157;
    float _1173 = _1163 * _1157;
    float _1175 = fma(_1147, _1137, _1123);
    float _1177 = fma(_1147, _1123, _1137);
    float _1179 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1129);
    float _1181 = -_1125;
    float _1183 = fma(_1147, _1151, _1181);
    float _1185 = -_1151;
    float _1187 = fma(_1147, _1125, _1185);
    float _1189 = _803 * _1121;
    float _1191 = _1171 * _1179;
    float _1193 = _807 * _1131;
    float _1195 = -_1147;
    float _1197 = fma(_1195, _1115, _1169);
    float _1199 = _1175 * _803;
    float _1201 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1167);
    float _1203 = -_1193;
    float _1205 = fma(_819, _1121, _1203);
    float _1207 = _1159 * _819;
    float _1209 = _1187 * _803;
    float _1211 = -_1189;
    float _1213 = fma(_807, _1115, _1211);
    float _1215 = _1175 * _819;
    float _1217 = -_1147;
    float _1219 = fma(_1217, _1131, _1207);
    float _1221 = fma(_1153, _1115, _1199);
    float _1223 = _1173 * _1201;
    float _1225 = fma(_1149, _1115, _1209);
    float _1227 = _1187 * _819;
    float _1229 = fma(_1155, _1205, _1197);
    float _1231 = fma(_1153, _1131, _1215);
    float _1233 = fma(_1155, _1213, _1219);
    float _1235 = fma(_1183, _1205, _1221);
    float _1237 = fma(_1177, _1205, _1225);
    float _1239 = fma(_1149, _1131, _1227);
    float _1241 = _1223 * _1229;
    float _1243 = fma(_1183, _1213, _1231);
    float _1245 = _1223 * _1233;
    float _1247 = fma(_1177, _1213, _1239);
    float _1249 = fma(_1191, _1235, _1241);
    float _1251 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1253 = _1251 * 0.5;
    float _1255 = fma(_1191, _1243, _1245);
    float _1257 = fma(_1253, _1237, _1249);
    float _1259 = fma(_1253, _1247, _1255);
    float _1261 = _819 * _1115;
    float _1263 = _1159 * _807;
    float _1265 = _667 + _1257;
    float _1267 = _877 + _1259;
    float _1269 = -_1261;
    float _1271 = fma(_803, _1131, _1269);
    float _1273 = _1175 * _807;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1277 = _1265 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1267 + _1279;
    float _1283 = -_1147;
    float _1285 = fma(_1283, _1121, _1263);
    float _1287 = _1187 * _807;
    float _1289 = _1277 * _1277;
    float _1291 = _1281 * _1281;
    float _1293 = fma(_1153, _1121, _1273);
    float _1295 = fma(_1155, _1271, _1285);
    float _1297 = fma(_1149, _1121, _1287);
    float _1299 = _1289 + _1291;
    float _1301 = fma(_1183, _1271, _1293);
    float _1303 = _1223 * _1295;
    float _1305 = fma(_1177, _1271, _1297);
    float _1307 = sqrt(_1299);
    float _1309 = fma(_1191, _1301, _1303);
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1313 = _1311 != 0;
    float _1315 = fma(_1253, _1305, _1309);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1319 = !_1313;
    float _1321 = _1319 ? _1129 : _1141;
    float _1323 = _839 + _1315;
    bool _1325 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1273;
    float _1329 = _1141;
    float _1331 = _1271;
    float _1333 = _971;
    if (!_1325)
    {
        _1327 = _1291;
    }
    float _1335 = _1327;
    float _1337 = _1335;
    if (!_1325)
    {
        _849 = _1289;
    }
    float _1339 = _849;
    float _1341 = _1339;
    if (!_1325)
    {
        _739 = _1265;
    }
    float _1343 = _739;
    float _1345 = _1343;
    if (!_1325)
    {
        _1329 = _1267;
    }
    float _1347 = _1329;
    float _1349 = _1347;
    if (!_1325)
    {
        _1331 = _1323;
    }
    float _1351 = _1331;
    bool _1353 = !_1325;
    float _1355 = _1351;
    if (!_1353)
    {
        float _1357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1361 = _1307 + _1359;
        float _1363 = rsqrt(_1299);
        float _1365 = _1361 * _1357;
        float _1367 = _1323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = _1365 * 0.15915493667125701904296875;
        float _1371 = _1369 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        float _1375 = _1369 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        float _1379 = fma(_1373, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1381 = _1363 * _1379;
        float _1383 = _1377 + (-1.0);
        float _1385 = fma(_1277, _1381, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1387 = fma(_1281, _1381, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1389 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1393 = _1385 + _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1397 = _1387 + _1395;
        float _1399 = fma(_1323, _1377, _1389);
        float _1401 = _1393 * _1393;
        float _1403 = _1397 * _1397;
        _1355 = _1399;
        _1341 = _1401;
        _1337 = _1403;
        _1349 = _1387;
        _1345 = _1385;
    }
    float _1405 = _1355;
    float _1407 = _1341;
    float _1409 = _1337;
    float _1411 = _1349;
    float _1413 = _1345;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1417 = _1405 + _1415;
    float _1419 = _1321 + 0.5;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1423 = _1421 != 0;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1427 = -_1167;
    int _1429 = _1143 ? as_type<int>(_1427) : as_type<int>(_1167);
    float _1431 = fma(_1417, _1417, _1407);
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1435 = !_1423;
    float _1437 = _1435 ? _1167 : as_type<float>(_1429);
    float _1439 = _1431 + _1409;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1443 = -_1437;
    float _1445 = _1443 + 0.5;
    float _1447 = sqrt(_1439);
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1459 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1461 = _1433 * _1317;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = _1459 * _1425;
    out.m_60.x = _1465;
    out.m_60.y = _1467;
    out.m_60.z = _1469;
    out.m_60.w = _1463;
    bool _1479 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1481 = isnan(_1447);
    bool _1483 = _1479 || _1481;
    bool _1485 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1487 = _1483 || _1485;
    out.m_62.x = _1471;
    out.m_62.y = _1473;
    out.m_62.z = _1475;
    out.m_64.x = _1461;
    out.m_64.y = _1477;
    float _1489 = _1459;
    if (!_1487)
    {
        _1489 = 1.0;
    }
    float _1491 = _1489;
    bool _1493 = !_1487;
    float _1495 = _1491;
    if (!_1493)
    {
        bool _1497 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1499 = isnan(_1447);
        bool _1501 = _1497 || _1499;
        bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1505 = _1501 || _1503;
        if (!_1505)
        {
            float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1509 = _1447 + _1507;
            float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1513 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1511;
            float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1519 = 1.0 / _1513;
            float _1521 = _1509 * _1519;
            float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1495 = _1523;
            _1525 = true;
        }
        else
        {
            bool _1527 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1529 = isnan(_1447);
            bool _1531 = _1527 || _1529;
            bool _1533 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1535 = _1531 || _1533;
            if (!_1535)
            {
                float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1539 = _1447 + _1537;
                float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1543 = _1541 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1547 = _1545 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1549 = 1.0 / _1543;
                float _1551 = _1539 * _1549;
                float _1553 = fma(_1551, _1547, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1495 = _1553;
                _1525 = true;
            }
            else
            {
                _1495 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1525 = false;
    float _1555 = _1495;
    float _1557 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1559 = _1411 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1563 = _1413 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1567 = _1405 + _1565;
    bool _1569 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    float _1579 = fma(_1559, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1581 = fma(_1563, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1583 = fma(_1567, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1585 = -_977;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1589 = -_1005;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1579);
    float _1593 = -_971;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _1597 = -_971;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1601 = -_977;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1581);
    float _1605 = -_1005;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1609 = _1599;
    float _1611 = _1603;
    float _1613 = _1591;
    float _1615 = _1607;
    if (_1577)
    {
        _1333 = _1591;
    }
    float _1617 = _1333;
    float _1619 = _1617;
    if (!_1577)
    {
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1623 = _1595 + _1621;
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1627 = _1587 + _1625;
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1631 = _1623 * _1623;
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1635 = _1607 + _1633;
        float _1637 = fma(_1627, _1627, _1631);
        float _1639 = -_877;
        float _1641 = _1639 + _1579;
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1645 = -_839;
        float _1647 = _1645 + _1583;
        float _1649 = fma(_1635, _1635, _1637);
        float _1651 = sqrt(_1649);
        float _1653 = 1.0 / _1157;
        float _1655 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1657 = precise::min(_1651, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1659 = _1657 * _1629;
        float _1661 = _1659 * _1653;
        float _1663 = -_667;
        float _1665 = _1663 + _1581;
        float _1667 = _1655 * _1661;
        float _1669 = _1641 * _1661;
        float _1671 = fma(_1665, _1667, _1587);
        float _1673 = fma(_1647, _1667, _1595);
        float _1675 = fma(_1655, _1669, _1607);
        _1609 = _1673;
        _1611 = _1671;
        _1619 = _1675;
        _1613 = _1655;
    }
    float _1677 = _1609;
    float _1679 = _1611;
    float _1681 = _1619;
    float _1683 = _1613;
    float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1687 = _1677 + _1685;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1695 = _1681 + _1693;
    float _1697 = _1687 * _1687;
    float _1699 = fma(_1691, _1691, _1697);
    float _1701 = fma(_1695, _1695, _1699);
    float _1703 = rsqrt(_1701);
    float _1705 = sqrt(_1701);
    float _1707 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1709 = _1691 * _1707;
    float _1711 = _1695 * _1707;
    float _1713 = _1709 * _1709;
    float _1715 = _1711 * _1711;
    float _1717 = _1713 + _1715;
    float _1719 = sqrt(_1717);
    bool _1721 = _1719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1725 = _1719 + _1723;
    float _1727 = _1699;
    float _1729 = _1717;
    float _1731 = _1725;
    float _1733 = _1687;
    float _1735 = _1707;
    if (_1721)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1737;
    }
    float _1739 = _1727;
    if (_1721)
    {
        float _1741 = rsqrt(_1717);
        _1729 = _1741;
    }
    float _1743 = _1729;
    float _1745 = _1739;
    float _1747 = _1743;
    if (_1721)
    {
        float _1749 = _1725 * _1739;
        _1731 = _1749;
    }
    float _1751 = _1731;
    if (_1721)
    {
        float _1753 = _1751 * 0.15915493667125701904296875;
        _1745 = _1753;
    }
    float _1755 = _1745;
    float _1757 = _1695;
    float _1759 = _1755;
    if (_1721)
    {
        float _1761 = _1755 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1769 = precise::max(0.0, _1767);
    float _1771 = _1683;
    float _1773 = _1769;
    if (_1721)
    {
        float _1775 = _1755 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = -_1707;
    float _1783 = -_1769;
    float _1785 = fma(_1687, _1781, _1783);
    if (_1721)
    {
        float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1733 = _1787;
    }
    float _1789 = _1733;
    float _1791 = _1789;
    float _1793 = _1765;
    if (_1721)
    {
        float _1795 = fma(_1765, _1789, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1791 = _1795;
    }
    float _1797 = _1791;
    float _1799 = _1797;
    if (!_1721)
    {
        _1793 = _1709;
    }
    float _1801 = _1793;
    float _1803 = _1801;
    float _1805 = _1779;
    if (_1721)
    {
        float _1807 = _1779 + (-1.0);
        _1773 = _1807;
    }
    float _1809 = _1773;
    float _1811 = _1809;
    if (_1721)
    {
        float _1813 = _1743 * _1797;
        _1735 = _1813;
    }
    float _1815 = _1735;
    if (!_1721)
    {
        _1799 = _1785;
    }
    float _1817 = _1799;
    float _1819 = _1817;
    if (_1721)
    {
        float _1821 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1821;
    }
    float _1823 = _1759;
    if (_1721)
    {
        float _1825 = _1709 * _1815;
        _1803 = _1825;
    }
    float _1827 = _1803;
    if (!_1721)
    {
        _1811 = _1711;
    }
    float _1829 = _1811;
    float _1831 = _1829;
    if (_1721)
    {
        float _1833 = _1711 * _1815;
        _1831 = _1833;
    }
    float _1835 = _1831;
    if (!_1721)
    {
        _1747 = _1713;
    }
    float _1837 = _1747;
    float _1839 = _1837;
    if (_1721)
    {
        float _1841 = fma(_1785, _1779, _1823);
        _1819 = _1841;
    }
    float _1843 = _1819;
    if (_1721)
    {
        float _1845 = _1827 * _1827;
        _1839 = _1845;
    }
    float _1847 = _1839;
    if (!_1721)
    {
        _1805 = _1715;
    }
    float _1849 = _1805;
    float _1851 = _1849;
    if (_1721)
    {
        float _1853 = _1835 * _1835;
        _1851 = _1853;
    }
    float _1855 = _1851;
    float _1857 = fma(_1843, _1843, _1847);
    float _1859 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1861 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1863 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1865 = _1857 + _1855;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1869 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1867);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1859);
    float _1875 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1877 = rsqrt(_1865);
    float _1879 = -_1871;
    float _1881 = _1879 + 1.0;
    float _1883 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1873);
    float _1885 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1887 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1875);
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1891 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1885);
    float _1893 = abs(_1881);
    float _1895 = log2(_1893);
    float _1897 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1887);
    float _1899 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1863);
    float _1901 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1891);
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1907 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1909 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1911 = _1877 * _1827;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1915 = _1877 * _1843;
    float _1917 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1921 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1913);
    float _1923 = _1877 * _1835;
    float _1925 = -_1903;
    float _1927 = fma(_1925, _1861, 1.0);
    float _1929 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1931 = -_1919;
    float _1933 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1931);
    float _1935 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1921);
    float _1937 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1939 = -_1923;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1933);
    float _1943 = exp2(_1929);
    float _1945 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1935);
    float _1947 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1949 = fma(_1941, -0.5, 0.5);
    float _1951 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1937);
    float _1953 = fma(_1941, 0.5, 0.5);
    float _1955 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1947);
    float _1957 = _1915 + 1.0;
    float _1959 = log2(_1927);
    float _1961 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1951);
    float _1963 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1955);
    float _1965 = fma(_1953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1967 = fma(_1953, _1965, -0.212114393711090087890625);
    float _1969 = 1.0 / _1945;
    float _1971 = -_1915;
    float _1973 = fma(_1943, _1957, _1971);
    float _1975 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1961);
    float _1977 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1963);
    float _1979 = fma(_1953, _1967, 1.570728778839111328125);
    float _1981 = fma(_1973, 0.5, 0.5);
    float _1983 = sqrt(_1949);
    float _1985 = _1959 * 0.693147182464599609375;
    float _1987 = _1985 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1989 = _1975 * _1969;
    float _1991 = _1977 * _1969;
    float _1993 = fma(_1989, 0.5, 0.5);
    float _1995 = fma(_1991, -0.5, 0.5);
    float _1997 = _1983 * 0.636619746685028076171875;
    float3 _5269 = float3(_1993, _1995, _1987);
    float _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).x;
    float3 _5280 = float3(_1993, _1995, _1987);
    float4 _2002 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5280, float3(0.0), isnan(_5280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5280, float3(0.0), isnan(_5280)), level(0.0)).xyzw;
    float _2004 = _2002.x;
    float _2006 = _2002.y;
    float _2008 = _2002.z;
    float _2010 = _2002.w;
    float _2012 = -_1979;
    float _2014 = fma(_1997, _2012, 1.0);
    float2 _5302 = float2(_2014, _1981);
    float3 _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5302, float2(0.0), isnan(_5302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5302, float2(0.0), isnan(_5302)), level(0.0)).xyz;
    float _2020 = _2018.x;
    float _2022 = _2018.y;
    float _2024 = _2018.z;
    float _2026 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2028 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2030 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2032 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2026);
    float _2034 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2028);
    float _2036 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2032);
    float _2038 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2034);
    float _2040 = exp2(_2030);
    float _2042 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2044 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2046 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.5);
    bool _2054 = _2050 || _2052;
    float _2056 = 1.0 / _2042;
    float _2058 = _2044 + _2042;
    float _2060 = -_2040;
    float _2062 = _2060 + 1.0;
    float _2064 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2066 = _1997;
    float _2068 = _2058;
    if (!_2054)
    {
        _2064 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2070 = _2064;
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2054)
    {
        _2066 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2074 = _2066;
    float _2076 = _2058 * _2056;
    float _2078 = _2076 * 0.5;
    float _2080 = _2078;
    if (_2054)
    {
        _2068 = 1.0;
    }
    float _2082 = _2068;
    float _2084 = _2082;
    if (!_2054)
    {
        float _2086 = -_2074;
        float _2088 = _2086 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1615 = _2088;
    }
    float _2090 = _1615;
    float _2092 = _2090;
    if (!_2054)
    {
        float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2096 = fma(_2078, _2070, _2094);
        _2080 = _2096;
    }
    float _2098 = _2080;
    float _2100 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = _2100;
    if (!_2054)
    {
        float _2104 = 1.0 / _2090;
        _2092 = _2104;
    }
    float _2106 = _2092;
    float _2108 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2110 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2108);
    float _2112 = _1945 * 0.5;
    float _2114 = _2098;
    if (!_2054)
    {
        float _2116 = 1.0 / _2098;
        _2114 = _2116;
    }
    float _2118 = _2114;
    if (!_2054)
    {
        float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2122 = -_2074;
        float _2124 = fma(_2118, _2120, _2122);
        _2102 = _2124;
    }
    float _2126 = _2102;
    if (!_2054)
    {
        float _2128 = _2126 * _2106;
        float _2130 = precise::clamp(_2128, 0.0, 1.0);
        _2084 = _2130;
    }
    float _2132 = _2084;
    float _2134 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2110);
    float _2136 = fma(_1977, -0.5, _2112);
    float _2138 = _1975 + _1945;
    float _2140 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2142 = _2132 > 0.0;
    bool _2144 = isnan(_2132);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.0);
    bool _2150 = _2146 || _2148;
    float _2152 = _2134 + _1945;
    out.gl_Position.x = _1975;
    out.gl_Position.y = _1977;
    out.gl_Position.z = _2134;
    out.gl_Position.w = _1945;
    float _2154 = _2138 * 0.5;
    float _2156 = _2140 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2158 = _2152 * 0.5;
    out.m_47.x = _2156;
    out.m_66.x = _2154;
    out.m_66.y = _2136;
    out.m_66.z = _2158;
    out.m_66.w = _1945;
    float _2160 = _2072 * _1999;
    float _2162 = -_2072;
    float _2164 = _2162 + 1.0;
    float _2166 = _2010 * _2160;
    float _2168 = _2010 * _2164;
    float _2170 = _2024 * _2160;
    float _2172 = fma(_2020, _2166, _2004);
    float _2174 = fma(_2022, _2166, _2006);
    float _2176 = fma(_2010, _2170, _2008);
    out.m_68.x = _2172;
    out.m_68.y = _2174;
    out.m_68.z = _2176;
    out.m_68.w = _2168;
    if (_2150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2178;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1525 = false;
    bool _617 = false;
    bool _467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_103);
        out.gl_Position.z = _2235;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = 0.0;
    float _129 = _121;
    if (_117)
    {
        float _131 = float(_87);
        _123 = _131;
    }
    float _133 = _123;
    bool _135 = _121 >= _133;
    bool _137 = !_117;
    bool _139 = _135 || _137;
    if (_139)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _97;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _105 = as_type<int>(_143);
    }
    int _145 = _105;
    float _147 = as_type<float>(_145);
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2306 = as_type<float>(_145);
        out.gl_Position.z = _2306;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = _155;
    if (!_165)
    {
        float _169 = _155 * _155;
        float _171 = _169 * 0.5;
        _147 = _171;
    }
    float _173 = _147;
    float _175 = 0.0;
    float _177 = _173;
    if (!_165)
    {
        float _179 = _121 * _121;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    if (!_165)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _185;
    }
    float _187 = _177;
    bool _189 = !_165;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _155 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _155);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _125 = _207;
        _191 = _221;
        _127 = _209;
    }
    float _223 = _125;
    float _225 = _191;
    float _227 = _127;
    bool _229 = !_165;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _155 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _167 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _167;
    float _261 = _257;
    float _263 = _255;
    if (!_165)
    {
        _261 = _121;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_165)
    {
        float _271 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_165;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _121 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _121);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_165;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _121 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = fma(_259, _151, _267);
    float _339 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _151, _335);
    float _345 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_259, _149, _339);
    float _351 = fma(_333, _149, _341);
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_259, _153, _345);
    float _359 = fma(_333, _153, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_44.x;
    float _389 = in.m_44.y;
    float _391 = in.m_44.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = sqrt(_383);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    bool _403 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_337, _367, _389);
    float _415 = fma(_349, _367, _387);
    float _417 = fma(_357, _367, _391);
    float _419 = _337;
    float _421 = _401;
    float _423 = _395;
    if (_411)
    {
        _419 = _399;
    }
    float _425 = _419;
    float _427 = _425;
    if (!_411)
    {
        bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _431 = !_429;
        if (!_431)
        {
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
            float _451 = _445 * _445;
            float _453 = fma(_447, _447, _451);
            float _455 = fma(_449, _449, _453);
            float _457 = rsqrt(_455);
            float _459 = _457 * 9.9999999747524270787835121154785e-07;
            float _461 = _447 * _459;
            float _463 = _445 * _459;
            float _465 = _449 * _459;
            _421 = _463;
            _423 = _461;
            _427 = _465;
            _467 = true;
        }
        else
        {
            float _469 = _151 * _151;
            float _471 = fma(_149, _149, _469);
            float _473 = fma(_153, _153, _471);
            float _475 = sqrt(_473);
            bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
            bool _479 = isnan(_475);
            bool _481 = _477 || _479;
            bool _483 = isnan(9.9999999747524270787835121154785e-07);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = _389 * _389;
                float _489 = fma(_387, _387, _487);
                float _491 = fma(_391, _391, _489);
                float _493 = sqrt(_491);
                bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
                bool _497 = isnan(_493);
                bool _499 = _495 || _497;
                bool _501 = isnan(9.9999999747524270787835121154785e-07);
                bool _503 = _499 || _501;
                if (!_503)
                {
                    float _505 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _505);
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _507);
                    float _511 = rsqrt(_509);
                    float _513 = _511 * 9.9999999747524270787835121154785e-07;
                    float _515 = _513 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _513 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _421 = _517;
                    _423 = _515;
                    _427 = _519;
                    _467 = true;
                }
                else
                {
                    float _521 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
                    float _529 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
                    float _531 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
                    float _533 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
                    float _535 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _529);
                    float _537 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _531);
                    float _539 = _533 * _533;
                    float _541 = fma(_535, _535, _539);
                    float _543 = fma(_537, _537, _541);
                    float _545 = rsqrt(_543);
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    float _549 = _535 * _547;
                    float _551 = _533 * _547;
                    float _553 = _537 * _547;
                    _421 = _551;
                    _423 = _549;
                    _427 = _553;
                    _467 = true;
                }
            }
            else
            {
                float _555 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _557 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _559 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _555);
                float _563 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _557);
                float _565 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _559);
                float _567 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
                float _569 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
                float _573 = _567 * _567;
                float _575 = fma(_569, _569, _573);
                float _577 = fma(_571, _571, _575);
                float _579 = rsqrt(_577);
                float _581 = _579 * 9.9999999747524270787835121154785e-07;
                float _583 = _569 * _581;
                float _585 = _567 * _581;
                float _587 = _571 * _581;
                _421 = _585;
                _423 = _583;
                _427 = _587;
            }
        }
    }
    _467 = false;
    float _589 = _421;
    float _591 = _423;
    float _593 = _427;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _597 = !_595;
    float _615;
    if (!_597)
    {
        float _599 = in.m_53.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_87);
        float _621 = 1.0 / _619;
        float _623 = _121 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = in.m_53.z;
    float _629 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _631 = log2(_629);
    float _633 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _635 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _637 = in.m_53.x;
    float _639 = in.m_53.y;
    float _641 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _643 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _633);
    float _645 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _635);
    float _647 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _649 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    float _651 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _645);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _663 = _661 != 0;
    float _665 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _667 = _649 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _667 + _669;
    float _673 = _627 * 2.0;
    float _675 = floor(_673);
    float _677 = _637 * 2.0;
    float _679 = _639 * 2.0;
    float _681 = _639 + _627;
    float _683 = _627 + _637;
    float _685 = _637 + (-0.5);
    float _687 = _627 + (-0.5);
    float _689 = _681 + (-1.0);
    float _691 = floor(_677);
    float _693 = _683 + (-1.0);
    float _695 = _631 * _121;
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _699 = _639 + _637;
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _703 = _675 > 0.0;
    float _705 = _589 * _589;
    float _707 = floor(_679);
    bool _709 = _675 >= 0.0;
    bool _711 = isnan(_675);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = _699 + (-1.0);
    float _721 = fma(_591, _591, _705);
    int _723 = _717 ? 0 : 1;
    float _725 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _727 = fma(_593, _593, _721);
    float _729 = exp2(_695);
    int _731 = ~_723;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    int _737 = _735;
    float _739 = _639;
    if (!_703)
    {
        int _741 = ~_723;
        int _743 = _741 + 1;
        _737 = _743;
    }
    int _745 = _737;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _749 = 1.0 + _747;
    bool _751 = !_655;
    int _753 = _751 ? 0 : 1;
    float _755 = rsqrt(_727);
    bool _757 = _707 > 0.0;
    bool _759 = _707 >= 0.0;
    bool _761 = isnan(_707);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    int _769 = abs(_753);
    bool _771 = _691 >= 0.0;
    bool _773 = isnan(_691);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = 1.0 / _749;
    bool _783 = _691 > 0.0;
    float _785 = -_729;
    float _787 = _785 + 1.0;
    bool _789 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _791 = isnan(1.0);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _797 = _793 || _795;
    float _799 = float(_745);
    int _801 = _779 ? 0 : 1;
    float _803 = _755 * _591;
    float _805 = float(_769);
    float _807 = _755 * _589;
    bool _809 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _817 = _813 || _815;
    float _819 = _755 * _593;
    int _821 = _767 ? 0 : 1;
    float _823 = _805 * _799;
    bool _825 = !_659;
    int _827 = _825 ? 0 : 1;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _831 = _803 * _829;
    float _833 = _817 ? _787 : 0.0;
    float _835 = _823 * (-2.0);
    int _837 = abs(_827);
    float _839 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _841 = ~_801;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    int _847 = _845;
    float _849 = _807;
    if (_797)
    {
        float _851 = _833 * _781;
        _129 = _851;
    }
    float _853 = _129;
    if (!_783)
    {
        int _855 = ~_801;
        int _857 = _855 + 1;
        _847 = _857;
    }
    int _859 = _847;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _863 = _839 + _861;
    float _865 = in.m_55.x;
    float _867 = in.m_55.y;
    float _869 = in.m_55.z;
    int _871 = ~_821;
    int _873 = _871 + 1;
    int _875 = _873 + 1;
    float _877 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _879 = _875;
    if (!_757)
    {
        int _881 = ~_821;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = _863 * _863;
    bool _889 = !_663;
    int _891 = _889 ? 0 : 1;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _877 + _893;
    float _897 = float(_837);
    float _899 = fma(_671, _671, _887);
    int _901 = abs(_891);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _905 = _819 * _903;
    float _907 = float(_859);
    float _909 = fma(_725, _835, _725);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _913 = -_905;
    float _915 = fma(_803, _911, _913);
    float _917 = fma(_895, _895, _899);
    float _919 = _897 * _907;
    float _921 = float(_901);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _923;
    float _927 = float(_885);
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _931 = _807 * _929;
    float _933 = rsqrt(_917);
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _937 = -_831;
    float _939 = fma(_807, _935, _937);
    float _941 = _915 * _915;
    float _943 = fma(_835, _865, _865);
    float _945 = _919 * (-2.0);
    float _947 = _921 * _927;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _951 = -_931;
    float _953 = fma(_819, _949, _951);
    float _955 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _943);
    float _957 = fma(_697, _945, _697);
    float _959 = fma(_945, _867, _867);
    float _961 = _639 + (-0.5);
    float _963 = 1.0 / _925;
    float _965 = _947 * (-2.0);
    float _967 = fma(_909, _853, _955);
    float _969 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[196].y, _959);
    float _971 = _863 * _933;
    float _973 = fma(_965, _869, _869);
    float _975 = fma(_957, _853, _969);
    float _977 = _671 * _933;
    float _979 = -_971;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _983 = fma(_701, _965, _701);
    float _985 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].z, _973);
    float _987 = -_977;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _991 = _981 * _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _995 = _625 + _993;
    float _997 = _967 * 0.15915493667125701904296875;
    float _999 = _975 * 0.15915493667125701904296875;
    float _1001 = fma(_989, _989, _991);
    float _1003 = _995 * _963;
    float _1005 = _895 * _933;
    float _1007 = fma(_983, _853, _985);
    float _1009 = in.m_51.x;
    float _1011 = in.m_51.y;
    bool _1013 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1015 = isnan(_625);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = _997 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = fma(_953, _953, _941);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1031;
    float _1035 = as_type<float>(int(gl_VertexIndex));
    float _1037 = -_1023;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_939, _939, _1029);
    float _1043 = fma(_1033, _1003, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1045 = _1007 * 0.15915493667125701904296875;
    float _1047 = _997 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = rsqrt(_1041);
    float _1053 = -_1005;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    bool _1057 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1059 = isnan(_625);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1069;
    float _1073 = fma(_1055, _1055, _1001);
    float _1075 = _1067 * _1039;
    float _1077 = fma(_1071, _1003, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1079 = -_1067;
    float _1081 = _1079 + 1.0;
    float _1083 = _999 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1043 * _1075;
    float _1089 = _1077 * _1075;
    int _1091 = as_type<int>(_1035) & 1;
    bool _1093 = _1091 != 0;
    int _1095 = as_type<int>(_1035) & 2;
    bool _1097 = _1095 != 0;
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1087);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1089);
    float _1103 = _999 * 6.283185482025146484375;
    float _1105 = cos(_1103);
    float _1107 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1099);
    float _1109 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1101);
    float _1111 = _1107 * _1009;
    float _1113 = _1109 * _1011;
    float _1115 = _953 * _1051;
    float _1117 = _1045 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _915 * _1051;
    float _1123 = _1027 * _1085;
    float _1125 = _1049 * _1085;
    bool _1127 = !_1093;
    float _1129 = _1127 ? (-0.5) : 0.5;
    float _1131 = _939 * _1051;
    bool _1133 = _637 > 0.5;
    float _1135 = sqrt(_1073);
    float _1137 = _1049 * _1105;
    float _1139 = -_1129;
    float _1141 = _1133 ? _1139 : _1129;
    bool _1143 = _639 > 0.5;
    float _1145 = _1045 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = _1085 * _1119;
    float _1151 = _1027 * _1105;
    float _1153 = _1105 * _1119;
    float _1155 = _1027 * _1119;
    float _1157 = _933 * _1135;
    float _1159 = _1049 * _1119;
    float _1161 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1163 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1165 = !_1097;
    float _1167 = _1165 ? (-0.5) : 0.5;
    float _1169 = _1159 * _803;
    float _1171 = _1161 * _1157;
    float _1173 = _1163 * _1157;
    float _1175 = fma(_1147, _1137, _1123);
    float _1177 = fma(_1147, _1123, _1137);
    float _1179 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1129);
    float _1181 = -_1125;
    float _1183 = fma(_1147, _1151, _1181);
    float _1185 = -_1151;
    float _1187 = fma(_1147, _1125, _1185);
    float _1189 = _803 * _1121;
    float _1191 = _1171 * _1179;
    float _1193 = _807 * _1131;
    float _1195 = -_1147;
    float _1197 = fma(_1195, _1115, _1169);
    float _1199 = _1175 * _803;
    float _1201 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1167);
    float _1203 = -_1193;
    float _1205 = fma(_819, _1121, _1203);
    float _1207 = _1159 * _819;
    float _1209 = _1187 * _803;
    float _1211 = -_1189;
    float _1213 = fma(_807, _1115, _1211);
    float _1215 = _1175 * _819;
    float _1217 = -_1147;
    float _1219 = fma(_1217, _1131, _1207);
    float _1221 = fma(_1153, _1115, _1199);
    float _1223 = _1173 * _1201;
    float _1225 = fma(_1149, _1115, _1209);
    float _1227 = _1187 * _819;
    float _1229 = fma(_1155, _1205, _1197);
    float _1231 = fma(_1153, _1131, _1215);
    float _1233 = fma(_1155, _1213, _1219);
    float _1235 = fma(_1183, _1205, _1221);
    float _1237 = fma(_1177, _1205, _1225);
    float _1239 = fma(_1149, _1131, _1227);
    float _1241 = _1223 * _1229;
    float _1243 = fma(_1183, _1213, _1231);
    float _1245 = _1223 * _1233;
    float _1247 = fma(_1177, _1213, _1239);
    float _1249 = fma(_1191, _1235, _1241);
    float _1251 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1253 = _1251 * 0.5;
    float _1255 = fma(_1191, _1243, _1245);
    float _1257 = fma(_1253, _1237, _1249);
    float _1259 = fma(_1253, _1247, _1255);
    float _1261 = _819 * _1115;
    float _1263 = _1159 * _807;
    float _1265 = _667 + _1257;
    float _1267 = _877 + _1259;
    float _1269 = -_1261;
    float _1271 = fma(_803, _1131, _1269);
    float _1273 = _1175 * _807;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1277 = _1265 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1267 + _1279;
    float _1283 = -_1147;
    float _1285 = fma(_1283, _1121, _1263);
    float _1287 = _1187 * _807;
    float _1289 = _1277 * _1277;
    float _1291 = _1281 * _1281;
    float _1293 = fma(_1153, _1121, _1273);
    float _1295 = fma(_1155, _1271, _1285);
    float _1297 = fma(_1149, _1121, _1287);
    float _1299 = _1289 + _1291;
    float _1301 = fma(_1183, _1271, _1293);
    float _1303 = _1223 * _1295;
    float _1305 = fma(_1177, _1271, _1297);
    float _1307 = sqrt(_1299);
    float _1309 = fma(_1191, _1301, _1303);
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1313 = _1311 != 0;
    float _1315 = fma(_1253, _1305, _1309);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1319 = !_1313;
    float _1321 = _1319 ? _1129 : _1141;
    float _1323 = _839 + _1315;
    bool _1325 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1273;
    float _1329 = _1141;
    float _1331 = _1271;
    float _1333 = _971;
    if (!_1325)
    {
        _1327 = _1291;
    }
    float _1335 = _1327;
    float _1337 = _1335;
    if (!_1325)
    {
        _849 = _1289;
    }
    float _1339 = _849;
    float _1341 = _1339;
    if (!_1325)
    {
        _739 = _1265;
    }
    float _1343 = _739;
    float _1345 = _1343;
    if (!_1325)
    {
        _1329 = _1267;
    }
    float _1347 = _1329;
    float _1349 = _1347;
    if (!_1325)
    {
        _1331 = _1323;
    }
    float _1351 = _1331;
    bool _1353 = !_1325;
    float _1355 = _1351;
    if (!_1353)
    {
        float _1357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1361 = _1307 + _1359;
        float _1363 = rsqrt(_1299);
        float _1365 = _1361 * _1357;
        float _1367 = _1323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = _1365 * 0.15915493667125701904296875;
        float _1371 = _1369 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        float _1375 = _1369 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        float _1379 = fma(_1373, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1381 = _1363 * _1379;
        float _1383 = _1377 + (-1.0);
        float _1385 = fma(_1277, _1381, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1387 = fma(_1281, _1381, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1389 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1393 = _1385 + _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1397 = _1387 + _1395;
        float _1399 = fma(_1323, _1377, _1389);
        float _1401 = _1393 * _1393;
        float _1403 = _1397 * _1397;
        _1355 = _1399;
        _1341 = _1401;
        _1337 = _1403;
        _1349 = _1387;
        _1345 = _1385;
    }
    float _1405 = _1355;
    float _1407 = _1341;
    float _1409 = _1337;
    float _1411 = _1349;
    float _1413 = _1345;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1417 = _1405 + _1415;
    float _1419 = _1321 + 0.5;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1423 = _1421 != 0;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1427 = -_1167;
    int _1429 = _1143 ? as_type<int>(_1427) : as_type<int>(_1167);
    float _1431 = fma(_1417, _1417, _1407);
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1435 = !_1423;
    float _1437 = _1435 ? _1167 : as_type<float>(_1429);
    float _1439 = _1431 + _1409;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1443 = -_1437;
    float _1445 = _1443 + 0.5;
    float _1447 = sqrt(_1439);
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1459 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1461 = _1433 * _1317;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = _1459 * _1425;
    out.m_60.x = _1465;
    out.m_60.y = _1467;
    out.m_60.z = _1469;
    out.m_60.w = _1463;
    bool _1479 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1481 = isnan(_1447);
    bool _1483 = _1479 || _1481;
    bool _1485 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1487 = _1483 || _1485;
    out.m_62.x = _1471;
    out.m_62.y = _1473;
    out.m_62.z = _1475;
    out.m_64.x = _1461;
    out.m_64.y = _1477;
    float _1489 = _1459;
    if (!_1487)
    {
        _1489 = 1.0;
    }
    float _1491 = _1489;
    bool _1493 = !_1487;
    float _1495 = _1491;
    if (!_1493)
    {
        bool _1497 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1499 = isnan(_1447);
        bool _1501 = _1497 || _1499;
        bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1505 = _1501 || _1503;
        if (!_1505)
        {
            float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1509 = _1447 + _1507;
            float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1513 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1511;
            float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1519 = 1.0 / _1513;
            float _1521 = _1509 * _1519;
            float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1495 = _1523;
            _1525 = true;
        }
        else
        {
            bool _1527 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1529 = isnan(_1447);
            bool _1531 = _1527 || _1529;
            bool _1533 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1535 = _1531 || _1533;
            if (!_1535)
            {
                float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1539 = _1447 + _1537;
                float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1543 = _1541 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1547 = _1545 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1549 = 1.0 / _1543;
                float _1551 = _1539 * _1549;
                float _1553 = fma(_1551, _1547, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1495 = _1553;
                _1525 = true;
            }
            else
            {
                _1495 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1525 = false;
    float _1555 = _1495;
    float _1557 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1559 = _1411 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1563 = _1413 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1567 = _1405 + _1565;
    bool _1569 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    float _1579 = fma(_1559, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1581 = fma(_1563, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1583 = fma(_1567, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1585 = -_977;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1589 = -_1005;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1579);
    float _1593 = -_971;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _1597 = -_971;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1601 = -_977;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1581);
    float _1605 = -_1005;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1609 = _1599;
    float _1611 = _1603;
    float _1613 = _1591;
    float _1615 = _1607;
    if (_1577)
    {
        _1333 = _1591;
    }
    float _1617 = _1333;
    float _1619 = _1617;
    if (!_1577)
    {
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1623 = _1595 + _1621;
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1627 = _1587 + _1625;
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1631 = _1623 * _1623;
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1635 = _1607 + _1633;
        float _1637 = fma(_1627, _1627, _1631);
        float _1639 = -_877;
        float _1641 = _1639 + _1579;
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1645 = -_839;
        float _1647 = _1645 + _1583;
        float _1649 = fma(_1635, _1635, _1637);
        float _1651 = sqrt(_1649);
        float _1653 = 1.0 / _1157;
        float _1655 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1657 = precise::min(_1651, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1659 = _1657 * _1629;
        float _1661 = _1659 * _1653;
        float _1663 = -_667;
        float _1665 = _1663 + _1581;
        float _1667 = _1655 * _1661;
        float _1669 = _1641 * _1661;
        float _1671 = fma(_1665, _1667, _1587);
        float _1673 = fma(_1647, _1667, _1595);
        float _1675 = fma(_1655, _1669, _1607);
        _1609 = _1673;
        _1611 = _1671;
        _1619 = _1675;
        _1613 = _1655;
    }
    float _1677 = _1609;
    float _1679 = _1611;
    float _1681 = _1619;
    float _1683 = _1613;
    float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1687 = _1677 + _1685;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1695 = _1681 + _1693;
    float _1697 = _1687 * _1687;
    float _1699 = fma(_1691, _1691, _1697);
    float _1701 = fma(_1695, _1695, _1699);
    float _1703 = rsqrt(_1701);
    float _1705 = sqrt(_1701);
    float _1707 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1709 = _1691 * _1707;
    float _1711 = _1695 * _1707;
    float _1713 = _1709 * _1709;
    float _1715 = _1711 * _1711;
    float _1717 = _1713 + _1715;
    float _1719 = sqrt(_1717);
    bool _1721 = _1719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1725 = _1719 + _1723;
    float _1727 = _1699;
    float _1729 = _1717;
    float _1731 = _1725;
    float _1733 = _1687;
    float _1735 = _1707;
    if (_1721)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1737;
    }
    float _1739 = _1727;
    if (_1721)
    {
        float _1741 = rsqrt(_1717);
        _1729 = _1741;
    }
    float _1743 = _1729;
    float _1745 = _1739;
    float _1747 = _1743;
    if (_1721)
    {
        float _1749 = _1725 * _1739;
        _1731 = _1749;
    }
    float _1751 = _1731;
    if (_1721)
    {
        float _1753 = _1751 * 0.15915493667125701904296875;
        _1745 = _1753;
    }
    float _1755 = _1745;
    float _1757 = _1695;
    float _1759 = _1755;
    if (_1721)
    {
        float _1761 = _1755 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1769 = precise::max(0.0, _1767);
    float _1771 = _1683;
    float _1773 = _1769;
    if (_1721)
    {
        float _1775 = _1755 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = -_1707;
    float _1783 = -_1769;
    float _1785 = fma(_1687, _1781, _1783);
    if (_1721)
    {
        float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1733 = _1787;
    }
    float _1789 = _1733;
    float _1791 = _1789;
    float _1793 = _1765;
    if (_1721)
    {
        float _1795 = fma(_1765, _1789, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1791 = _1795;
    }
    float _1797 = _1791;
    float _1799 = _1797;
    if (!_1721)
    {
        _1793 = _1709;
    }
    float _1801 = _1793;
    float _1803 = _1801;
    float _1805 = _1779;
    if (_1721)
    {
        float _1807 = _1779 + (-1.0);
        _1773 = _1807;
    }
    float _1809 = _1773;
    float _1811 = _1809;
    if (_1721)
    {
        float _1813 = _1743 * _1797;
        _1735 = _1813;
    }
    float _1815 = _1735;
    if (!_1721)
    {
        _1799 = _1785;
    }
    float _1817 = _1799;
    float _1819 = _1817;
    if (_1721)
    {
        float _1821 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1821;
    }
    float _1823 = _1759;
    if (_1721)
    {
        float _1825 = _1709 * _1815;
        _1803 = _1825;
    }
    float _1827 = _1803;
    if (!_1721)
    {
        _1811 = _1711;
    }
    float _1829 = _1811;
    float _1831 = _1829;
    if (_1721)
    {
        float _1833 = _1711 * _1815;
        _1831 = _1833;
    }
    float _1835 = _1831;
    if (!_1721)
    {
        _1747 = _1713;
    }
    float _1837 = _1747;
    float _1839 = _1837;
    if (_1721)
    {
        float _1841 = fma(_1785, _1779, _1823);
        _1819 = _1841;
    }
    float _1843 = _1819;
    if (_1721)
    {
        float _1845 = _1827 * _1827;
        _1839 = _1845;
    }
    float _1847 = _1839;
    if (!_1721)
    {
        _1805 = _1715;
    }
    float _1849 = _1805;
    float _1851 = _1849;
    if (_1721)
    {
        float _1853 = _1835 * _1835;
        _1851 = _1853;
    }
    float _1855 = _1851;
    float _1857 = fma(_1843, _1843, _1847);
    float _1859 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1861 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1863 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1865 = _1857 + _1855;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1869 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1867);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1859);
    float _1875 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1877 = rsqrt(_1865);
    float _1879 = -_1871;
    float _1881 = _1879 + 1.0;
    float _1883 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1873);
    float _1885 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1887 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1875);
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1891 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1885);
    float _1893 = abs(_1881);
    float _1895 = log2(_1893);
    float _1897 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1887);
    float _1899 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1863);
    float _1901 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1891);
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1907 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1909 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1911 = _1877 * _1827;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1915 = _1877 * _1843;
    float _1917 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1921 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1913);
    float _1923 = _1877 * _1835;
    float _1925 = -_1903;
    float _1927 = fma(_1925, _1861, 1.0);
    float _1929 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1931 = -_1919;
    float _1933 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1931);
    float _1935 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1921);
    float _1937 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1939 = -_1923;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1933);
    float _1943 = exp2(_1929);
    float _1945 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1935);
    float _1947 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1949 = fma(_1941, -0.5, 0.5);
    float _1951 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1937);
    float _1953 = fma(_1941, 0.5, 0.5);
    float _1955 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1947);
    float _1957 = _1915 + 1.0;
    float _1959 = log2(_1927);
    float _1961 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1951);
    float _1963 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1955);
    float _1965 = fma(_1953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1967 = fma(_1953, _1965, -0.212114393711090087890625);
    float _1969 = 1.0 / _1945;
    float _1971 = -_1915;
    float _1973 = fma(_1943, _1957, _1971);
    float _1975 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1961);
    float _1977 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1963);
    float _1979 = fma(_1953, _1967, 1.570728778839111328125);
    float _1981 = fma(_1973, 0.5, 0.5);
    float _1983 = sqrt(_1949);
    float _1985 = _1959 * 0.693147182464599609375;
    float _1987 = _1985 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1989 = _1975 * _1969;
    float _1991 = _1977 * _1969;
    float _1993 = fma(_1989, 0.5, 0.5);
    float _1995 = fma(_1991, -0.5, 0.5);
    float _1997 = _1983 * 0.636619746685028076171875;
    float3 _5269 = float3(_1993, _1995, _1987);
    float _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).x;
    float3 _5280 = float3(_1993, _1995, _1987);
    float4 _2002 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5280, float3(0.0), isnan(_5280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5280, float3(0.0), isnan(_5280)), level(0.0)).xyzw;
    float _2004 = _2002.x;
    float _2006 = _2002.y;
    float _2008 = _2002.z;
    float _2010 = _2002.w;
    float _2012 = -_1979;
    float _2014 = fma(_1997, _2012, 1.0);
    float2 _5302 = float2(_2014, _1981);
    float3 _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5302, float2(0.0), isnan(_5302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5302, float2(0.0), isnan(_5302)), level(0.0)).xyz;
    float _2020 = _2018.x;
    float _2022 = _2018.y;
    float _2024 = _2018.z;
    float _2026 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2028 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2030 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2032 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2026);
    float _2034 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2028);
    float _2036 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2032);
    float _2038 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2034);
    float _2040 = exp2(_2030);
    float _2042 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2044 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2046 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.5);
    bool _2054 = _2050 || _2052;
    float _2056 = 1.0 / _2042;
    float _2058 = _2044 + _2042;
    float _2060 = -_2040;
    float _2062 = _2060 + 1.0;
    float _2064 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2066 = _1997;
    float _2068 = _2058;
    if (!_2054)
    {
        _2064 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2070 = _2064;
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2054)
    {
        _2066 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2074 = _2066;
    float _2076 = _2058 * _2056;
    float _2078 = _2076 * 0.5;
    float _2080 = _2078;
    if (_2054)
    {
        _2068 = 1.0;
    }
    float _2082 = _2068;
    float _2084 = _2082;
    if (!_2054)
    {
        float _2086 = -_2074;
        float _2088 = _2086 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1615 = _2088;
    }
    float _2090 = _1615;
    float _2092 = _2090;
    if (!_2054)
    {
        float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2096 = fma(_2078, _2070, _2094);
        _2080 = _2096;
    }
    float _2098 = _2080;
    float _2100 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = _2100;
    if (!_2054)
    {
        float _2104 = 1.0 / _2090;
        _2092 = _2104;
    }
    float _2106 = _2092;
    float _2108 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2110 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2108);
    float _2112 = _1945 * 0.5;
    float _2114 = _2098;
    if (!_2054)
    {
        float _2116 = 1.0 / _2098;
        _2114 = _2116;
    }
    float _2118 = _2114;
    if (!_2054)
    {
        float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2122 = -_2074;
        float _2124 = fma(_2118, _2120, _2122);
        _2102 = _2124;
    }
    float _2126 = _2102;
    if (!_2054)
    {
        float _2128 = _2126 * _2106;
        float _2130 = precise::clamp(_2128, 0.0, 1.0);
        _2084 = _2130;
    }
    float _2132 = _2084;
    float _2134 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2110);
    float _2136 = fma(_1977, -0.5, _2112);
    float _2138 = _1975 + _1945;
    float _2140 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2142 = _2132 > 0.0;
    bool _2144 = isnan(_2132);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.0);
    bool _2150 = _2146 || _2148;
    float _2152 = _2134 + _1945;
    out.gl_Position.x = _1975;
    out.gl_Position.y = _1977;
    out.gl_Position.z = _2134;
    out.gl_Position.w = _1945;
    float _2154 = _2138 * 0.5;
    float _2156 = _2140 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2158 = _2152 * 0.5;
    out.m_47.x = _2156;
    out.m_66.x = _2154;
    out.m_66.y = _2136;
    out.m_66.z = _2158;
    out.m_66.w = _1945;
    float _2160 = _2072 * _1999;
    float _2162 = -_2072;
    float _2164 = _2162 + 1.0;
    float _2166 = _2010 * _2160;
    float _2168 = _2010 * _2164;
    float _2170 = _2024 * _2160;
    float _2172 = fma(_2020, _2166, _2004);
    float _2174 = fma(_2022, _2166, _2006);
    float _2176 = fma(_2010, _2170, _2008);
    out.m_68.x = _2172;
    out.m_68.y = _2174;
    out.m_68.z = _2176;
    out.m_68.w = _2168;
    if (_2150)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2178;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1525 = false;
    bool _617 = false;
    bool _467 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2235 = as_type<float>(_103);
        out.gl_Position.z = _2235;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    float _127 = 0.0;
    float _129 = _121;
    if (_117)
    {
        float _131 = float(_87);
        _123 = _131;
    }
    float _133 = _123;
    bool _135 = _121 >= _133;
    bool _137 = !_117;
    bool _139 = _135 || _137;
    if (_139)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _97;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _105 = as_type<int>(_143);
    }
    int _145 = _105;
    float _147 = as_type<float>(_145);
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2306 = as_type<float>(_145);
        out.gl_Position.z = _2306;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = _155;
    if (!_165)
    {
        float _169 = _155 * _155;
        float _171 = _169 * 0.5;
        _147 = _171;
    }
    float _173 = _147;
    float _175 = 0.0;
    float _177 = _173;
    if (!_165)
    {
        float _179 = _121 * _121;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    if (!_165)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _185;
    }
    float _187 = _177;
    bool _189 = !_165;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _155 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _155);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _125 = _207;
        _191 = _221;
        _127 = _209;
    }
    float _223 = _125;
    float _225 = _191;
    float _227 = _127;
    bool _229 = !_165;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _155 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _167 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _167;
    float _261 = _257;
    float _263 = _255;
    if (!_165)
    {
        _261 = _121;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _265;
    if (!_165)
    {
        float _271 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _271;
    }
    float _273 = _263;
    bool _275 = !_165;
    float _277 = _273;
    if (!_275)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _289 = _121 * _281;
        float _291 = 1.0 / _285;
        float _293 = _287 * 0.693147182464599609375;
        float _295 = exp2(_289);
        float _297 = 1.0 / _293;
        float _299 = _295 + (-1.0);
        float _301 = -_299;
        float _303 = fma(_301, _297, _121);
        float _305 = _303 * _291;
        float _307 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _307;
    }
    float _309 = _277;
    bool _311 = !_165;
    if (!_311)
    {
        float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = log2(_313);
        float _317 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _319 = _317 + 1.0;
        float _321 = 1.0 / _319;
        float _323 = _121 * _315;
        float _325 = exp2(_323);
        float _327 = -_325;
        float _329 = _327 + 1.0;
        float _331 = _329 * _321;
        _269 = _331;
    }
    float _333 = _269;
    float _335 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = fma(_259, _151, _267);
    float _339 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = fma(_333, _151, _335);
    float _345 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = _309 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_259, _149, _339);
    float _351 = fma(_333, _149, _341);
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_259, _153, _345);
    float _359 = fma(_333, _153, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_44.x;
    float _389 = in.m_44.y;
    float _391 = in.m_44.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = sqrt(_383);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    float _401 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    bool _403 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_397);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_337, _367, _389);
    float _415 = fma(_349, _367, _387);
    float _417 = fma(_357, _367, _391);
    float _419 = _337;
    float _421 = _401;
    float _423 = _395;
    if (_411)
    {
        _419 = _399;
    }
    float _425 = _419;
    float _427 = _425;
    if (!_411)
    {
        bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _431 = !_429;
        if (!_431)
        {
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _435 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _443);
            float _451 = _445 * _445;
            float _453 = fma(_447, _447, _451);
            float _455 = fma(_449, _449, _453);
            float _457 = rsqrt(_455);
            float _459 = _457 * 9.9999999747524270787835121154785e-07;
            float _461 = _447 * _459;
            float _463 = _445 * _459;
            float _465 = _449 * _459;
            _421 = _463;
            _423 = _461;
            _427 = _465;
            _467 = true;
        }
        else
        {
            float _469 = _151 * _151;
            float _471 = fma(_149, _149, _469);
            float _473 = fma(_153, _153, _471);
            float _475 = sqrt(_473);
            bool _477 = _475 >= 9.9999999747524270787835121154785e-07;
            bool _479 = isnan(_475);
            bool _481 = _477 || _479;
            bool _483 = isnan(9.9999999747524270787835121154785e-07);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = _389 * _389;
                float _489 = fma(_387, _387, _487);
                float _491 = fma(_391, _391, _489);
                float _493 = sqrt(_491);
                bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
                bool _497 = isnan(_493);
                bool _499 = _495 || _497;
                bool _501 = isnan(9.9999999747524270787835121154785e-07);
                bool _503 = _499 || _501;
                if (!_503)
                {
                    float _505 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _507 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _505);
                    float _509 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _507);
                    float _511 = rsqrt(_509);
                    float _513 = _511 * 9.9999999747524270787835121154785e-07;
                    float _515 = _513 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _513 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _513 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _421 = _517;
                    _423 = _515;
                    _427 = _519;
                    _467 = true;
                }
                else
                {
                    float _521 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _525 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _521);
                    float _529 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
                    float _531 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
                    float _533 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _527);
                    float _535 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _529);
                    float _537 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _531);
                    float _539 = _533 * _533;
                    float _541 = fma(_535, _535, _539);
                    float _543 = fma(_537, _537, _541);
                    float _545 = rsqrt(_543);
                    float _547 = _545 * 9.9999999747524270787835121154785e-07;
                    float _549 = _535 * _547;
                    float _551 = _533 * _547;
                    float _553 = _537 * _547;
                    _421 = _551;
                    _423 = _549;
                    _427 = _553;
                    _467 = true;
                }
            }
            else
            {
                float _555 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _557 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _559 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _555);
                float _563 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _557);
                float _565 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _559);
                float _567 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
                float _569 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _563);
                float _571 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _565);
                float _573 = _567 * _567;
                float _575 = fma(_569, _569, _573);
                float _577 = fma(_571, _571, _575);
                float _579 = rsqrt(_577);
                float _581 = _579 * 9.9999999747524270787835121154785e-07;
                float _583 = _569 * _581;
                float _585 = _567 * _581;
                float _587 = _571 * _581;
                _421 = _585;
                _423 = _583;
                _427 = _587;
            }
        }
    }
    _467 = false;
    float _589 = _421;
    float _591 = _423;
    float _593 = _427;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _597 = !_595;
    float _615;
    if (!_597)
    {
        float _599 = in.m_53.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_87);
        float _621 = 1.0 / _619;
        float _623 = _121 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = in.m_53.z;
    float _629 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _631 = log2(_629);
    float _633 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _635 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _637 = in.m_53.x;
    float _639 = in.m_53.y;
    float _641 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _643 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _633);
    float _645 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _635);
    float _647 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _649 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    float _651 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _645);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _663 = _661 != 0;
    float _665 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _647);
    float _667 = _649 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _667 + _669;
    float _673 = _627 * 2.0;
    float _675 = floor(_673);
    float _677 = _637 * 2.0;
    float _679 = _639 * 2.0;
    float _681 = _639 + _627;
    float _683 = _627 + _637;
    float _685 = _637 + (-0.5);
    float _687 = _627 + (-0.5);
    float _689 = _681 + (-1.0);
    float _691 = floor(_677);
    float _693 = _683 + (-1.0);
    float _695 = _631 * _121;
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _699 = _639 + _637;
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _703 = _675 > 0.0;
    float _705 = _589 * _589;
    float _707 = floor(_679);
    bool _709 = _675 >= 0.0;
    bool _711 = isnan(_675);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = _699 + (-1.0);
    float _721 = fma(_591, _591, _705);
    int _723 = _717 ? 0 : 1;
    float _725 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _727 = fma(_593, _593, _721);
    float _729 = exp2(_695);
    int _731 = ~_723;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    int _737 = _735;
    float _739 = _639;
    if (!_703)
    {
        int _741 = ~_723;
        int _743 = _741 + 1;
        _737 = _743;
    }
    int _745 = _737;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _749 = 1.0 + _747;
    bool _751 = !_655;
    int _753 = _751 ? 0 : 1;
    float _755 = rsqrt(_727);
    bool _757 = _707 > 0.0;
    bool _759 = _707 >= 0.0;
    bool _761 = isnan(_707);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    int _769 = abs(_753);
    bool _771 = _691 >= 0.0;
    bool _773 = isnan(_691);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = 1.0 / _749;
    bool _783 = _691 > 0.0;
    float _785 = -_729;
    float _787 = _785 + 1.0;
    bool _789 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _791 = isnan(1.0);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _797 = _793 || _795;
    float _799 = float(_745);
    int _801 = _779 ? 0 : 1;
    float _803 = _755 * _591;
    float _805 = float(_769);
    float _807 = _755 * _589;
    bool _809 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _817 = _813 || _815;
    float _819 = _755 * _593;
    int _821 = _767 ? 0 : 1;
    float _823 = _805 * _799;
    bool _825 = !_659;
    int _827 = _825 ? 0 : 1;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _831 = _803 * _829;
    float _833 = _817 ? _787 : 0.0;
    float _835 = _823 * (-2.0);
    int _837 = abs(_827);
    float _839 = _651 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _841 = ~_801;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    int _847 = _845;
    float _849 = _807;
    if (_797)
    {
        float _851 = _833 * _781;
        _129 = _851;
    }
    float _853 = _129;
    if (!_783)
    {
        int _855 = ~_801;
        int _857 = _855 + 1;
        _847 = _857;
    }
    int _859 = _847;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _863 = _839 + _861;
    float _865 = in.m_55.x;
    float _867 = in.m_55.y;
    float _869 = in.m_55.z;
    int _871 = ~_821;
    int _873 = _871 + 1;
    int _875 = _873 + 1;
    float _877 = _665 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _879 = _875;
    if (!_757)
    {
        int _881 = ~_821;
        int _883 = _881 + 1;
        _879 = _883;
    }
    int _885 = _879;
    float _887 = _863 * _863;
    bool _889 = !_663;
    int _891 = _889 ? 0 : 1;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _877 + _893;
    float _897 = float(_837);
    float _899 = fma(_671, _671, _887);
    int _901 = abs(_891);
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _905 = _819 * _903;
    float _907 = float(_859);
    float _909 = fma(_725, _835, _725);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _913 = -_905;
    float _915 = fma(_803, _911, _913);
    float _917 = fma(_895, _895, _899);
    float _919 = _897 * _907;
    float _921 = float(_901);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _923;
    float _927 = float(_885);
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _931 = _807 * _929;
    float _933 = rsqrt(_917);
    float _935 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _937 = -_831;
    float _939 = fma(_807, _935, _937);
    float _941 = _915 * _915;
    float _943 = fma(_835, _865, _865);
    float _945 = _919 * (-2.0);
    float _947 = _921 * _927;
    float _949 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _951 = -_931;
    float _953 = fma(_819, _949, _951);
    float _955 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _943);
    float _957 = fma(_697, _945, _697);
    float _959 = fma(_945, _867, _867);
    float _961 = _639 + (-0.5);
    float _963 = 1.0 / _925;
    float _965 = _947 * (-2.0);
    float _967 = fma(_909, _853, _955);
    float _969 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[196].y, _959);
    float _971 = _863 * _933;
    float _973 = fma(_965, _869, _869);
    float _975 = fma(_957, _853, _969);
    float _977 = _671 * _933;
    float _979 = -_971;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _983 = fma(_701, _965, _701);
    float _985 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].z, _973);
    float _987 = -_977;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _991 = _981 * _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _995 = _625 + _993;
    float _997 = _967 * 0.15915493667125701904296875;
    float _999 = _975 * 0.15915493667125701904296875;
    float _1001 = fma(_989, _989, _991);
    float _1003 = _995 * _963;
    float _1005 = _895 * _933;
    float _1007 = fma(_983, _853, _985);
    float _1009 = in.m_51.x;
    float _1011 = in.m_51.y;
    bool _1013 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1015 = isnan(_625);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = _997 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = fma(_953, _953, _941);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1031;
    float _1035 = as_type<float>(int(gl_VertexIndex));
    float _1037 = -_1023;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_939, _939, _1029);
    float _1043 = fma(_1033, _1003, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1045 = _1007 * 0.15915493667125701904296875;
    float _1047 = _997 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = rsqrt(_1041);
    float _1053 = -_1005;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    bool _1057 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1059 = isnan(_625);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1069;
    float _1073 = fma(_1055, _1055, _1001);
    float _1075 = _1067 * _1039;
    float _1077 = fma(_1071, _1003, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1079 = -_1067;
    float _1081 = _1079 + 1.0;
    float _1083 = _999 * 6.283185482025146484375;
    float _1085 = sin(_1083);
    float _1087 = _1043 * _1075;
    float _1089 = _1077 * _1075;
    int _1091 = as_type<int>(_1035) & 1;
    bool _1093 = _1091 != 0;
    int _1095 = as_type<int>(_1035) & 2;
    bool _1097 = _1095 != 0;
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1087);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1089);
    float _1103 = _999 * 6.283185482025146484375;
    float _1105 = cos(_1103);
    float _1107 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1099);
    float _1109 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1101);
    float _1111 = _1107 * _1009;
    float _1113 = _1109 * _1011;
    float _1115 = _953 * _1051;
    float _1117 = _1045 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _915 * _1051;
    float _1123 = _1027 * _1085;
    float _1125 = _1049 * _1085;
    bool _1127 = !_1093;
    float _1129 = _1127 ? (-0.5) : 0.5;
    float _1131 = _939 * _1051;
    bool _1133 = _637 > 0.5;
    float _1135 = sqrt(_1073);
    float _1137 = _1049 * _1105;
    float _1139 = -_1129;
    float _1141 = _1133 ? _1139 : _1129;
    bool _1143 = _639 > 0.5;
    float _1145 = _1045 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = _1085 * _1119;
    float _1151 = _1027 * _1105;
    float _1153 = _1105 * _1119;
    float _1155 = _1027 * _1119;
    float _1157 = _933 * _1135;
    float _1159 = _1049 * _1119;
    float _1161 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1163 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1165 = !_1097;
    float _1167 = _1165 ? (-0.5) : 0.5;
    float _1169 = _1159 * _803;
    float _1171 = _1161 * _1157;
    float _1173 = _1163 * _1157;
    float _1175 = fma(_1147, _1137, _1123);
    float _1177 = fma(_1147, _1123, _1137);
    float _1179 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1129);
    float _1181 = -_1125;
    float _1183 = fma(_1147, _1151, _1181);
    float _1185 = -_1151;
    float _1187 = fma(_1147, _1125, _1185);
    float _1189 = _803 * _1121;
    float _1191 = _1171 * _1179;
    float _1193 = _807 * _1131;
    float _1195 = -_1147;
    float _1197 = fma(_1195, _1115, _1169);
    float _1199 = _1175 * _803;
    float _1201 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1167);
    float _1203 = -_1193;
    float _1205 = fma(_819, _1121, _1203);
    float _1207 = _1159 * _819;
    float _1209 = _1187 * _803;
    float _1211 = -_1189;
    float _1213 = fma(_807, _1115, _1211);
    float _1215 = _1175 * _819;
    float _1217 = -_1147;
    float _1219 = fma(_1217, _1131, _1207);
    float _1221 = fma(_1153, _1115, _1199);
    float _1223 = _1173 * _1201;
    float _1225 = fma(_1149, _1115, _1209);
    float _1227 = _1187 * _819;
    float _1229 = fma(_1155, _1205, _1197);
    float _1231 = fma(_1153, _1131, _1215);
    float _1233 = fma(_1155, _1213, _1219);
    float _1235 = fma(_1183, _1205, _1221);
    float _1237 = fma(_1177, _1205, _1225);
    float _1239 = fma(_1149, _1131, _1227);
    float _1241 = _1223 * _1229;
    float _1243 = fma(_1183, _1213, _1231);
    float _1245 = _1223 * _1233;
    float _1247 = fma(_1177, _1213, _1239);
    float _1249 = fma(_1191, _1235, _1241);
    float _1251 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1253 = _1251 * 0.5;
    float _1255 = fma(_1191, _1243, _1245);
    float _1257 = fma(_1253, _1237, _1249);
    float _1259 = fma(_1253, _1247, _1255);
    float _1261 = _819 * _1115;
    float _1263 = _1159 * _807;
    float _1265 = _667 + _1257;
    float _1267 = _877 + _1259;
    float _1269 = -_1261;
    float _1271 = fma(_803, _1131, _1269);
    float _1273 = _1175 * _807;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1277 = _1265 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1267 + _1279;
    float _1283 = -_1147;
    float _1285 = fma(_1283, _1121, _1263);
    float _1287 = _1187 * _807;
    float _1289 = _1277 * _1277;
    float _1291 = _1281 * _1281;
    float _1293 = fma(_1153, _1121, _1273);
    float _1295 = fma(_1155, _1271, _1285);
    float _1297 = fma(_1149, _1121, _1287);
    float _1299 = _1289 + _1291;
    float _1301 = fma(_1183, _1271, _1293);
    float _1303 = _1223 * _1295;
    float _1305 = fma(_1177, _1271, _1297);
    float _1307 = sqrt(_1299);
    float _1309 = fma(_1191, _1301, _1303);
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1313 = _1311 != 0;
    float _1315 = fma(_1253, _1305, _1309);
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1319 = !_1313;
    float _1321 = _1319 ? _1129 : _1141;
    float _1323 = _839 + _1315;
    bool _1325 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1327 = _1273;
    float _1329 = _1141;
    float _1331 = _1271;
    float _1333 = _971;
    if (!_1325)
    {
        _1327 = _1291;
    }
    float _1335 = _1327;
    float _1337 = _1335;
    if (!_1325)
    {
        _849 = _1289;
    }
    float _1339 = _849;
    float _1341 = _1339;
    if (!_1325)
    {
        _739 = _1265;
    }
    float _1343 = _739;
    float _1345 = _1343;
    if (!_1325)
    {
        _1329 = _1267;
    }
    float _1347 = _1329;
    float _1349 = _1347;
    if (!_1325)
    {
        _1331 = _1323;
    }
    float _1351 = _1331;
    bool _1353 = !_1325;
    float _1355 = _1351;
    if (!_1353)
    {
        float _1357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1361 = _1307 + _1359;
        float _1363 = rsqrt(_1299);
        float _1365 = _1361 * _1357;
        float _1367 = _1323 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1369 = _1365 * 0.15915493667125701904296875;
        float _1371 = _1369 * 6.283185482025146484375;
        float _1373 = sin(_1371);
        float _1375 = _1369 * 6.283185482025146484375;
        float _1377 = cos(_1375);
        float _1379 = fma(_1373, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1381 = _1363 * _1379;
        float _1383 = _1377 + (-1.0);
        float _1385 = fma(_1277, _1381, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1387 = fma(_1281, _1381, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1389 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1393 = _1385 + _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1397 = _1387 + _1395;
        float _1399 = fma(_1323, _1377, _1389);
        float _1401 = _1393 * _1393;
        float _1403 = _1397 * _1397;
        _1355 = _1399;
        _1341 = _1401;
        _1337 = _1403;
        _1349 = _1387;
        _1345 = _1385;
    }
    float _1405 = _1355;
    float _1407 = _1341;
    float _1409 = _1337;
    float _1411 = _1349;
    float _1413 = _1345;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1417 = _1405 + _1415;
    float _1419 = _1321 + 0.5;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1423 = _1421 != 0;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1427 = -_1167;
    int _1429 = _1143 ? as_type<int>(_1427) : as_type<int>(_1167);
    float _1431 = fma(_1417, _1417, _1407);
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1435 = !_1423;
    float _1437 = _1435 ? _1167 : as_type<float>(_1429);
    float _1439 = _1431 + _1409;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1443 = -_1437;
    float _1445 = _1443 + 0.5;
    float _1447 = sqrt(_1439);
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1459 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1461 = _1433 * _1317;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1473 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1475 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = _1459 * _1425;
    out.m_60.x = _1465;
    out.m_60.y = _1467;
    out.m_60.z = _1469;
    out.m_60.w = _1463;
    bool _1479 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1481 = isnan(_1447);
    bool _1483 = _1479 || _1481;
    bool _1485 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1487 = _1483 || _1485;
    out.m_62.x = _1471;
    out.m_62.y = _1473;
    out.m_62.z = _1475;
    out.m_64.x = _1461;
    out.m_64.y = _1477;
    float _1489 = _1459;
    if (!_1487)
    {
        _1489 = 1.0;
    }
    float _1491 = _1489;
    bool _1493 = !_1487;
    float _1495 = _1491;
    if (!_1493)
    {
        bool _1497 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1499 = isnan(_1447);
        bool _1501 = _1497 || _1499;
        bool _1503 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1505 = _1501 || _1503;
        if (!_1505)
        {
            float _1507 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1509 = _1447 + _1507;
            float _1511 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1513 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1511;
            float _1515 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1519 = 1.0 / _1513;
            float _1521 = _1509 * _1519;
            float _1523 = fma(_1521, _1517, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1495 = _1523;
            _1525 = true;
        }
        else
        {
            bool _1527 = _1447 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1529 = isnan(_1447);
            bool _1531 = _1527 || _1529;
            bool _1533 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1535 = _1531 || _1533;
            if (!_1535)
            {
                float _1537 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1539 = _1447 + _1537;
                float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1543 = _1541 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1547 = _1545 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1549 = 1.0 / _1543;
                float _1551 = _1539 * _1549;
                float _1553 = fma(_1551, _1547, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1495 = _1553;
                _1525 = true;
            }
            else
            {
                _1495 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1525 = false;
    float _1555 = _1495;
    float _1557 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1559 = _1411 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1563 = _1413 + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1567 = _1405 + _1565;
    bool _1569 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    float _1579 = fma(_1559, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1581 = fma(_1563, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1583 = fma(_1567, _1555, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1585 = -_977;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1589 = -_1005;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1579);
    float _1593 = -_971;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[18].w, _839);
    float _1597 = -_971;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1601 = -_977;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1581);
    float _1605 = -_1005;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1609 = _1599;
    float _1611 = _1603;
    float _1613 = _1591;
    float _1615 = _1607;
    if (_1577)
    {
        _1333 = _1591;
    }
    float _1617 = _1333;
    float _1619 = _1617;
    if (!_1577)
    {
        float _1621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1623 = _1595 + _1621;
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1627 = _1587 + _1625;
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1631 = _1623 * _1623;
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1635 = _1607 + _1633;
        float _1637 = fma(_1627, _1627, _1631);
        float _1639 = -_877;
        float _1641 = _1639 + _1579;
        float _1643 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1645 = -_839;
        float _1647 = _1645 + _1583;
        float _1649 = fma(_1635, _1635, _1637);
        float _1651 = sqrt(_1649);
        float _1653 = 1.0 / _1157;
        float _1655 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1657 = precise::min(_1651, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1659 = _1657 * _1629;
        float _1661 = _1659 * _1653;
        float _1663 = -_667;
        float _1665 = _1663 + _1581;
        float _1667 = _1655 * _1661;
        float _1669 = _1641 * _1661;
        float _1671 = fma(_1665, _1667, _1587);
        float _1673 = fma(_1647, _1667, _1595);
        float _1675 = fma(_1655, _1669, _1607);
        _1609 = _1673;
        _1611 = _1671;
        _1619 = _1675;
        _1613 = _1655;
    }
    float _1677 = _1609;
    float _1679 = _1611;
    float _1681 = _1619;
    float _1683 = _1613;
    float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1687 = _1677 + _1685;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1695 = _1681 + _1693;
    float _1697 = _1687 * _1687;
    float _1699 = fma(_1691, _1691, _1697);
    float _1701 = fma(_1695, _1695, _1699);
    float _1703 = rsqrt(_1701);
    float _1705 = sqrt(_1701);
    float _1707 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1709 = _1691 * _1707;
    float _1711 = _1695 * _1707;
    float _1713 = _1709 * _1709;
    float _1715 = _1711 * _1711;
    float _1717 = _1713 + _1715;
    float _1719 = sqrt(_1717);
    bool _1721 = _1719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1725 = _1719 + _1723;
    float _1727 = _1699;
    float _1729 = _1717;
    float _1731 = _1725;
    float _1733 = _1687;
    float _1735 = _1707;
    if (_1721)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1737;
    }
    float _1739 = _1727;
    if (_1721)
    {
        float _1741 = rsqrt(_1717);
        _1729 = _1741;
    }
    float _1743 = _1729;
    float _1745 = _1739;
    float _1747 = _1743;
    if (_1721)
    {
        float _1749 = _1725 * _1739;
        _1731 = _1749;
    }
    float _1751 = _1731;
    if (_1721)
    {
        float _1753 = _1751 * 0.15915493667125701904296875;
        _1745 = _1753;
    }
    float _1755 = _1745;
    float _1757 = _1695;
    float _1759 = _1755;
    if (_1721)
    {
        float _1761 = _1755 * 6.283185482025146484375;
        float _1763 = sin(_1761);
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1769 = precise::max(0.0, _1767);
    float _1771 = _1683;
    float _1773 = _1769;
    if (_1721)
    {
        float _1775 = _1755 * 6.283185482025146484375;
        float _1777 = cos(_1775);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = -_1707;
    float _1783 = -_1769;
    float _1785 = fma(_1687, _1781, _1783);
    if (_1721)
    {
        float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1733 = _1787;
    }
    float _1789 = _1733;
    float _1791 = _1789;
    float _1793 = _1765;
    if (_1721)
    {
        float _1795 = fma(_1765, _1789, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1791 = _1795;
    }
    float _1797 = _1791;
    float _1799 = _1797;
    if (!_1721)
    {
        _1793 = _1709;
    }
    float _1801 = _1793;
    float _1803 = _1801;
    float _1805 = _1779;
    if (_1721)
    {
        float _1807 = _1779 + (-1.0);
        _1773 = _1807;
    }
    float _1809 = _1773;
    float _1811 = _1809;
    if (_1721)
    {
        float _1813 = _1743 * _1797;
        _1735 = _1813;
    }
    float _1815 = _1735;
    if (!_1721)
    {
        _1799 = _1785;
    }
    float _1817 = _1799;
    float _1819 = _1817;
    if (_1721)
    {
        float _1821 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1821;
    }
    float _1823 = _1759;
    if (_1721)
    {
        float _1825 = _1709 * _1815;
        _1803 = _1825;
    }
    float _1827 = _1803;
    if (!_1721)
    {
        _1811 = _1711;
    }
    float _1829 = _1811;
    float _1831 = _1829;
    if (_1721)
    {
        float _1833 = _1711 * _1815;
        _1831 = _1833;
    }
    float _1835 = _1831;
    if (!_1721)
    {
        _1747 = _1713;
    }
    float _1837 = _1747;
    float _1839 = _1837;
    if (_1721)
    {
        float _1841 = fma(_1785, _1779, _1823);
        _1819 = _1841;
    }
    float _1843 = _1819;
    if (_1721)
    {
        float _1845 = _1827 * _1827;
        _1839 = _1845;
    }
    float _1847 = _1839;
    if (!_1721)
    {
        _1805 = _1715;
    }
    float _1849 = _1805;
    float _1851 = _1849;
    if (_1721)
    {
        float _1853 = _1835 * _1835;
        _1851 = _1853;
    }
    float _1855 = _1851;
    float _1857 = fma(_1843, _1843, _1847);
    float _1859 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1861 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1863 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1865 = _1857 + _1855;
    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1869 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1867);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1859);
    float _1875 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1877 = rsqrt(_1865);
    float _1879 = -_1871;
    float _1881 = _1879 + 1.0;
    float _1883 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1873);
    float _1885 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1887 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1875);
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1891 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1885);
    float _1893 = abs(_1881);
    float _1895 = log2(_1893);
    float _1897 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1887);
    float _1899 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1863);
    float _1901 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1891);
    float _1903 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1907 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1909 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1911 = _1877 * _1827;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1915 = _1877 * _1843;
    float _1917 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1921 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1913);
    float _1923 = _1877 * _1835;
    float _1925 = -_1903;
    float _1927 = fma(_1925, _1861, 1.0);
    float _1929 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1931 = -_1919;
    float _1933 = fma(_1915, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1931);
    float _1935 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1921);
    float _1937 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1939 = -_1923;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1933);
    float _1943 = exp2(_1929);
    float _1945 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1935);
    float _1947 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1949 = fma(_1941, -0.5, 0.5);
    float _1951 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1937);
    float _1953 = fma(_1941, 0.5, 0.5);
    float _1955 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1947);
    float _1957 = _1915 + 1.0;
    float _1959 = log2(_1927);
    float _1961 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1951);
    float _1963 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1955);
    float _1965 = fma(_1953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1967 = fma(_1953, _1965, -0.212114393711090087890625);
    float _1969 = 1.0 / _1945;
    float _1971 = -_1915;
    float _1973 = fma(_1943, _1957, _1971);
    float _1975 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1961);
    float _1977 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1963);
    float _1979 = fma(_1953, _1967, 1.570728778839111328125);
    float _1981 = fma(_1973, 0.5, 0.5);
    float _1983 = sqrt(_1949);
    float _1985 = _1959 * 0.693147182464599609375;
    float _1987 = _1985 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1989 = _1975 * _1969;
    float _1991 = _1977 * _1969;
    float _1993 = fma(_1989, 0.5, 0.5);
    float _1995 = fma(_1991, -0.5, 0.5);
    float _1997 = _1983 * 0.636619746685028076171875;
    float3 _5269 = float3(_1993, _1995, _1987);
    float _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).x;
    float3 _5280 = float3(_1993, _1995, _1987);
    float4 _2002 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5280, float3(0.0), isnan(_5280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5280, float3(0.0), isnan(_5280)), level(0.0)).xyzw;
    float _2004 = _2002.x;
    float _2006 = _2002.y;
    float _2008 = _2002.z;
    float _2010 = _2002.w;
    float _2012 = -_1979;
    float _2014 = fma(_1997, _2012, 1.0);
    float2 _5302 = float2(_2014, _1981);
    float3 _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5302, float2(0.0), isnan(_5302)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5302, float2(0.0), isnan(_5302)), level(0.0)).xyz;
    float _2020 = _2018.x;
    float _2022 = _2018.y;
    float _2024 = _2018.z;
    float _2026 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2028 = _1595 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2030 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2032 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2026);
    float _2034 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2028);
    float _2036 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2032);
    float _2038 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2034);
    float _2040 = exp2(_2030);
    float _2042 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2044 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2046 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan(0.5);
    bool _2054 = _2050 || _2052;
    float _2056 = 1.0 / _2042;
    float _2058 = _2044 + _2042;
    float _2060 = -_2040;
    float _2062 = _2060 + 1.0;
    float _2064 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2066 = _1997;
    float _2068 = _2058;
    if (!_2054)
    {
        _2064 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2070 = _2064;
    float _2072 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2054)
    {
        _2066 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2074 = _2066;
    float _2076 = _2058 * _2056;
    float _2078 = _2076 * 0.5;
    float _2080 = _2078;
    if (_2054)
    {
        _2068 = 1.0;
    }
    float _2082 = _2068;
    float _2084 = _2082;
    if (!_2054)
    {
        float _2086 = -_2074;
        float _2088 = _2086 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1615 = _2088;
    }
    float _2090 = _1615;
    float _2092 = _2090;
    if (!_2054)
    {
        float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2096 = fma(_2078, _2070, _2094);
        _2080 = _2096;
    }
    float _2098 = _2080;
    float _2100 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = _2100;
    if (!_2054)
    {
        float _2104 = 1.0 / _2090;
        _2092 = _2104;
    }
    float _2106 = _2092;
    float _2108 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2110 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2108);
    float _2112 = _1945 * 0.5;
    float _2114 = _2098;
    if (!_2054)
    {
        float _2116 = 1.0 / _2098;
        _2114 = _2116;
    }
    float _2118 = _2114;
    if (!_2054)
    {
        float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2122 = -_2074;
        float _2124 = fma(_2118, _2120, _2122);
        _2102 = _2124;
    }
    float _2126 = _2102;
    if (!_2054)
    {
        float _2128 = _2126 * _2106;
        float _2130 = precise::clamp(_2128, 0.0, 1.0);
        _2084 = _2130;
    }
    float _2132 = _2084;
    float _2134 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2110);
    float _2136 = fma(_1977, -0.5, _2112);
    float _2138 = _1975 + _1945;
    float _2140 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2142 = _2132 > 0.0;
    bool _2144 = isnan(_2132);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.0);
    bool _2150 = _2146 || _2148;
    float _2152 = _2134 + _1945;
    out.gl_Position.x = _1975;
    out.gl_Position.y = _1977;
    out.gl_Position.z = _2134;
    out.gl_Position.w = _1945;
    float _2154 = _2138 * 0.5;
    float _2156 = _2140 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2158 = _2152 * 0.5;
    out.m_47.x = _2156;
    out.m_66.x = _2154;
    out.m_66.y = _2136;
    out.m_66.z = _2158;
    out.m_66.w = _1945;
    float _2160 = _2072 * _1999;
    float _2162 = -_2072;
    float _2164 = _2162 + 1.0;
    float _2166 = _2010 * _2160;
    float _2168 = _2010 * _2164;
    float _2170 = _2024 * _2160;
    float _2172 = fma(_2020, _2166, _2004);
    float _2174 = fma(_2022, _2166, _2006);
    float _2176 = fma(_2010, _2170, _2008);
    out.m_68.x = _2172;
    out.m_68.y = _2174;
    out.m_68.z = _2176;
    out.m_68.w = _2168;
    if (_2150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2178;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

