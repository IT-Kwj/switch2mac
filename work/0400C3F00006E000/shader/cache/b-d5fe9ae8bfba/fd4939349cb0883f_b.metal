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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_39 [[user(locn1), flat]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _628 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_37.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.y;
    float _95 = in.m_35.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _73 * _91;
    float _103 = _93 * (-0.2599999904632568359375);
    float _105 = in.m_35.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _93 * (-0.319999992847442626953125);
    float _113 = -_101;
    float _115 = _113 + 1.0;
    float _117 = fma(_101, 17.0, _103);
    float _119 = fma(_101, 21.0, _111);
    float _121 = _117 * 0.15915493667125701904296875;
    float _123 = _119 * 0.15915493667125701904296875;
    float _125 = _121 * 6.283185482025146484375;
    float _127 = sin(_125);
    float _129 = _123 * 6.283185482025146484375;
    float _131 = sin(_129);
    float _133 = _127 + _131;
    float _135 = _73 * _109;
    float _137 = _73 * _99;
    float _139 = _133 * _115;
    float _141 = fma(_83, (*spvDescriptorSet0.fp_c9)._m0[194].w, _135);
    float _143 = fma(_85, (*spvDescriptorSet0.fp_c9)._m0[194].w, _137);
    float _145 = fma(_139, 0.0040000001899898052215576171875, _141);
    float2 _731 = float2(_145, _143);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_731, float2(0.0), isnan(_731))).w;
    float _149 = in.m_41.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_41.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = fma(_147, 2.0, -1.0);
    float _163 = _73 * _153;
    float _165 = _115 * _161;
    float _167 = _73 * _159;
    float _169 = fma(_165, 0.0500000007450580596923828125, _163);
    float2 _770 = float2(_167, _169);
    float2 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_770, float2(0.0), isnan(_770))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_770, float2(0.0), isnan(_770))).xw;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = in.m_43.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_37.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _73 * _181;
    float _191 = _73 * _187;
    float _193 = _101 + (-0.20000000298023223876953125);
    float _195 = _191 + (-0.5);
    float _197 = _193 * _193;
    float _199 = fma(_195, _195, _197);
    float _201 = sqrt(_199);
    float _203 = in.m_45.w;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = precise::max(_201, 0.119999997317790985107421875);
    float _211 = precise::min(_209, 0.60000002384185791015625);
    float _213 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _215 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _213;
    float _217 = 1.0 / _215;
    float _219 = 0.0 + _175;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _221 * _189;
    bool _227 = _223 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _229 = isnan(_223);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _235 = _231 || _233;
    if (!_235)
    {
        discard_fragment();
    }
    float _237 = fma(_211, 2.0833332538604736328125, -0.24999998509883880615234375);
    float _239 = fma(_211, -2.0833332538604736328125, 1.25);
    float _241 = -_173;
    float _243 = fma(_241, _173, 1.0);
    float _245 = _147 * _239;
    float _247 = -_243;
    float _249 = fma(_247, _237, 1.0);
    float _251 = _73 * _207;
    float _253 = precise::max(_245, 0.300000011920928955078125);
    float _255 = precise::min(_253, 0.5);
    float _257 = fma(_255, 5.000000476837158203125, -1.5000002384185791015625);
    float _259 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _261 = _259 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _263 = fma(_147, _249, _257);
    float _265 = 1.0 / _261;
    float _267 = fma(_173, _173, _263);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _273 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _271;
    float _275 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _277 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _275;
    float _279 = _269 * _251;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = 1.0 / _277;
    float _285 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _287 = _281 + _285;
    bool _289 = _281 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _291 = isnan(_281);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _287 * _217;
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _305 = _281 + _303;
    float _307 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _309 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _307;
    float _311 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _313 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _311;
    float _315 = fma(_273, _301, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _317 = _305 * _265;
    float _319 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _321 = _281 + _319;
    float _323 = fma(_309, _301, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _325 = fma(_313, _301, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _327 = _281 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _329 = isnan(_281);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _341 = _339 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _343 = _321 * _283;
    float _345 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _347 = _345 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _349 = _281 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _351 = isnan(_281);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _363 = _361 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _365 = _281 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _367 = isnan(_281);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -_337;
    float _379 = _377 + 1.0;
    float _381 = -_299;
    float _383 = _381 + 1.0;
    float _385 = -_359;
    float _387 = _385 + 1.0;
    float _389 = fma(_341, _317, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _391 = _375 * _379;
    float _393 = fma(_347, _317, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _395 = _337 * _383;
    float _397 = fma(_363, _317, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _399 = _299 * _387;
    float _401 = _315 * _391;
    float _403 = _323 * _391;
    float _405 = -_375;
    float _407 = _405 + 1.0;
    float _409 = _325 * _391;
    float _411 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _413 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _411;
    float _415 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _417 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _415;
    float _419 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[107].x, _401);
    float _421 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[107].y, _403);
    float _423 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _425 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _423;
    float _427 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[107].z, _409);
    float _429 = fma(_413, _343, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _431 = fma(_417, _343, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _433 = fma(_389, _395, _419);
    float _435 = fma(_393, _395, _421);
    float _437 = fma(_425, _343, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _439 = fma(_397, _395, _427);
    float _441 = fma(_429, _399, _433);
    float _443 = fma(_431, _399, _435);
    float _445 = fma(_437, _399, _439);
    float _447 = fma(_359, (*spvDescriptorSet0.fp_c9)._m0[110].x, _441);
    float _449 = fma(_359, (*spvDescriptorSet0.fp_c9)._m0[110].y, _443);
    float _451 = fma(_359, (*spvDescriptorSet0.fp_c9)._m0[110].z, _445);
    if (!_235)
    {
        out.m_48.x = _447;
        out.m_48.y = _449;
        out.m_48.z = _451;
        out.m_48.w = _175;
        return out;
    }
    float _453 = in.m_50.w;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = _73 * _457;
    bool _461 = _459 != 1.0;
    bool _463 = isnan(_459);
    bool _465 = _461 || _463;
    bool _467 = isnan(1.0);
    bool _469 = _465 || _467;
    bool _471 = !_469;
    if (!_471)
    {
        float _473 = gl_FragCoord.x;
        float _475 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _477 = _473 / _475;
        float _479 = gl_FragCoord.y;
        float _481 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _483 = _479 / _481;
        float _485 = _459 * 256.0;
        float _487 = trunc(_485);
        int _490 = int(_487);
        float _492 = trunc(_477);
        int _494 = int(_492);
        float _496 = trunc(_483);
        int _498 = int(_496);
        int _500 = _494 + 2;
        int _502 = _500 >> 1;
        uint _505 = uint(int(uint(_498) >> uint(1)));
        int _507 = _502 ^ int(_505);
        int _509 = _507 << 16;
        int _511 = _509 ^ _502;
        int _513 = 983055 & _511;
        uint _515 = uint(int(uint(_490) >> uint(7)));
        int _517 = int(_515) + _490;
        int _519 = _513 << 6;
        int _521 = _519 + _513;
        int _523 = _521 & 13369548;
        uint _525 = uint(int(uint(_523) >> uint(3)));
        int _527 = _523 | int(_525);
        int _529 = _527 & 5570560;
        int _531 = _527 & 85;
        uint _533 = uint(int(uint(_529) >> uint(15)));
        int _535 = int(_533) + _531;
        bool _537 = uint(_517) > uint(_535);
        if (!_537)
        {
            discard_fragment();
        }
        if (!_537)
        {
            out.m_48.x = _447;
            out.m_48.y = _449;
            out.m_48.z = _451;
            out.m_48.w = _223;
            return out;
        }
    }
    float _539 = _449 * 0.715200006961822509765625;
    float _541 = in.m_52.w;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_52.x;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_52.y;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = fma(_447, 0.2125999927520751953125, _539);
    float _561 = in.m_52.z;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = fma(_451, 0.072200000286102294921875, _559);
    float _569 = 1.0 / _567;
    float _571 = _569 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = 0.0 + _223;
    float _577 = precise::clamp(_575, 0.0, 1.0);
    float _579 = _73 * _545;
    float _581 = fma(_573, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _583 = _581 * _579;
    float _585 = _73 * _551;
    float _587 = _73 * _557;
    float _589 = _73 * _565;
    float _591 = fma(_447, _583, _585);
    float _593 = fma(_449, _583, _587);
    float _595 = fma(_451, _583, _589);
    out.m_48.x = _591;
    out.m_48.y = _593;
    out.m_48.z = _595;
    out.m_48.w = _577;
    return out;
}

