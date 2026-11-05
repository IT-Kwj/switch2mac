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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1137 = false;
    bool _463 = false;
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
    float _99 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _95;
    float _103 = _101;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_93)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    float _111 = as_type<float>(_109);
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1942 = as_type<float>(_109);
        out.gl_Position.z = _1942;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_89);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
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
    int _143 = 0;
    if (_139)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_147);
        out.gl_Position.z = _2010;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        _111 = _171;
    }
    float _173 = _111;
    float _175 = _173;
    if (!_165)
    {
        float _177 = _127 * _127;
        float _179 = _177 * 0.5;
        _129 = _179;
    }
    float _181 = _129;
    if (!_165)
    {
        float _183 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_165;
    float _189 = _185;
    float _191 = 0.0;
    float _193 = _151;
    if (!_187)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _155 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _155);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _223;
        _99 = _211;
        _191 = _213;
    }
    float _225 = _189;
    float _227 = _99;
    float _229 = _191;
    bool _231 = !_165;
    float _233 = _229;
    float _235 = _227;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _155 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _243;
        _167 = _255;
    }
    float _257 = _233;
    float _259 = _167;
    float _261 = _257;
    if (!_165)
    {
        _261 = _127;
    }
    float _263 = _261;
    float _265 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263;
    if (!_165)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
    }
    float _271 = _235;
    bool _273 = !_165;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _127 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _127);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_165;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _127 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_259, _151, _265);
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = fma(_331, _151, _333);
    float _343 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_259, _149, _337);
    float _349 = fma(_331, _149, _339);
    float _351 = -_341;
    float _353 = _335 + _351;
    float _355 = fma(_259, _153, _343);
    float _357 = fma(_331, _153, _345);
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = _353 * _353;
    float _365 = in.m_51.w;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = fma(_361, _361, _363);
    float _375 = in.m_44.x;
    float _377 = in.m_44.y;
    float _379 = in.m_44.z;
    float _381 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _385 = fma(_369, _369, _373);
    float _387 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _393 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _395 = sqrt(_385);
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _399 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _401 = fma(_347, _365, _375);
    bool _403 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_395);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_335, _365, _377);
    float _415 = fma(_355, _365, _379);
    float _417 = _391;
    float _419 = _399;
    float _421 = _397;
    float _423 = _389;
    if (!_411)
    {
        bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _427 = !_425;
        if (!_427)
        {
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
            float _447 = _441 * _441;
            float _449 = fma(_443, _443, _447);
            float _451 = fma(_445, _445, _449);
            float _453 = rsqrt(_451);
            float _455 = _453 * 9.9999999747524270787835121154785e-07;
            float _457 = _443 * _455;
            float _459 = _441 * _455;
            float _461 = _445 * _455;
            _417 = _459;
            _419 = _457;
            _421 = _461;
            _193 = _441;
            _463 = true;
        }
        else
        {
            float _465 = _151 * _151;
            float _467 = fma(_149, _149, _465);
            float _469 = fma(_153, _153, _467);
            float _471 = sqrt(_469);
            bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
            bool _475 = isnan(_471);
            bool _477 = _473 || _475;
            bool _479 = isnan(9.9999999747524270787835121154785e-07);
            bool _481 = _477 || _479;
            if (!_481)
            {
                float _483 = _377 * _377;
                float _485 = fma(_375, _375, _483);
                float _487 = fma(_379, _379, _485);
                float _489 = sqrt(_487);
                bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
                bool _493 = isnan(_489);
                bool _495 = _491 || _493;
                bool _497 = isnan(9.9999999747524270787835121154785e-07);
                bool _499 = _495 || _497;
                if (!_499)
                {
                    float _501 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _501);
                    float _505 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _503);
                    float _507 = rsqrt(_505);
                    float _509 = _507 * 9.9999999747524270787835121154785e-07;
                    float _511 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _417 = _513;
                    _419 = _511;
                    _421 = _515;
                    _193 = (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    _463 = true;
                }
                else
                {
                    float _517 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _523 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
                    float _525 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _519);
                    float _527 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
                    float _529 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
                    float _531 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
                    float _533 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
                    float _535 = _529 * _529;
                    float _537 = fma(_531, _531, _535);
                    float _539 = fma(_533, _533, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _531 * _543;
                    float _547 = _529 * _543;
                    float _549 = _533 * _543;
                    _417 = _547;
                    _419 = _545;
                    _421 = _549;
                    _193 = _531;
                    _463 = true;
                }
            }
            else
            {
                float _551 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _553 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _555 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _557 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                float _559 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                float _563 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                float _565 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                float _567 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                float _569 = _563 * _563;
                float _571 = fma(_565, _565, _569);
                float _573 = fma(_567, _567, _571);
                float _575 = rsqrt(_573);
                float _577 = _575 * 9.9999999747524270787835121154785e-07;
                float _579 = _565 * _577;
                float _581 = _563 * _577;
                float _583 = _567 * _577;
                _417 = _581;
                _419 = _579;
                _421 = _583;
                _193 = _567;
            }
        }
    }
    _463 = false;
    float _585 = _417;
    float _587 = _419;
    float _589 = _421;
    float _591 = _193;
    float _593 = _585 * _585;
    float _595 = as_type<float>(int(gl_VertexIndex));
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _601 = _599 != 0;
    float _603 = fma(_587, _587, _593);
    float _605 = in.m_56.w;
    float _607 = fma(_589, _589, _603);
    float _609 = in.m_56.z;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _613 = in.m_51.x;
    float _615 = in.m_51.y;
    float _617 = _591;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_601)
    {
        float _621 = in.m_56.y;
        _617 = _621;
    }
    float _623 = _617;
    float _625 = rsqrt(_607);
    float _627 = in.m_56.x;
    int _629 = as_type<int>(_595) & 1;
    bool _631 = _629 != 0;
    int _633 = as_type<int>(_595) & 2;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _643 = _641 != 0;
    bool _645 = _605 > 0.5;
    bool _647 = !_631;
    float _649 = _647 ? (-0.5) : 0.5;
    bool _651 = _609 > 0.5;
    float _653 = _625 * _589;
    float _655 = _625 * _587;
    float _657 = _625 * _585;
    float _659 = _609;
    if (!_601)
    {
        _423 = _609;
    }
    float _661 = _423;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _665 = _653 * _663;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _669 = _667 != 0;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _673 = _657 * _671;
    float _675 = _661;
    if (!_601)
    {
        _619 = _623;
    }
    float _677 = _619;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _681 = -_665;
    float _683 = fma(_655, _679, _681);
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _687 = _655 * _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _691 = -_673;
    float _693 = fma(_653, _689, _691);
    bool _695 = !_635;
    float _697 = _695 ? (-0.5) : 0.5;
    float _699 = _683 * _683;
    float _701 = _677;
    float _703 = _623;
    if (_601)
    {
        float _705 = in.m_56.x;
        float _707 = in.m_56.y;
        _701 = _705;
        _703 = _707;
    }
    float _709 = _701;
    float _711 = _703;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _715 = -_687;
    float _717 = fma(_657, _713, _715);
    float _719 = _615 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = fma(_693, _693, _699);
    float _723 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _725 = _613 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = fma(_717, _717, _721);
    float _731 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = -_697;
    int _737 = _645 ? as_type<int>(_735) : as_type<int>(_697);
    float _739 = rsqrt(_729);
    bool _741 = _627 > 0.5;
    float _743 = _697 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _745 = -_649;
    int _747 = _741 ? as_type<int>(_745) : as_type<int>(_649);
    float _749 = _655 * _743;
    if (_601)
    {
        _675 = _711;
    }
    float _751 = _675;
    float _753 = _709 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_601)
    {
        _659 = _711;
    }
    float _755 = _659;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _759 = _757 != 0;
    float _761 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _763 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _765 = _711 > 0.5;
    float _767 = _751 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _769 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _761);
    float _771 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _763);
    float _773 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _731);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _697);
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _649);
    float _779 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _769);
    float _781 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _771);
    float _783 = _727 * _775;
    float _785 = _693 * _739;
    float _787 = _733 * _777;
    float _789 = _717 * _739;
    float _791 = _683 * _739;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _795 = _783 * _653;
    float _797 = _657 * _789;
    float _799 = _783 * _655;
    float _801 = _655 * _791;
    float _803 = fma(_787, _789, _795);
    float _805 = -_797;
    float _807 = fma(_653, _791, _805);
    float _809 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _811 = fma(_787, _785, _799);
    float _813 = -_801;
    float _815 = fma(_657, _785, _813);
    float _817 = _773 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _819 = _781 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _821 = fma(_809, _807, _811);
    float _823 = fma(_809, _815, _803);
    float _825 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].w, _793);
    float _827 = _817 + _821;
    float _829 = _819 + _823;
    float _831 = _783 * _657;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _837 = _827 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _829 + _839;
    float _843 = fma(_787, _791, _831);
    float _845 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[83].z, _833);
    float _847 = _837 * _837;
    float _849 = _841 * _841;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _855 = -_649;
    int _857 = _651 ? as_type<int>(_855) : as_type<int>(_649);
    float _859 = _847 + _849;
    float _861 = -_851;
    float _863 = fma(_753, 2.0, _861);
    float _865 = -_697;
    int _867 = _765 ? as_type<int>(_865) : as_type<int>(_697);
    float _869 = fma(_767, -2.0, _853);
    float _871 = sqrt(_859);
    bool _873 = !_643;
    float _875 = _873 ? _697 : as_type<float>(_737);
    float _877 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _845);
    bool _879 = !_669;
    float _881 = _879 ? _697 : as_type<float>(_867);
    float _883 = _653 * _785;
    float _885 = -_127;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[81].x, _863);
    float _889 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _869);
    float _891 = _597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _893 = -_883;
    float _895 = fma(_655, _789, _893);
    float _897 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _825);
    bool _899 = !_639;
    float _901 = _899 ? _649 : as_type<float>(_857);
    float _903 = _779 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _905 = fma(_809, _895, _843);
    bool _907 = !_759;
    float _909 = _907 ? _649 : as_type<float>(_747);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _901 + 0.5;
    bool _915 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _917 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _919 = _611 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _921 = _875 + (-0.5);
    float _923 = fma(_891, _913, _887);
    float _925 = _903 + _905;
    float _927 = _657 * _743;
    float _929 = -_919;
    float _931 = -_889;
    float _933 = fma(_929, _921, _931);
    float _935 = fma(_785, _917, _749);
    float _937 = _653 * _743;
    float _939 = _887;
    float _941 = _849;
    float _943 = _785;
    float _945 = _847;
    float _947 = _827;
    float _949 = _789;
    float _951 = _895;
    if (!_915)
    {
        _939 = _849;
    }
    float _953 = _939;
    float _955 = _953;
    if (!_915)
    {
        _941 = _847;
    }
    float _957 = _941;
    float _959 = _957;
    if (!_915)
    {
        _943 = _829;
    }
    float _961 = _943;
    float _963 = _961;
    if (!_915)
    {
        _945 = _925;
    }
    float _965 = _945;
    bool _967 = !_915;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _871 + _973;
        float _977 = _925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_859);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _979 * _993;
        float _997 = fma(_837, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _999 = _991 + (-1.0);
        float _1001 = fma(_841, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1005 = _997 + _1003;
        float _1007 = _999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = _1005 * _1005;
        float _1015 = fma(_925, _991, _1007);
        float _1017 = _1011 * _1011;
        _969 = _1015;
        _959 = _1013;
        _955 = _1017;
        _963 = _1001;
        _947 = _997;
    }
    float _1019 = _969;
    float _1021 = _959;
    float _1023 = _955;
    float _1025 = _963;
    float _1027 = _947;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _909 + 0.5;
    float _1037 = fma(_791, _917, _927);
    float _1039 = fma(_1031, _1031, _1021);
    float _1041 = -_877;
    float _1043 = _1041 + 1.0;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1047 = -_881;
    float _1049 = _1047 + 0.5;
    float _1051 = _1039 + _1023;
    float _1053 = -_1043;
    float _1055 = fma(_901, _1053, _923);
    float _1057 = _1045 * _911;
    float _1059 = fma(_789, _917, _937);
    float _1061 = sqrt(_1051);
    float _1063 = -_897;
    float _1065 = _1063 + 1.0;
    float _1067 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1069 = _807 + _935;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1073 = fma(_875, _1065, _933);
    float _1075 = _1067 * _1033;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1079 = _895 + _1037;
    float _1081 = _815 + _1059;
    out.m_58.w = _1071;
    out.m_60.w = _1077;
    bool _1083 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1085 = isnan(_1061);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1091 = _1087 || _1089;
    out.m_62.x = _1057;
    out.m_62.y = _1075;
    out.m_62.z = _1055;
    out.m_62.w = _1073;
    out.m_64.x = _1069;
    out.m_64.y = _1079;
    out.m_64.z = _1081;
    float _1093 = _1037;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1097 = _1077;
    float _1099 = _1049;
    float _1101 = _1027;
    if (!_1091)
    {
        _1093 = 1.0;
    }
    float _1103 = _1093;
    bool _1105 = !_1091;
    float _1107 = _1103;
    if (!_1105)
    {
        bool _1109 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1111 = isnan(_1061);
        bool _1113 = _1109 || _1111;
        bool _1115 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1117 = _1113 || _1115;
        if (!_1117)
        {
            float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1121 = _1061 + _1119;
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1129 = _1127 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1131 = 1.0 / _1125;
            float _1133 = _1121 * _1131;
            float _1135 = fma(_1133, _1129, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1107 = _1135;
            _1095 = _1129;
            _1137 = true;
        }
        else
        {
            bool _1139 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1141 = isnan(_1061);
            bool _1143 = _1139 || _1141;
            bool _1145 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1147 = _1143 || _1145;
            if (!_1147)
            {
                float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1151 = _1061 + _1149;
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1153 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1161 = 1.0 / _1155;
                float _1163 = _1151 * _1161;
                float _1165 = fma(_1163, _1159, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1107 = _1165;
                _1095 = _1159;
                _1137 = true;
            }
            else
            {
                _1107 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1137 = false;
    float _1167 = _1107;
    float _1169 = _1095;
    float _1171 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1173 = _1019 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1177 = _1025 + _1175;
    bool _1179 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan(0.5);
    bool _1187 = _1183 || _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1191 = _1027 + _1189;
    float _1193 = fma(_1173, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1195 = fma(_1177, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1197 = fma(_1191, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1199 = _1169;
    if (_1187)
    {
        _1199 = _1197;
    }
    float _1201 = _1199;
    float _1203 = _1201;
    if (_1187)
    {
        _949 = _1193;
    }
    float _1205 = _949;
    float _1207 = _1205;
    if (_1187)
    {
        _1097 = _1195;
    }
    float _1209 = _1097;
    float _1211 = _1209;
    float _1213 = _1209;
    if (!_1187)
    {
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1217 = _903 + _1215;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1221 = _817 + _1219;
        float _1223 = -_819;
        float _1225 = _1223 + _1195;
        float _1227 = -_817;
        float _1229 = _1227 + _1197;
        float _1231 = _1217 * _1217;
        float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1235 = _819 + _1233;
        float _1237 = -_903;
        float _1239 = _1237 + _1193;
        float _1241 = fma(_1221, _1221, _1231);
        float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1245 = fma(_1235, _1235, _1241);
        float _1247 = sqrt(_1245);
        float _1249 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1251 = _1247 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1253 = isnan(_1247);
        bool _1255 = _1251 || _1253;
        bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1259 = _1255 || _1257;
        float _1261 = precise::min(_1247, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1263 = _1261 * _1243;
        float _1265 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1267 = _1265 * _1263;
        float _1269 = _1205;
        float _1271 = _1265;
        if (_1259)
        {
            float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1269 = _1273;
        }
        float _1275 = _1269;
        if (_1259)
        {
            float _1277 = precise::max(_1247, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1211 = _1277;
        }
        float _1279 = _1211;
        float _1281 = fma(_1225, _1267, _819);
        float _1283 = fma(_1229, _1267, _817);
        float _1285 = _1279;
        float _1287 = _1283;
        if (_1259)
        {
            float _1289 = _1279 * _1275;
            _1285 = _1289;
        }
        float _1291 = _1285;
        float _1293 = fma(_1239, _1267, _903);
        float _1295 = _1291;
        float _1297 = _1293;
        if (_1259)
        {
            float _1299 = _1265 * _1291;
            _1271 = _1299;
        }
        float _1301 = _1271;
        if (!_1259)
        {
            _1295 = _1281;
        }
        float _1303 = _1295;
        _1213 = _1303;
        if (_1259)
        {
            float _1305 = fma(_1229, _1301, _817);
            _1287 = _1305;
        }
        float _1307 = _1287;
        _1203 = _1307;
        if (_1259)
        {
            float _1309 = fma(_1239, _1301, _903);
            _1297 = _1309;
        }
        float _1311 = _1297;
        _1207 = _1311;
        if (_1259)
        {
            float _1313 = fma(_1225, _1301, _819);
            _1213 = _1313;
        }
    }
    float _1315 = _1207;
    float _1317 = _1203;
    float _1319 = _1213;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1323 = _1315 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1327 = _1317 + _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1331 = _1319 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1327, _1327, _1333);
    float _1337 = fma(_1331, _1331, _1335);
    float _1339 = rsqrt(_1337);
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1327 * _1341;
    float _1345 = _1331 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1335;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1343;
    if (_1355)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1369;
    }
    float _1371 = _1361;
    if (_1355)
    {
        float _1373 = rsqrt(_1351);
        _1363 = _1373;
    }
    float _1375 = _1363;
    float _1377 = _1375;
    if (_1355)
    {
        float _1379 = _1359 * _1371;
        _1365 = _1379;
    }
    float _1381 = _1365;
    if (_1355)
    {
        float _1383 = _1381 * 0.15915493667125701904296875;
        _951 = _1383;
    }
    float _1385 = _951;
    float _1387 = _1371;
    if (_1355)
    {
        float _1389 = _1385 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1073;
    float _1401 = _1397;
    if (_1355)
    {
        float _1403 = _1385 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        _1399 = _1405;
    }
    float _1407 = _1399;
    float _1409 = -_1341;
    float _1411 = -_1397;
    float _1413 = fma(_1323, _1409, _1411);
    if (_1355)
    {
        float _1415 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1415;
    }
    float _1417 = _1401;
    float _1419 = sqrt(_1337);
    float _1421 = _1393;
    float _1423 = _1417;
    if (_1355)
    {
        float _1425 = fma(_1393, _1417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1421 = _1425;
    }
    float _1427 = _1421;
    float _1429 = _1427;
    float _1431 = _1407;
    if (_1355)
    {
        float _1433 = _1407 + (-1.0);
        _1423 = _1433;
    }
    float _1435 = _1423;
    float _1437 = _1435;
    if (_1355)
    {
        float _1439 = _1375 * _1427;
        _1099 = _1439;
    }
    float _1441 = _1099;
    if (!_1355)
    {
        _1429 = _1413;
    }
    float _1443 = _1429;
    float _1445 = _1443;
    if (_1355)
    {
        float _1447 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1101 = _1447;
    }
    float _1449 = _1101;
    if (_1355)
    {
        float _1451 = _1343 * _1441;
        _1367 = _1451;
    }
    float _1453 = _1367;
    if (!_1355)
    {
        _1437 = _1345;
    }
    float _1455 = _1437;
    float _1457 = _1455;
    if (_1355)
    {
        float _1459 = _1345 * _1441;
        _1457 = _1459;
    }
    float _1461 = _1457;
    if (!_1355)
    {
        _1377 = _1347;
    }
    float _1463 = _1377;
    float _1465 = _1463;
    if (_1355)
    {
        float _1467 = fma(_1413, _1407, _1449);
        _1445 = _1467;
    }
    float _1469 = _1445;
    if (_1355)
    {
        float _1471 = _1453 * _1453;
        _1465 = _1471;
    }
    float _1473 = _1465;
    if (!_1355)
    {
        _1431 = _1349;
    }
    float _1475 = _1431;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    float _1483 = fma(_1469, _1469, _1473);
    float _1485 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1487 = _1483 + _1481;
    float _1489 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1491);
    float _1495 = precise::clamp(_1493, 0.0, 1.0);
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1499 = rsqrt(_1487);
    float _1501 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1489);
    float _1503 = -_1495;
    float _1505 = _1503 + 1.0;
    float _1507 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1509 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1511 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1501);
    float _1513 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1497);
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1507);
    float _1517 = abs(_1505);
    float _1519 = log2(_1517);
    float _1521 = _1511 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1523 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1513);
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1485);
    float _1527 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1533 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1525);
    float _1535 = _1499 * _1453;
    float _1537 = _1499 * _1469;
    float _1539 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1541 = -_1529;
    float _1543 = fma(_1541, _1509, 1.0);
    float _1545 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1551 = _1499 * _1461;
    float _1553 = -_1545;
    float _1555 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1553);
    float _1557 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1559 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1561 = log2(_1543);
    float _1563 = -_1551;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1555);
    float _1567 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1557);
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1571 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1573 = fma(_1565, -0.5, 0.5);
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1577 = fma(_1565, 0.5, 0.5);
    float _1579 = exp2(_1559);
    float _1581 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1569);
    float _1583 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1571);
    float _1585 = fma(_1577, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1587 = _1537 + 1.0;
    float _1589 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1581);
    float _1591 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1583);
    float _1593 = fma(_1577, _1585, -0.212114393711090087890625);
    float _1595 = 1.0 / _1575;
    float _1597 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1599 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1591);
    float _1601 = _1561 * 0.693147182464599609375;
    float _1603 = fma(_1577, _1593, 1.570728778839111328125);
    float _1605 = sqrt(_1573);
    float _1607 = -_1537;
    float _1609 = fma(_1579, _1587, _1607);
    float _1611 = fma(_1609, 0.5, 0.5);
    float _1613 = _1597 * _1595;
    float _1615 = _1599 * _1595;
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = fma(_1613, 0.5, 0.5);
    float _1621 = fma(_1615, -0.5, 0.5);
    float _1623 = _1605 * 0.636619746685028076171875;
    float _1625 = -_1603;
    float _1627 = fma(_1623, _1625, 1.0);
    float3 _4470 = float3(_1619, _1621, _1617);
    float _1629 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4470, float3(0.0), isnan(_4470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4470, float3(0.0), isnan(_4470)), level(0.0)).x;
    float3 _4481 = float3(_1619, _1621, _1617);
    float4 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4481, float3(0.0), isnan(_4481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4481, float3(0.0), isnan(_4481)), level(0.0)).xyzw;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1632.w;
    float2 _4498 = float2(_1627, _1611);
    float3 _1644 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4498, float2(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4498, float2(0.0), isnan(_4498)), level(0.0)).xyz;
    float _1646 = _1644.x;
    float _1648 = _1644.y;
    float _1650 = _1644.z;
    float _1652 = _903 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1654 = _903 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1656 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1658 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1652);
    float _1660 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1654);
    float _1662 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1658);
    float _1664 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1660);
    float _1666 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1668 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1670 = 1.0 / _1666;
    float _1672 = _1668 + _1666;
    float _1674 = _1672 * _1670;
    float _1676 = _1674 * 0.5;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1680 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1678);
    bool _1682 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan(0.5);
    bool _1690 = _1686 || _1688;
    float _1692 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1694 = 1.0 / _1680;
    float _1696 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1692);
    float _1698 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1696);
    float _1700 = exp2(_1656);
    float _1702 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1698);
    float _1704 = _1539;
    float _1706 = _1696;
    if (_1690)
    {
        _1704 = 1.0;
    }
    float _1708 = _1704;
    float _1710 = _1708;
    if (_1690)
    {
        _1706 = 1.0;
    }
    float _1712 = _1706;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1716 = _1694 * _1714;
    float _1718 = _1712;
    if (!_1690)
    {
        float _1720 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1730 = _1728 * 0.15915493667125701904296875;
        float _1732 = _1722 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = 1.0 / _1726;
        float _1738 = _1730 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = _1734 * _1736;
        float _1744 = _1730 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = _1740 * _1742;
        float _1750 = 1.0 / _1748;
        float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1754 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1752;
        float _1756 = 1.0 / _1754;
        float _1758 = _1746 * _1750;
        float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1762 = fma(_1716, _1758, _1760);
        float _1764 = _1762 * _1756;
        float _1766 = precise::clamp(_1764, 0.0, 1.0);
        _1710 = _1766;
    }
    float _1768 = _1710;
    if (!_1690)
    {
        float _1770 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1772 = _1770 * 0.15915493667125701904296875;
        float _1774 = _1772 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        float _1778 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1780 = _1778 * 0.15915493667125701904296875;
        float _1782 = _1772 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = 1.0 / _1776;
        float _1788 = _1780 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        float _1792 = _1784 * _1786;
        float _1794 = _1780 * 6.283185482025146484375;
        float _1796 = sin(_1794);
        float _1798 = _1790 * _1792;
        float _1800 = 1.0 / _1798;
        float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1804 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1802;
        float _1806 = 1.0 / _1804;
        float _1808 = _1796 * _1800;
        float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1812 = fma(_1716, _1808, _1810);
        float _1814 = _1812 * _1806;
        float _1816 = precise::clamp(_1814, 0.0, 1.0);
        float _1818 = -_1816;
        float _1820 = _1818 + 1.0;
        _1718 = _1820;
    }
    float _1822 = _1718;
    float _1824 = -_1700;
    float _1826 = _1824 + 1.0;
    bool _1828 = _1768 > 0.0;
    bool _1830 = isnan(_1768);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(0.0);
    bool _1836 = _1832 || _1834;
    float _1838 = _1768 * _1822;
    float _1840 = _1575 * 0.5;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1844 = _1822 <= 0.0;
    bool _1846 = !_1836;
    bool _1848 = _1844 || _1846;
    float _1850 = _1702 + _1575;
    float _1852 = _1597 + _1575;
    float _1854 = _1842 * _1629;
    float _1856 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1858 = fma(_1599, -0.5, _1840);
    out.m_66.x = _1327;
    out.m_66.y = _1323;
    out.m_66.z = _1331;
    float _1860 = _1640 * _1854;
    float _1862 = _1650 * _1854;
    float _1864 = -_1842;
    float _1866 = _1864 + 1.0;
    out.gl_Position.x = _1597;
    out.gl_Position.y = _1599;
    out.gl_Position.z = _1702;
    out.gl_Position.w = _1575;
    float _1868 = _1850 * 0.5;
    float _1870 = _1852 * 0.5;
    float _1872 = _1856 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1874 = _1640 * _1866;
    float _1876 = fma(_1646, _1860, _1634);
    float _1878 = fma(_1648, _1860, _1636);
    float _1880 = fma(_1640, _1862, _1638);
    out.m_68.x = _1870;
    out.m_68.y = _1858;
    out.m_68.z = _1868;
    out.m_68.w = _1575;
    out.m_47.x = _1872;
    out.m_70.x = _1876;
    out.m_70.y = _1878;
    out.m_70.z = _1880;
    out.m_70.w = _1874;
    if (!_1848)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1882;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1137 = false;
    bool _463 = false;
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
    float _99 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _95;
    float _103 = _101;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_93)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    float _111 = as_type<float>(_109);
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1942 = as_type<float>(_109);
        out.gl_Position.z = _1942;
    }
    if (!_93)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_89);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
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
    int _143 = 0;
    if (_139)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_147);
        out.gl_Position.z = _2010;
    }
    if (_139)
    {
        return out;
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        _111 = _171;
    }
    float _173 = _111;
    float _175 = _173;
    if (!_165)
    {
        float _177 = _127 * _127;
        float _179 = _177 * 0.5;
        _129 = _179;
    }
    float _181 = _129;
    if (!_165)
    {
        float _183 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_165;
    float _189 = _185;
    float _191 = 0.0;
    float _193 = _151;
    if (!_187)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _155 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _155);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _223;
        _99 = _211;
        _191 = _213;
    }
    float _225 = _189;
    float _227 = _99;
    float _229 = _191;
    bool _231 = !_165;
    float _233 = _229;
    float _235 = _227;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _155 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _243;
        _167 = _255;
    }
    float _257 = _233;
    float _259 = _167;
    float _261 = _257;
    if (!_165)
    {
        _261 = _127;
    }
    float _263 = _261;
    float _265 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263;
    if (!_165)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
    }
    float _271 = _235;
    bool _273 = !_165;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _127 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _127);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_165;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _127 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_259, _151, _265);
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = fma(_331, _151, _333);
    float _343 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_259, _149, _337);
    float _349 = fma(_331, _149, _339);
    float _351 = -_341;
    float _353 = _335 + _351;
    float _355 = fma(_259, _153, _343);
    float _357 = fma(_331, _153, _345);
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = _353 * _353;
    float _365 = in.m_51.w;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = fma(_361, _361, _363);
    float _375 = in.m_44.x;
    float _377 = in.m_44.y;
    float _379 = in.m_44.z;
    float _381 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _385 = fma(_369, _369, _373);
    float _387 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _393 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _395 = sqrt(_385);
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _399 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _401 = fma(_347, _365, _375);
    bool _403 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_395);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_335, _365, _377);
    float _415 = fma(_355, _365, _379);
    float _417 = _391;
    float _419 = _399;
    float _421 = _397;
    float _423 = _389;
    if (!_411)
    {
        bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _427 = !_425;
        if (!_427)
        {
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
            float _447 = _441 * _441;
            float _449 = fma(_443, _443, _447);
            float _451 = fma(_445, _445, _449);
            float _453 = rsqrt(_451);
            float _455 = _453 * 9.9999999747524270787835121154785e-07;
            float _457 = _443 * _455;
            float _459 = _441 * _455;
            float _461 = _445 * _455;
            _417 = _459;
            _419 = _457;
            _421 = _461;
            _193 = _441;
            _463 = true;
        }
        else
        {
            float _465 = _151 * _151;
            float _467 = fma(_149, _149, _465);
            float _469 = fma(_153, _153, _467);
            float _471 = sqrt(_469);
            bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
            bool _475 = isnan(_471);
            bool _477 = _473 || _475;
            bool _479 = isnan(9.9999999747524270787835121154785e-07);
            bool _481 = _477 || _479;
            if (!_481)
            {
                float _483 = _377 * _377;
                float _485 = fma(_375, _375, _483);
                float _487 = fma(_379, _379, _485);
                float _489 = sqrt(_487);
                bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
                bool _493 = isnan(_489);
                bool _495 = _491 || _493;
                bool _497 = isnan(9.9999999747524270787835121154785e-07);
                bool _499 = _495 || _497;
                if (!_499)
                {
                    float _501 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _501);
                    float _505 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _503);
                    float _507 = rsqrt(_505);
                    float _509 = _507 * 9.9999999747524270787835121154785e-07;
                    float _511 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _417 = _513;
                    _419 = _511;
                    _421 = _515;
                    _193 = (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    _463 = true;
                }
                else
                {
                    float _517 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _523 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
                    float _525 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _519);
                    float _527 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
                    float _529 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
                    float _531 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
                    float _533 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
                    float _535 = _529 * _529;
                    float _537 = fma(_531, _531, _535);
                    float _539 = fma(_533, _533, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _531 * _543;
                    float _547 = _529 * _543;
                    float _549 = _533 * _543;
                    _417 = _547;
                    _419 = _545;
                    _421 = _549;
                    _193 = _531;
                    _463 = true;
                }
            }
            else
            {
                float _551 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _553 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _555 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _557 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                float _559 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                float _563 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                float _565 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                float _567 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                float _569 = _563 * _563;
                float _571 = fma(_565, _565, _569);
                float _573 = fma(_567, _567, _571);
                float _575 = rsqrt(_573);
                float _577 = _575 * 9.9999999747524270787835121154785e-07;
                float _579 = _565 * _577;
                float _581 = _563 * _577;
                float _583 = _567 * _577;
                _417 = _581;
                _419 = _579;
                _421 = _583;
                _193 = _567;
            }
        }
    }
    _463 = false;
    float _585 = _417;
    float _587 = _419;
    float _589 = _421;
    float _591 = _193;
    float _593 = _585 * _585;
    float _595 = as_type<float>(int(gl_VertexIndex));
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _601 = _599 != 0;
    float _603 = fma(_587, _587, _593);
    float _605 = in.m_56.w;
    float _607 = fma(_589, _589, _603);
    float _609 = in.m_56.z;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _613 = in.m_51.x;
    float _615 = in.m_51.y;
    float _617 = _591;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_601)
    {
        float _621 = in.m_56.y;
        _617 = _621;
    }
    float _623 = _617;
    float _625 = rsqrt(_607);
    float _627 = in.m_56.x;
    int _629 = as_type<int>(_595) & 1;
    bool _631 = _629 != 0;
    int _633 = as_type<int>(_595) & 2;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _643 = _641 != 0;
    bool _645 = _605 > 0.5;
    bool _647 = !_631;
    float _649 = _647 ? (-0.5) : 0.5;
    bool _651 = _609 > 0.5;
    float _653 = _625 * _589;
    float _655 = _625 * _587;
    float _657 = _625 * _585;
    float _659 = _609;
    if (!_601)
    {
        _423 = _609;
    }
    float _661 = _423;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _665 = _653 * _663;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _669 = _667 != 0;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _673 = _657 * _671;
    float _675 = _661;
    if (!_601)
    {
        _619 = _623;
    }
    float _677 = _619;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _681 = -_665;
    float _683 = fma(_655, _679, _681);
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _687 = _655 * _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _691 = -_673;
    float _693 = fma(_653, _689, _691);
    bool _695 = !_635;
    float _697 = _695 ? (-0.5) : 0.5;
    float _699 = _683 * _683;
    float _701 = _677;
    float _703 = _623;
    if (_601)
    {
        float _705 = in.m_56.x;
        float _707 = in.m_56.y;
        _701 = _705;
        _703 = _707;
    }
    float _709 = _701;
    float _711 = _703;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _715 = -_687;
    float _717 = fma(_657, _713, _715);
    float _719 = _615 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = fma(_693, _693, _699);
    float _723 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _725 = _613 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = fma(_717, _717, _721);
    float _731 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = -_697;
    int _737 = _645 ? as_type<int>(_735) : as_type<int>(_697);
    float _739 = rsqrt(_729);
    bool _741 = _627 > 0.5;
    float _743 = _697 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _745 = -_649;
    int _747 = _741 ? as_type<int>(_745) : as_type<int>(_649);
    float _749 = _655 * _743;
    if (_601)
    {
        _675 = _711;
    }
    float _751 = _675;
    float _753 = _709 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_601)
    {
        _659 = _711;
    }
    float _755 = _659;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _759 = _757 != 0;
    float _761 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _763 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _765 = _711 > 0.5;
    float _767 = _751 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _769 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _761);
    float _771 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _763);
    float _773 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _731);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _697);
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _649);
    float _779 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _769);
    float _781 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _771);
    float _783 = _727 * _775;
    float _785 = _693 * _739;
    float _787 = _733 * _777;
    float _789 = _717 * _739;
    float _791 = _683 * _739;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _795 = _783 * _653;
    float _797 = _657 * _789;
    float _799 = _783 * _655;
    float _801 = _655 * _791;
    float _803 = fma(_787, _789, _795);
    float _805 = -_797;
    float _807 = fma(_653, _791, _805);
    float _809 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _811 = fma(_787, _785, _799);
    float _813 = -_801;
    float _815 = fma(_657, _785, _813);
    float _817 = _773 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _819 = _781 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _821 = fma(_809, _807, _811);
    float _823 = fma(_809, _815, _803);
    float _825 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].w, _793);
    float _827 = _817 + _821;
    float _829 = _819 + _823;
    float _831 = _783 * _657;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _837 = _827 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _829 + _839;
    float _843 = fma(_787, _791, _831);
    float _845 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[83].z, _833);
    float _847 = _837 * _837;
    float _849 = _841 * _841;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _855 = -_649;
    int _857 = _651 ? as_type<int>(_855) : as_type<int>(_649);
    float _859 = _847 + _849;
    float _861 = -_851;
    float _863 = fma(_753, 2.0, _861);
    float _865 = -_697;
    int _867 = _765 ? as_type<int>(_865) : as_type<int>(_697);
    float _869 = fma(_767, -2.0, _853);
    float _871 = sqrt(_859);
    bool _873 = !_643;
    float _875 = _873 ? _697 : as_type<float>(_737);
    float _877 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _845);
    bool _879 = !_669;
    float _881 = _879 ? _697 : as_type<float>(_867);
    float _883 = _653 * _785;
    float _885 = -_127;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[81].x, _863);
    float _889 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _869);
    float _891 = _597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _893 = -_883;
    float _895 = fma(_655, _789, _893);
    float _897 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _825);
    bool _899 = !_639;
    float _901 = _899 ? _649 : as_type<float>(_857);
    float _903 = _779 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _905 = fma(_809, _895, _843);
    bool _907 = !_759;
    float _909 = _907 ? _649 : as_type<float>(_747);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _901 + 0.5;
    bool _915 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _917 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _919 = _611 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _921 = _875 + (-0.5);
    float _923 = fma(_891, _913, _887);
    float _925 = _903 + _905;
    float _927 = _657 * _743;
    float _929 = -_919;
    float _931 = -_889;
    float _933 = fma(_929, _921, _931);
    float _935 = fma(_785, _917, _749);
    float _937 = _653 * _743;
    float _939 = _887;
    float _941 = _849;
    float _943 = _785;
    float _945 = _847;
    float _947 = _827;
    float _949 = _789;
    float _951 = _895;
    if (!_915)
    {
        _939 = _849;
    }
    float _953 = _939;
    float _955 = _953;
    if (!_915)
    {
        _941 = _847;
    }
    float _957 = _941;
    float _959 = _957;
    if (!_915)
    {
        _943 = _829;
    }
    float _961 = _943;
    float _963 = _961;
    if (!_915)
    {
        _945 = _925;
    }
    float _965 = _945;
    bool _967 = !_915;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _871 + _973;
        float _977 = _925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_859);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _979 * _993;
        float _997 = fma(_837, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _999 = _991 + (-1.0);
        float _1001 = fma(_841, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1005 = _997 + _1003;
        float _1007 = _999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = _1005 * _1005;
        float _1015 = fma(_925, _991, _1007);
        float _1017 = _1011 * _1011;
        _969 = _1015;
        _959 = _1013;
        _955 = _1017;
        _963 = _1001;
        _947 = _997;
    }
    float _1019 = _969;
    float _1021 = _959;
    float _1023 = _955;
    float _1025 = _963;
    float _1027 = _947;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _909 + 0.5;
    float _1037 = fma(_791, _917, _927);
    float _1039 = fma(_1031, _1031, _1021);
    float _1041 = -_877;
    float _1043 = _1041 + 1.0;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1047 = -_881;
    float _1049 = _1047 + 0.5;
    float _1051 = _1039 + _1023;
    float _1053 = -_1043;
    float _1055 = fma(_901, _1053, _923);
    float _1057 = _1045 * _911;
    float _1059 = fma(_789, _917, _937);
    float _1061 = sqrt(_1051);
    float _1063 = -_897;
    float _1065 = _1063 + 1.0;
    float _1067 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1069 = _807 + _935;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1073 = fma(_875, _1065, _933);
    float _1075 = _1067 * _1033;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1079 = _895 + _1037;
    float _1081 = _815 + _1059;
    out.m_58.w = _1071;
    out.m_60.w = _1077;
    bool _1083 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1085 = isnan(_1061);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1091 = _1087 || _1089;
    out.m_62.x = _1057;
    out.m_62.y = _1075;
    out.m_62.z = _1055;
    out.m_62.w = _1073;
    out.m_64.x = _1069;
    out.m_64.y = _1079;
    out.m_64.z = _1081;
    float _1093 = _1037;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1097 = _1077;
    float _1099 = _1049;
    float _1101 = _1027;
    if (!_1091)
    {
        _1093 = 1.0;
    }
    float _1103 = _1093;
    bool _1105 = !_1091;
    float _1107 = _1103;
    if (!_1105)
    {
        bool _1109 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1111 = isnan(_1061);
        bool _1113 = _1109 || _1111;
        bool _1115 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1117 = _1113 || _1115;
        if (!_1117)
        {
            float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1121 = _1061 + _1119;
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1129 = _1127 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1131 = 1.0 / _1125;
            float _1133 = _1121 * _1131;
            float _1135 = fma(_1133, _1129, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1107 = _1135;
            _1095 = _1129;
            _1137 = true;
        }
        else
        {
            bool _1139 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1141 = isnan(_1061);
            bool _1143 = _1139 || _1141;
            bool _1145 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1147 = _1143 || _1145;
            if (!_1147)
            {
                float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1151 = _1061 + _1149;
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1153 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1161 = 1.0 / _1155;
                float _1163 = _1151 * _1161;
                float _1165 = fma(_1163, _1159, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1107 = _1165;
                _1095 = _1159;
                _1137 = true;
            }
            else
            {
                _1107 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1137 = false;
    float _1167 = _1107;
    float _1169 = _1095;
    float _1171 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1173 = _1019 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1177 = _1025 + _1175;
    bool _1179 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan(0.5);
    bool _1187 = _1183 || _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1191 = _1027 + _1189;
    float _1193 = fma(_1173, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1195 = fma(_1177, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1197 = fma(_1191, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1199 = _1169;
    if (_1187)
    {
        _1199 = _1197;
    }
    float _1201 = _1199;
    float _1203 = _1201;
    if (_1187)
    {
        _949 = _1193;
    }
    float _1205 = _949;
    float _1207 = _1205;
    if (_1187)
    {
        _1097 = _1195;
    }
    float _1209 = _1097;
    float _1211 = _1209;
    float _1213 = _1209;
    if (!_1187)
    {
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1217 = _903 + _1215;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1221 = _817 + _1219;
        float _1223 = -_819;
        float _1225 = _1223 + _1195;
        float _1227 = -_817;
        float _1229 = _1227 + _1197;
        float _1231 = _1217 * _1217;
        float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1235 = _819 + _1233;
        float _1237 = -_903;
        float _1239 = _1237 + _1193;
        float _1241 = fma(_1221, _1221, _1231);
        float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1245 = fma(_1235, _1235, _1241);
        float _1247 = sqrt(_1245);
        float _1249 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1251 = _1247 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1253 = isnan(_1247);
        bool _1255 = _1251 || _1253;
        bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1259 = _1255 || _1257;
        float _1261 = precise::min(_1247, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1263 = _1261 * _1243;
        float _1265 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1267 = _1265 * _1263;
        float _1269 = _1205;
        float _1271 = _1265;
        if (_1259)
        {
            float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1269 = _1273;
        }
        float _1275 = _1269;
        if (_1259)
        {
            float _1277 = precise::max(_1247, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1211 = _1277;
        }
        float _1279 = _1211;
        float _1281 = fma(_1225, _1267, _819);
        float _1283 = fma(_1229, _1267, _817);
        float _1285 = _1279;
        float _1287 = _1283;
        if (_1259)
        {
            float _1289 = _1279 * _1275;
            _1285 = _1289;
        }
        float _1291 = _1285;
        float _1293 = fma(_1239, _1267, _903);
        float _1295 = _1291;
        float _1297 = _1293;
        if (_1259)
        {
            float _1299 = _1265 * _1291;
            _1271 = _1299;
        }
        float _1301 = _1271;
        if (!_1259)
        {
            _1295 = _1281;
        }
        float _1303 = _1295;
        _1213 = _1303;
        if (_1259)
        {
            float _1305 = fma(_1229, _1301, _817);
            _1287 = _1305;
        }
        float _1307 = _1287;
        _1203 = _1307;
        if (_1259)
        {
            float _1309 = fma(_1239, _1301, _903);
            _1297 = _1309;
        }
        float _1311 = _1297;
        _1207 = _1311;
        if (_1259)
        {
            float _1313 = fma(_1225, _1301, _819);
            _1213 = _1313;
        }
    }
    float _1315 = _1207;
    float _1317 = _1203;
    float _1319 = _1213;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1323 = _1315 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1327 = _1317 + _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1331 = _1319 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1327, _1327, _1333);
    float _1337 = fma(_1331, _1331, _1335);
    float _1339 = rsqrt(_1337);
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1327 * _1341;
    float _1345 = _1331 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1335;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1343;
    if (_1355)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1369;
    }
    float _1371 = _1361;
    if (_1355)
    {
        float _1373 = rsqrt(_1351);
        _1363 = _1373;
    }
    float _1375 = _1363;
    float _1377 = _1375;
    if (_1355)
    {
        float _1379 = _1359 * _1371;
        _1365 = _1379;
    }
    float _1381 = _1365;
    if (_1355)
    {
        float _1383 = _1381 * 0.15915493667125701904296875;
        _951 = _1383;
    }
    float _1385 = _951;
    float _1387 = _1371;
    if (_1355)
    {
        float _1389 = _1385 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1073;
    float _1401 = _1397;
    if (_1355)
    {
        float _1403 = _1385 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        _1399 = _1405;
    }
    float _1407 = _1399;
    float _1409 = -_1341;
    float _1411 = -_1397;
    float _1413 = fma(_1323, _1409, _1411);
    if (_1355)
    {
        float _1415 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1415;
    }
    float _1417 = _1401;
    float _1419 = sqrt(_1337);
    float _1421 = _1393;
    float _1423 = _1417;
    if (_1355)
    {
        float _1425 = fma(_1393, _1417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1421 = _1425;
    }
    float _1427 = _1421;
    float _1429 = _1427;
    float _1431 = _1407;
    if (_1355)
    {
        float _1433 = _1407 + (-1.0);
        _1423 = _1433;
    }
    float _1435 = _1423;
    float _1437 = _1435;
    if (_1355)
    {
        float _1439 = _1375 * _1427;
        _1099 = _1439;
    }
    float _1441 = _1099;
    if (!_1355)
    {
        _1429 = _1413;
    }
    float _1443 = _1429;
    float _1445 = _1443;
    if (_1355)
    {
        float _1447 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1101 = _1447;
    }
    float _1449 = _1101;
    if (_1355)
    {
        float _1451 = _1343 * _1441;
        _1367 = _1451;
    }
    float _1453 = _1367;
    if (!_1355)
    {
        _1437 = _1345;
    }
    float _1455 = _1437;
    float _1457 = _1455;
    if (_1355)
    {
        float _1459 = _1345 * _1441;
        _1457 = _1459;
    }
    float _1461 = _1457;
    if (!_1355)
    {
        _1377 = _1347;
    }
    float _1463 = _1377;
    float _1465 = _1463;
    if (_1355)
    {
        float _1467 = fma(_1413, _1407, _1449);
        _1445 = _1467;
    }
    float _1469 = _1445;
    if (_1355)
    {
        float _1471 = _1453 * _1453;
        _1465 = _1471;
    }
    float _1473 = _1465;
    if (!_1355)
    {
        _1431 = _1349;
    }
    float _1475 = _1431;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    float _1483 = fma(_1469, _1469, _1473);
    float _1485 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1487 = _1483 + _1481;
    float _1489 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1491);
    float _1495 = precise::clamp(_1493, 0.0, 1.0);
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1499 = rsqrt(_1487);
    float _1501 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1489);
    float _1503 = -_1495;
    float _1505 = _1503 + 1.0;
    float _1507 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1509 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1511 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1501);
    float _1513 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1497);
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1507);
    float _1517 = abs(_1505);
    float _1519 = log2(_1517);
    float _1521 = _1511 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1523 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1513);
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1485);
    float _1527 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1533 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1525);
    float _1535 = _1499 * _1453;
    float _1537 = _1499 * _1469;
    float _1539 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1541 = -_1529;
    float _1543 = fma(_1541, _1509, 1.0);
    float _1545 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1551 = _1499 * _1461;
    float _1553 = -_1545;
    float _1555 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1553);
    float _1557 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1559 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1561 = log2(_1543);
    float _1563 = -_1551;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1555);
    float _1567 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1557);
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1571 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1573 = fma(_1565, -0.5, 0.5);
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1577 = fma(_1565, 0.5, 0.5);
    float _1579 = exp2(_1559);
    float _1581 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1569);
    float _1583 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1571);
    float _1585 = fma(_1577, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1587 = _1537 + 1.0;
    float _1589 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1581);
    float _1591 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1583);
    float _1593 = fma(_1577, _1585, -0.212114393711090087890625);
    float _1595 = 1.0 / _1575;
    float _1597 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1599 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1591);
    float _1601 = _1561 * 0.693147182464599609375;
    float _1603 = fma(_1577, _1593, 1.570728778839111328125);
    float _1605 = sqrt(_1573);
    float _1607 = -_1537;
    float _1609 = fma(_1579, _1587, _1607);
    float _1611 = fma(_1609, 0.5, 0.5);
    float _1613 = _1597 * _1595;
    float _1615 = _1599 * _1595;
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = fma(_1613, 0.5, 0.5);
    float _1621 = fma(_1615, -0.5, 0.5);
    float _1623 = _1605 * 0.636619746685028076171875;
    float _1625 = -_1603;
    float _1627 = fma(_1623, _1625, 1.0);
    float3 _4470 = float3(_1619, _1621, _1617);
    float _1629 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4470, float3(0.0), isnan(_4470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4470, float3(0.0), isnan(_4470)), level(0.0)).x;
    float3 _4481 = float3(_1619, _1621, _1617);
    float4 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4481, float3(0.0), isnan(_4481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4481, float3(0.0), isnan(_4481)), level(0.0)).xyzw;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1632.w;
    float2 _4498 = float2(_1627, _1611);
    float3 _1644 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4498, float2(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4498, float2(0.0), isnan(_4498)), level(0.0)).xyz;
    float _1646 = _1644.x;
    float _1648 = _1644.y;
    float _1650 = _1644.z;
    float _1652 = _903 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1654 = _903 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1656 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1658 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1652);
    float _1660 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1654);
    float _1662 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1658);
    float _1664 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1660);
    float _1666 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1668 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1670 = 1.0 / _1666;
    float _1672 = _1668 + _1666;
    float _1674 = _1672 * _1670;
    float _1676 = _1674 * 0.5;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1680 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1678);
    bool _1682 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan(0.5);
    bool _1690 = _1686 || _1688;
    float _1692 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1694 = 1.0 / _1680;
    float _1696 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1692);
    float _1698 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1696);
    float _1700 = exp2(_1656);
    float _1702 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1698);
    float _1704 = _1539;
    float _1706 = _1696;
    if (_1690)
    {
        _1704 = 1.0;
    }
    float _1708 = _1704;
    float _1710 = _1708;
    if (_1690)
    {
        _1706 = 1.0;
    }
    float _1712 = _1706;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1716 = _1694 * _1714;
    float _1718 = _1712;
    if (!_1690)
    {
        float _1720 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1730 = _1728 * 0.15915493667125701904296875;
        float _1732 = _1722 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = 1.0 / _1726;
        float _1738 = _1730 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = _1734 * _1736;
        float _1744 = _1730 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = _1740 * _1742;
        float _1750 = 1.0 / _1748;
        float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1754 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1752;
        float _1756 = 1.0 / _1754;
        float _1758 = _1746 * _1750;
        float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1762 = fma(_1716, _1758, _1760);
        float _1764 = _1762 * _1756;
        float _1766 = precise::clamp(_1764, 0.0, 1.0);
        _1710 = _1766;
    }
    float _1768 = _1710;
    if (!_1690)
    {
        float _1770 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1772 = _1770 * 0.15915493667125701904296875;
        float _1774 = _1772 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        float _1778 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1780 = _1778 * 0.15915493667125701904296875;
        float _1782 = _1772 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = 1.0 / _1776;
        float _1788 = _1780 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        float _1792 = _1784 * _1786;
        float _1794 = _1780 * 6.283185482025146484375;
        float _1796 = sin(_1794);
        float _1798 = _1790 * _1792;
        float _1800 = 1.0 / _1798;
        float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1804 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1802;
        float _1806 = 1.0 / _1804;
        float _1808 = _1796 * _1800;
        float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1812 = fma(_1716, _1808, _1810);
        float _1814 = _1812 * _1806;
        float _1816 = precise::clamp(_1814, 0.0, 1.0);
        float _1818 = -_1816;
        float _1820 = _1818 + 1.0;
        _1718 = _1820;
    }
    float _1822 = _1718;
    float _1824 = -_1700;
    float _1826 = _1824 + 1.0;
    bool _1828 = _1768 > 0.0;
    bool _1830 = isnan(_1768);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(0.0);
    bool _1836 = _1832 || _1834;
    float _1838 = _1768 * _1822;
    float _1840 = _1575 * 0.5;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1844 = _1822 <= 0.0;
    bool _1846 = !_1836;
    bool _1848 = _1844 || _1846;
    float _1850 = _1702 + _1575;
    float _1852 = _1597 + _1575;
    float _1854 = _1842 * _1629;
    float _1856 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1858 = fma(_1599, -0.5, _1840);
    out.m_66.x = _1327;
    out.m_66.y = _1323;
    out.m_66.z = _1331;
    float _1860 = _1640 * _1854;
    float _1862 = _1650 * _1854;
    float _1864 = -_1842;
    float _1866 = _1864 + 1.0;
    out.gl_Position.x = _1597;
    out.gl_Position.y = _1599;
    out.gl_Position.z = _1702;
    out.gl_Position.w = _1575;
    float _1868 = _1850 * 0.5;
    float _1870 = _1852 * 0.5;
    float _1872 = _1856 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1874 = _1640 * _1866;
    float _1876 = fma(_1646, _1860, _1634);
    float _1878 = fma(_1648, _1860, _1636);
    float _1880 = fma(_1640, _1862, _1638);
    out.m_68.x = _1870;
    out.m_68.y = _1858;
    out.m_68.z = _1868;
    out.m_68.w = _1575;
    out.m_47.x = _1872;
    out.m_70.x = _1876;
    out.m_70.y = _1878;
    out.m_70.z = _1880;
    out.m_70.w = _1874;
    if (!_1848)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1882;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1137 = false;
    bool _463 = false;
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
    float _99 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _95;
    float _103 = _101;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_93)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    float _111 = as_type<float>(_109);
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1942 = as_type<float>(_109);
        out.gl_Position.z = _1942;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_89);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
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
    int _143 = 0;
    if (_139)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_147);
        out.gl_Position.z = _2010;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    float _155 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        _111 = _171;
    }
    float _173 = _111;
    float _175 = _173;
    if (!_165)
    {
        float _177 = _127 * _127;
        float _179 = _177 * 0.5;
        _129 = _179;
    }
    float _181 = _129;
    if (!_165)
    {
        float _183 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_165;
    float _189 = _185;
    float _191 = 0.0;
    float _193 = _151;
    if (!_187)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _155 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _155);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _223;
        _99 = _211;
        _191 = _213;
    }
    float _225 = _189;
    float _227 = _99;
    float _229 = _191;
    bool _231 = !_165;
    float _233 = _229;
    float _235 = _227;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _155 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _243;
        _167 = _255;
    }
    float _257 = _233;
    float _259 = _167;
    float _261 = _257;
    if (!_165)
    {
        _261 = _127;
    }
    float _263 = _261;
    float _265 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263;
    if (!_165)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
    }
    float _271 = _235;
    bool _273 = !_165;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _127 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _127);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_165;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _127 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_259, _151, _265);
    float _337 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = fma(_331, _151, _333);
    float _343 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_259, _149, _337);
    float _349 = fma(_331, _149, _339);
    float _351 = -_341;
    float _353 = _335 + _351;
    float _355 = fma(_259, _153, _343);
    float _357 = fma(_331, _153, _345);
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = _353 * _353;
    float _365 = in.m_51.w;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = fma(_361, _361, _363);
    float _375 = in.m_44.x;
    float _377 = in.m_44.y;
    float _379 = in.m_44.z;
    float _381 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _385 = fma(_369, _369, _373);
    float _387 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _393 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _395 = sqrt(_385);
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _399 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _401 = fma(_347, _365, _375);
    bool _403 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_395);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_335, _365, _377);
    float _415 = fma(_355, _365, _379);
    float _417 = _391;
    float _419 = _399;
    float _421 = _397;
    float _423 = _389;
    if (!_411)
    {
        bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _427 = !_425;
        if (!_427)
        {
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _433 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
            float _447 = _441 * _441;
            float _449 = fma(_443, _443, _447);
            float _451 = fma(_445, _445, _449);
            float _453 = rsqrt(_451);
            float _455 = _453 * 9.9999999747524270787835121154785e-07;
            float _457 = _443 * _455;
            float _459 = _441 * _455;
            float _461 = _445 * _455;
            _417 = _459;
            _419 = _457;
            _421 = _461;
            _193 = _441;
            _463 = true;
        }
        else
        {
            float _465 = _151 * _151;
            float _467 = fma(_149, _149, _465);
            float _469 = fma(_153, _153, _467);
            float _471 = sqrt(_469);
            bool _473 = _471 >= 9.9999999747524270787835121154785e-07;
            bool _475 = isnan(_471);
            bool _477 = _473 || _475;
            bool _479 = isnan(9.9999999747524270787835121154785e-07);
            bool _481 = _477 || _479;
            if (!_481)
            {
                float _483 = _377 * _377;
                float _485 = fma(_375, _375, _483);
                float _487 = fma(_379, _379, _485);
                float _489 = sqrt(_487);
                bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
                bool _493 = isnan(_489);
                bool _495 = _491 || _493;
                bool _497 = isnan(9.9999999747524270787835121154785e-07);
                bool _499 = _495 || _497;
                if (!_499)
                {
                    float _501 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _501);
                    float _505 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _503);
                    float _507 = rsqrt(_505);
                    float _509 = _507 * 9.9999999747524270787835121154785e-07;
                    float _511 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _513 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _417 = _513;
                    _419 = _511;
                    _421 = _515;
                    _193 = (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    _463 = true;
                }
                else
                {
                    float _517 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _519 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _523 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
                    float _525 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _519);
                    float _527 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _521);
                    float _529 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _523);
                    float _531 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _525);
                    float _533 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
                    float _535 = _529 * _529;
                    float _537 = fma(_531, _531, _535);
                    float _539 = fma(_533, _533, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _531 * _543;
                    float _547 = _529 * _543;
                    float _549 = _533 * _543;
                    _417 = _547;
                    _419 = _545;
                    _421 = _549;
                    _193 = _531;
                    _463 = true;
                }
            }
            else
            {
                float _551 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _553 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _555 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _557 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                float _559 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                float _563 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                float _565 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                float _567 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                float _569 = _563 * _563;
                float _571 = fma(_565, _565, _569);
                float _573 = fma(_567, _567, _571);
                float _575 = rsqrt(_573);
                float _577 = _575 * 9.9999999747524270787835121154785e-07;
                float _579 = _565 * _577;
                float _581 = _563 * _577;
                float _583 = _567 * _577;
                _417 = _581;
                _419 = _579;
                _421 = _583;
                _193 = _567;
            }
        }
    }
    _463 = false;
    float _585 = _417;
    float _587 = _419;
    float _589 = _421;
    float _591 = _193;
    float _593 = _585 * _585;
    float _595 = as_type<float>(int(gl_VertexIndex));
    float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _601 = _599 != 0;
    float _603 = fma(_587, _587, _593);
    float _605 = in.m_56.w;
    float _607 = fma(_589, _589, _603);
    float _609 = in.m_56.z;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _613 = in.m_51.x;
    float _615 = in.m_51.y;
    float _617 = _591;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_601)
    {
        float _621 = in.m_56.y;
        _617 = _621;
    }
    float _623 = _617;
    float _625 = rsqrt(_607);
    float _627 = in.m_56.x;
    int _629 = as_type<int>(_595) & 1;
    bool _631 = _629 != 0;
    int _633 = as_type<int>(_595) & 2;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _643 = _641 != 0;
    bool _645 = _605 > 0.5;
    bool _647 = !_631;
    float _649 = _647 ? (-0.5) : 0.5;
    bool _651 = _609 > 0.5;
    float _653 = _625 * _589;
    float _655 = _625 * _587;
    float _657 = _625 * _585;
    float _659 = _609;
    if (!_601)
    {
        _423 = _609;
    }
    float _661 = _423;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _665 = _653 * _663;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _669 = _667 != 0;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _673 = _657 * _671;
    float _675 = _661;
    if (!_601)
    {
        _619 = _623;
    }
    float _677 = _619;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _681 = -_665;
    float _683 = fma(_655, _679, _681);
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _687 = _655 * _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _691 = -_673;
    float _693 = fma(_653, _689, _691);
    bool _695 = !_635;
    float _697 = _695 ? (-0.5) : 0.5;
    float _699 = _683 * _683;
    float _701 = _677;
    float _703 = _623;
    if (_601)
    {
        float _705 = in.m_56.x;
        float _707 = in.m_56.y;
        _701 = _705;
        _703 = _707;
    }
    float _709 = _701;
    float _711 = _703;
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _715 = -_687;
    float _717 = fma(_657, _713, _715);
    float _719 = _615 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = fma(_693, _693, _699);
    float _723 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _725 = _613 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = fma(_717, _717, _721);
    float _731 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = -_697;
    int _737 = _645 ? as_type<int>(_735) : as_type<int>(_697);
    float _739 = rsqrt(_729);
    bool _741 = _627 > 0.5;
    float _743 = _697 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _745 = -_649;
    int _747 = _741 ? as_type<int>(_745) : as_type<int>(_649);
    float _749 = _655 * _743;
    if (_601)
    {
        _675 = _711;
    }
    float _751 = _675;
    float _753 = _709 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_601)
    {
        _659 = _711;
    }
    float _755 = _659;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _759 = _757 != 0;
    float _761 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _763 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _765 = _711 > 0.5;
    float _767 = _751 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _769 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _761);
    float _771 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _763);
    float _773 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _731);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _697);
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _649);
    float _779 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _769);
    float _781 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _771);
    float _783 = _727 * _775;
    float _785 = _693 * _739;
    float _787 = _733 * _777;
    float _789 = _717 * _739;
    float _791 = _683 * _739;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _795 = _783 * _653;
    float _797 = _657 * _789;
    float _799 = _783 * _655;
    float _801 = _655 * _791;
    float _803 = fma(_787, _789, _795);
    float _805 = -_797;
    float _807 = fma(_653, _791, _805);
    float _809 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _811 = fma(_787, _785, _799);
    float _813 = -_801;
    float _815 = fma(_657, _785, _813);
    float _817 = _773 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _819 = _781 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _821 = fma(_809, _807, _811);
    float _823 = fma(_809, _815, _803);
    float _825 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].w, _793);
    float _827 = _817 + _821;
    float _829 = _819 + _823;
    float _831 = _783 * _657;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _837 = _827 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _829 + _839;
    float _843 = fma(_787, _791, _831);
    float _845 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[83].z, _833);
    float _847 = _837 * _837;
    float _849 = _841 * _841;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _855 = -_649;
    int _857 = _651 ? as_type<int>(_855) : as_type<int>(_649);
    float _859 = _847 + _849;
    float _861 = -_851;
    float _863 = fma(_753, 2.0, _861);
    float _865 = -_697;
    int _867 = _765 ? as_type<int>(_865) : as_type<int>(_697);
    float _869 = fma(_767, -2.0, _853);
    float _871 = sqrt(_859);
    bool _873 = !_643;
    float _875 = _873 ? _697 : as_type<float>(_737);
    float _877 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _845);
    bool _879 = !_669;
    float _881 = _879 ? _697 : as_type<float>(_867);
    float _883 = _653 * _785;
    float _885 = -_127;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[81].x, _863);
    float _889 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _869);
    float _891 = _597 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _893 = -_883;
    float _895 = fma(_655, _789, _893);
    float _897 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _825);
    bool _899 = !_639;
    float _901 = _899 ? _649 : as_type<float>(_857);
    float _903 = _779 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _905 = fma(_809, _895, _843);
    bool _907 = !_759;
    float _909 = _907 ? _649 : as_type<float>(_747);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _901 + 0.5;
    bool _915 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _917 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _919 = _611 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _921 = _875 + (-0.5);
    float _923 = fma(_891, _913, _887);
    float _925 = _903 + _905;
    float _927 = _657 * _743;
    float _929 = -_919;
    float _931 = -_889;
    float _933 = fma(_929, _921, _931);
    float _935 = fma(_785, _917, _749);
    float _937 = _653 * _743;
    float _939 = _887;
    float _941 = _849;
    float _943 = _785;
    float _945 = _847;
    float _947 = _827;
    float _949 = _789;
    float _951 = _895;
    if (!_915)
    {
        _939 = _849;
    }
    float _953 = _939;
    float _955 = _953;
    if (!_915)
    {
        _941 = _847;
    }
    float _957 = _941;
    float _959 = _957;
    if (!_915)
    {
        _943 = _829;
    }
    float _961 = _943;
    float _963 = _961;
    if (!_915)
    {
        _945 = _925;
    }
    float _965 = _945;
    bool _967 = !_915;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _871 + _973;
        float _977 = _925 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = rsqrt(_859);
        float _981 = _975 * _971;
        float _983 = _981 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _979 * _993;
        float _997 = fma(_837, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _999 = _991 + (-1.0);
        float _1001 = fma(_841, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1005 = _997 + _1003;
        float _1007 = _999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = _1005 * _1005;
        float _1015 = fma(_925, _991, _1007);
        float _1017 = _1011 * _1011;
        _969 = _1015;
        _959 = _1013;
        _955 = _1017;
        _963 = _1001;
        _947 = _997;
    }
    float _1019 = _969;
    float _1021 = _959;
    float _1023 = _955;
    float _1025 = _963;
    float _1027 = _947;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1035 = _909 + 0.5;
    float _1037 = fma(_791, _917, _927);
    float _1039 = fma(_1031, _1031, _1021);
    float _1041 = -_877;
    float _1043 = _1041 + 1.0;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1047 = -_881;
    float _1049 = _1047 + 0.5;
    float _1051 = _1039 + _1023;
    float _1053 = -_1043;
    float _1055 = fma(_901, _1053, _923);
    float _1057 = _1045 * _911;
    float _1059 = fma(_789, _917, _937);
    float _1061 = sqrt(_1051);
    float _1063 = -_897;
    float _1065 = _1063 + 1.0;
    float _1067 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1069 = _807 + _935;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1073 = fma(_875, _1065, _933);
    float _1075 = _1067 * _1033;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1079 = _895 + _1037;
    float _1081 = _815 + _1059;
    out.m_58.w = _1071;
    out.m_60.w = _1077;
    bool _1083 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1085 = isnan(_1061);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1091 = _1087 || _1089;
    out.m_62.x = _1057;
    out.m_62.y = _1075;
    out.m_62.z = _1055;
    out.m_62.w = _1073;
    out.m_64.x = _1069;
    out.m_64.y = _1079;
    out.m_64.z = _1081;
    float _1093 = _1037;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1097 = _1077;
    float _1099 = _1049;
    float _1101 = _1027;
    if (!_1091)
    {
        _1093 = 1.0;
    }
    float _1103 = _1093;
    bool _1105 = !_1091;
    float _1107 = _1103;
    if (!_1105)
    {
        bool _1109 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1111 = isnan(_1061);
        bool _1113 = _1109 || _1111;
        bool _1115 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1117 = _1113 || _1115;
        if (!_1117)
        {
            float _1119 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1121 = _1061 + _1119;
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1129 = _1127 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1131 = 1.0 / _1125;
            float _1133 = _1121 * _1131;
            float _1135 = fma(_1133, _1129, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1107 = _1135;
            _1095 = _1129;
            _1137 = true;
        }
        else
        {
            bool _1139 = _1061 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1141 = isnan(_1061);
            bool _1143 = _1139 || _1141;
            bool _1145 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1147 = _1143 || _1145;
            if (!_1147)
            {
                float _1149 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1151 = _1061 + _1149;
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1153 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1161 = 1.0 / _1155;
                float _1163 = _1151 * _1161;
                float _1165 = fma(_1163, _1159, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1107 = _1165;
                _1095 = _1159;
                _1137 = true;
            }
            else
            {
                _1107 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1137 = false;
    float _1167 = _1107;
    float _1169 = _1095;
    float _1171 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1173 = _1019 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1177 = _1025 + _1175;
    bool _1179 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1183 = _1179 || _1181;
    bool _1185 = isnan(0.5);
    bool _1187 = _1183 || _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1191 = _1027 + _1189;
    float _1193 = fma(_1173, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1195 = fma(_1177, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1197 = fma(_1191, _1167, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1199 = _1169;
    if (_1187)
    {
        _1199 = _1197;
    }
    float _1201 = _1199;
    float _1203 = _1201;
    if (_1187)
    {
        _949 = _1193;
    }
    float _1205 = _949;
    float _1207 = _1205;
    if (_1187)
    {
        _1097 = _1195;
    }
    float _1209 = _1097;
    float _1211 = _1209;
    float _1213 = _1209;
    if (!_1187)
    {
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1217 = _903 + _1215;
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1221 = _817 + _1219;
        float _1223 = -_819;
        float _1225 = _1223 + _1195;
        float _1227 = -_817;
        float _1229 = _1227 + _1197;
        float _1231 = _1217 * _1217;
        float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1235 = _819 + _1233;
        float _1237 = -_903;
        float _1239 = _1237 + _1193;
        float _1241 = fma(_1221, _1221, _1231);
        float _1243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1245 = fma(_1235, _1235, _1241);
        float _1247 = sqrt(_1245);
        float _1249 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1251 = _1247 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1253 = isnan(_1247);
        bool _1255 = _1251 || _1253;
        bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1259 = _1255 || _1257;
        float _1261 = precise::min(_1247, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1263 = _1261 * _1243;
        float _1265 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1267 = _1265 * _1263;
        float _1269 = _1205;
        float _1271 = _1265;
        if (_1259)
        {
            float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1269 = _1273;
        }
        float _1275 = _1269;
        if (_1259)
        {
            float _1277 = precise::max(_1247, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1211 = _1277;
        }
        float _1279 = _1211;
        float _1281 = fma(_1225, _1267, _819);
        float _1283 = fma(_1229, _1267, _817);
        float _1285 = _1279;
        float _1287 = _1283;
        if (_1259)
        {
            float _1289 = _1279 * _1275;
            _1285 = _1289;
        }
        float _1291 = _1285;
        float _1293 = fma(_1239, _1267, _903);
        float _1295 = _1291;
        float _1297 = _1293;
        if (_1259)
        {
            float _1299 = _1265 * _1291;
            _1271 = _1299;
        }
        float _1301 = _1271;
        if (!_1259)
        {
            _1295 = _1281;
        }
        float _1303 = _1295;
        _1213 = _1303;
        if (_1259)
        {
            float _1305 = fma(_1229, _1301, _817);
            _1287 = _1305;
        }
        float _1307 = _1287;
        _1203 = _1307;
        if (_1259)
        {
            float _1309 = fma(_1239, _1301, _903);
            _1297 = _1309;
        }
        float _1311 = _1297;
        _1207 = _1311;
        if (_1259)
        {
            float _1313 = fma(_1225, _1301, _819);
            _1213 = _1313;
        }
    }
    float _1315 = _1207;
    float _1317 = _1203;
    float _1319 = _1213;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1323 = _1315 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1327 = _1317 + _1325;
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1331 = _1319 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1327, _1327, _1333);
    float _1337 = fma(_1331, _1331, _1335);
    float _1339 = rsqrt(_1337);
    float _1341 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1327 * _1341;
    float _1345 = _1331 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1335;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1343;
    if (_1355)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1369;
    }
    float _1371 = _1361;
    if (_1355)
    {
        float _1373 = rsqrt(_1351);
        _1363 = _1373;
    }
    float _1375 = _1363;
    float _1377 = _1375;
    if (_1355)
    {
        float _1379 = _1359 * _1371;
        _1365 = _1379;
    }
    float _1381 = _1365;
    if (_1355)
    {
        float _1383 = _1381 * 0.15915493667125701904296875;
        _951 = _1383;
    }
    float _1385 = _951;
    float _1387 = _1371;
    if (_1355)
    {
        float _1389 = _1385 * 6.283185482025146484375;
        float _1391 = sin(_1389);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = precise::max(0.0, _1395);
    float _1399 = _1073;
    float _1401 = _1397;
    if (_1355)
    {
        float _1403 = _1385 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        _1399 = _1405;
    }
    float _1407 = _1399;
    float _1409 = -_1341;
    float _1411 = -_1397;
    float _1413 = fma(_1323, _1409, _1411);
    if (_1355)
    {
        float _1415 = _1413 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1415;
    }
    float _1417 = _1401;
    float _1419 = sqrt(_1337);
    float _1421 = _1393;
    float _1423 = _1417;
    if (_1355)
    {
        float _1425 = fma(_1393, _1417, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1421 = _1425;
    }
    float _1427 = _1421;
    float _1429 = _1427;
    float _1431 = _1407;
    if (_1355)
    {
        float _1433 = _1407 + (-1.0);
        _1423 = _1433;
    }
    float _1435 = _1423;
    float _1437 = _1435;
    if (_1355)
    {
        float _1439 = _1375 * _1427;
        _1099 = _1439;
    }
    float _1441 = _1099;
    if (!_1355)
    {
        _1429 = _1413;
    }
    float _1443 = _1429;
    float _1445 = _1443;
    if (_1355)
    {
        float _1447 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1101 = _1447;
    }
    float _1449 = _1101;
    if (_1355)
    {
        float _1451 = _1343 * _1441;
        _1367 = _1451;
    }
    float _1453 = _1367;
    if (!_1355)
    {
        _1437 = _1345;
    }
    float _1455 = _1437;
    float _1457 = _1455;
    if (_1355)
    {
        float _1459 = _1345 * _1441;
        _1457 = _1459;
    }
    float _1461 = _1457;
    if (!_1355)
    {
        _1377 = _1347;
    }
    float _1463 = _1377;
    float _1465 = _1463;
    if (_1355)
    {
        float _1467 = fma(_1413, _1407, _1449);
        _1445 = _1467;
    }
    float _1469 = _1445;
    if (_1355)
    {
        float _1471 = _1453 * _1453;
        _1465 = _1471;
    }
    float _1473 = _1465;
    if (!_1355)
    {
        _1431 = _1349;
    }
    float _1475 = _1431;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1461 * _1461;
        _1477 = _1479;
    }
    float _1481 = _1477;
    float _1483 = fma(_1469, _1469, _1473);
    float _1485 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1487 = _1483 + _1481;
    float _1489 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1493 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1491);
    float _1495 = precise::clamp(_1493, 0.0, 1.0);
    float _1497 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1499 = rsqrt(_1487);
    float _1501 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1489);
    float _1503 = -_1495;
    float _1505 = _1503 + 1.0;
    float _1507 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1509 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1511 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1501);
    float _1513 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1497);
    float _1515 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1507);
    float _1517 = abs(_1505);
    float _1519 = log2(_1517);
    float _1521 = _1511 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1523 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1513);
    float _1525 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1485);
    float _1527 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1515);
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1533 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1525);
    float _1535 = _1499 * _1453;
    float _1537 = _1499 * _1469;
    float _1539 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1541 = -_1529;
    float _1543 = fma(_1541, _1509, 1.0);
    float _1545 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1547 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1551 = _1499 * _1461;
    float _1553 = -_1545;
    float _1555 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1553);
    float _1557 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1559 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1561 = log2(_1543);
    float _1563 = -_1551;
    float _1565 = fma(_1563, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1555);
    float _1567 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1557);
    float _1569 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1571 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1573 = fma(_1565, -0.5, 0.5);
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1567);
    float _1577 = fma(_1565, 0.5, 0.5);
    float _1579 = exp2(_1559);
    float _1581 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1569);
    float _1583 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1571);
    float _1585 = fma(_1577, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1587 = _1537 + 1.0;
    float _1589 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1581);
    float _1591 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1583);
    float _1593 = fma(_1577, _1585, -0.212114393711090087890625);
    float _1595 = 1.0 / _1575;
    float _1597 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1599 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1591);
    float _1601 = _1561 * 0.693147182464599609375;
    float _1603 = fma(_1577, _1593, 1.570728778839111328125);
    float _1605 = sqrt(_1573);
    float _1607 = -_1537;
    float _1609 = fma(_1579, _1587, _1607);
    float _1611 = fma(_1609, 0.5, 0.5);
    float _1613 = _1597 * _1595;
    float _1615 = _1599 * _1595;
    float _1617 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = fma(_1613, 0.5, 0.5);
    float _1621 = fma(_1615, -0.5, 0.5);
    float _1623 = _1605 * 0.636619746685028076171875;
    float _1625 = -_1603;
    float _1627 = fma(_1623, _1625, 1.0);
    float3 _4470 = float3(_1619, _1621, _1617);
    float _1629 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4470, float3(0.0), isnan(_4470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4470, float3(0.0), isnan(_4470)), level(0.0)).x;
    float3 _4481 = float3(_1619, _1621, _1617);
    float4 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4481, float3(0.0), isnan(_4481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4481, float3(0.0), isnan(_4481)), level(0.0)).xyzw;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1632.w;
    float2 _4498 = float2(_1627, _1611);
    float3 _1644 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4498, float2(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4498, float2(0.0), isnan(_4498)), level(0.0)).xyz;
    float _1646 = _1644.x;
    float _1648 = _1644.y;
    float _1650 = _1644.z;
    float _1652 = _903 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1654 = _903 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1656 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1658 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1652);
    float _1660 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1654);
    float _1662 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1658);
    float _1664 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1660);
    float _1666 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1668 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1670 = 1.0 / _1666;
    float _1672 = _1668 + _1666;
    float _1674 = _1672 * _1670;
    float _1676 = _1674 * 0.5;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1680 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1678);
    bool _1682 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1684 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan(0.5);
    bool _1690 = _1686 || _1688;
    float _1692 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1694 = 1.0 / _1680;
    float _1696 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1692);
    float _1698 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1696);
    float _1700 = exp2(_1656);
    float _1702 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1698);
    float _1704 = _1539;
    float _1706 = _1696;
    if (_1690)
    {
        _1704 = 1.0;
    }
    float _1708 = _1704;
    float _1710 = _1708;
    if (_1690)
    {
        _1706 = 1.0;
    }
    float _1712 = _1706;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1716 = _1694 * _1714;
    float _1718 = _1712;
    if (!_1690)
    {
        float _1720 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1730 = _1728 * 0.15915493667125701904296875;
        float _1732 = _1722 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = 1.0 / _1726;
        float _1738 = _1730 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = _1734 * _1736;
        float _1744 = _1730 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = _1740 * _1742;
        float _1750 = 1.0 / _1748;
        float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1754 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1752;
        float _1756 = 1.0 / _1754;
        float _1758 = _1746 * _1750;
        float _1760 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1762 = fma(_1716, _1758, _1760);
        float _1764 = _1762 * _1756;
        float _1766 = precise::clamp(_1764, 0.0, 1.0);
        _1710 = _1766;
    }
    float _1768 = _1710;
    if (!_1690)
    {
        float _1770 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1772 = _1770 * 0.15915493667125701904296875;
        float _1774 = _1772 * 6.283185482025146484375;
        float _1776 = cos(_1774);
        float _1778 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1780 = _1778 * 0.15915493667125701904296875;
        float _1782 = _1772 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = 1.0 / _1776;
        float _1788 = _1780 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        float _1792 = _1784 * _1786;
        float _1794 = _1780 * 6.283185482025146484375;
        float _1796 = sin(_1794);
        float _1798 = _1790 * _1792;
        float _1800 = 1.0 / _1798;
        float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1804 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1802;
        float _1806 = 1.0 / _1804;
        float _1808 = _1796 * _1800;
        float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1812 = fma(_1716, _1808, _1810);
        float _1814 = _1812 * _1806;
        float _1816 = precise::clamp(_1814, 0.0, 1.0);
        float _1818 = -_1816;
        float _1820 = _1818 + 1.0;
        _1718 = _1820;
    }
    float _1822 = _1718;
    float _1824 = -_1700;
    float _1826 = _1824 + 1.0;
    bool _1828 = _1768 > 0.0;
    bool _1830 = isnan(_1768);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(0.0);
    bool _1836 = _1832 || _1834;
    float _1838 = _1768 * _1822;
    float _1840 = _1575 * 0.5;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1844 = _1822 <= 0.0;
    bool _1846 = !_1836;
    bool _1848 = _1844 || _1846;
    float _1850 = _1702 + _1575;
    float _1852 = _1597 + _1575;
    float _1854 = _1842 * _1629;
    float _1856 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1858 = fma(_1599, -0.5, _1840);
    out.m_66.x = _1327;
    out.m_66.y = _1323;
    out.m_66.z = _1331;
    float _1860 = _1640 * _1854;
    float _1862 = _1650 * _1854;
    float _1864 = -_1842;
    float _1866 = _1864 + 1.0;
    out.gl_Position.x = _1597;
    out.gl_Position.y = _1599;
    out.gl_Position.z = _1702;
    out.gl_Position.w = _1575;
    float _1868 = _1850 * 0.5;
    float _1870 = _1852 * 0.5;
    float _1872 = _1856 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1874 = _1640 * _1866;
    float _1876 = fma(_1646, _1860, _1634);
    float _1878 = fma(_1648, _1860, _1636);
    float _1880 = fma(_1640, _1862, _1638);
    out.m_68.x = _1870;
    out.m_68.y = _1858;
    out.m_68.z = _1868;
    out.m_68.w = _1575;
    out.m_47.x = _1872;
    out.m_70.x = _1876;
    out.m_70.y = _1878;
    out.m_70.z = _1880;
    out.m_70.w = _1874;
    if (!_1848)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1882;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

