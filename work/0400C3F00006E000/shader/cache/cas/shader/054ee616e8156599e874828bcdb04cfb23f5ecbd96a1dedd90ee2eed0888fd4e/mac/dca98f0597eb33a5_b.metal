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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_37 [[user(locn1), flat]];
    float4 m_35 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_47 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _582 = float2(_73, _75);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = in.m_37.y;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _85 * (-0.2599999904632568359375);
    float _107 = _71 * _91;
    float _109 = _85 * (-0.319999992847442626953125);
    float _111 = fma(_107, 17.0, _105);
    float _113 = fma(_107, 21.0, _109);
    float _115 = -_107;
    float _117 = _115 + 1.0;
    float _119 = _111 * 0.15915493667125701904296875;
    float _121 = _113 * 0.15915493667125701904296875;
    float _123 = _119 * 6.283185482025146484375;
    float _125 = sin(_123);
    float _127 = _121 * 6.283185482025146484375;
    float _129 = sin(_127);
    float _131 = _125 + _129;
    float _133 = _71 * _97;
    float _135 = _71 * _103;
    float _137 = _131 * _117;
    float _139 = fma(_81, (*spvDescriptorSet0.fp_c9)._m0[194].w, _133);
    float _141 = fma(_83, (*spvDescriptorSet0.fp_c9)._m0[194].w, _135);
    float _143 = fma(_137, 0.0040000001899898052215576171875, _139);
    float2 _685 = float2(_143, _141);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_685, float2(0.0), isnan(_685))).w;
    float _147 = in.m_41.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_41.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _71 * _151;
    float _161 = fma(_145, 2.0, -1.0);
    float _163 = _117 * _161;
    float _165 = _71 * _157;
    float _167 = fma(_163, 0.0500000007450580596923828125, _159);
    float2 _724 = float2(_165, _167);
    float2 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_724, float2(0.0), isnan(_724))).xw;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = in.m_39.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _107 + (-0.20000000298023223876953125);
    float _183 = in.m_43.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_45.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_47.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _181 * _181;
    float _203 = _71 * _179;
    float _205 = _203 + (-0.5);
    float _207 = fma(_205, _205, _201);
    float _209 = sqrt(_207);
    float _211 = precise::max(_209, 0.119999997317790985107421875);
    float _213 = precise::min(_211, 0.60000002384185791015625);
    float _215 = fma(_213, -2.0833332538604736328125, 1.25);
    float _217 = fma(_213, 2.0833332538604736328125, -0.24999998509883880615234375);
    float _219 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _221 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _219;
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _225 = _223 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _227 = _145 * _215;
    float _229 = 1.0 / _221;
    float _231 = precise::max(_227, 0.300000011920928955078125);
    float _233 = precise::min(_231, 0.5);
    float _235 = fma(_233, 5.000000476837158203125, -1.5000002384185791015625);
    float _237 = 1.0 / _225;
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _241 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _239;
    float _243 = -_171;
    float _245 = fma(_243, _171, 1.0);
    float _247 = -_245;
    float _249 = fma(_247, _217, 1.0);
    float _251 = fma(_145, _249, _235);
    float _253 = _71 * _199;
    float _255 = fma(_171, _171, _251);
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _71 * _187;
    float _261 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _263 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _261;
    float _265 = _257 * _259;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _71 * _193;
    float _271 = 1.0 / _263;
    float _273 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _283 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _281;
    bool _287 = _253 != 1.0;
    bool _289 = isnan(_253);
    bool _291 = _287 || _289;
    bool _293 = isnan(1.0);
    bool _295 = _291 || _293;
    float _297 = _275 * _237;
    float _299 = _279 * _229;
    float _301 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _303 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _301;
    float _305 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _307 = _267 + _305;
    float _309 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _311 = _309 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _313 = fma(_283, _299, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _315 = fma(_303, _299, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _317 = _267 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _319 = isnan(_267);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = fma(_311, _297, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _331 = fma(_241, _299, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _333 = _307 * _271;
    float _335 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _337 = _335 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _339 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _343 = _267 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _345 = isnan(_267);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_327;
    float _357 = _355 + 1.0;
    float _359 = fma(_337, _297, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _361 = fma(_341, _297, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    bool _363 = _267 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_353;
    float _377 = _375 + 1.0;
    float _379 = _353 * _357;
    float _381 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _383 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _381;
    float _385 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _387 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _385;
    float _389 = _373 * _377;
    bool _391 = _267 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _393 = isnan(_267);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_373;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _409 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _407;
    float _411 = _313 * _389;
    float _413 = _331 * _389;
    float _415 = _315 * _389;
    float _417 = -_401;
    float _419 = _417 + 1.0;
    float _421 = fma(_405, (*spvDescriptorSet0.fp_c9)._m0[107].x, _411);
    float _423 = fma(_405, (*spvDescriptorSet0.fp_c9)._m0[107].y, _413);
    float _425 = fma(_405, (*spvDescriptorSet0.fp_c9)._m0[107].z, _415);
    float _427 = fma(_387, _333, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _429 = fma(_383, _333, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _431 = fma(_409, _333, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _433 = _327 * _419;
    float _435 = fma(_359, _379, _421);
    float _437 = fma(_361, _379, _423);
    float _439 = fma(_329, _379, _425);
    float _441 = 0.0 + _173;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = fma(_427, _433, _435);
    float _447 = fma(_429, _433, _437);
    float _449 = fma(_431, _433, _439);
    float _451 = _443 * _269;
    float _453 = fma(_401, (*spvDescriptorSet0.fp_c9)._m0[110].x, _445);
    float _455 = fma(_401, (*spvDescriptorSet0.fp_c9)._m0[110].y, _447);
    float _457 = fma(_401, (*spvDescriptorSet0.fp_c9)._m0[110].z, _449);
    bool _459 = !_295;
    if (!_459)
    {
        float _461 = gl_FragCoord.x;
        float _463 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _465 = _461 / _463;
        float _467 = gl_FragCoord.y;
        float _469 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _471 = _467 / _469;
        float _473 = _253 * 256.0;
        float _475 = trunc(_473);
        int _478 = int(_475);
        float _480 = trunc(_465);
        int _482 = int(_480);
        float _484 = trunc(_471);
        int _486 = int(_484);
        int _488 = _482 + 2;
        int _490 = _488 >> 1;
        uint _493 = uint(int(uint(_486) >> uint(1)));
        int _495 = _490 ^ int(_493);
        int _497 = _495 << 16;
        int _499 = _497 ^ _490;
        int _501 = 983055 & _499;
        int _503 = _501 << 6;
        int _505 = _503 + _501;
        int _507 = _505 & 13369548;
        uint _509 = uint(int(uint(_507) >> uint(3)));
        int _511 = _507 | int(_509);
        uint _513 = uint(int(uint(_478) >> uint(7)));
        int _515 = int(_513) + _478;
        int _517 = _511 & 5570560;
        int _519 = _511 & 85;
        uint _521 = uint(int(uint(_517) >> uint(15)));
        int _523 = int(_521) + _519;
        bool _525 = uint(_515) > uint(_523);
        if (!_525)
        {
            discard_fragment();
        }
        if (!_525)
        {
            out.m_50.x = _453;
            out.m_50.y = _455;
            out.m_50.z = _457;
            out.m_50.w = _451;
            return out;
        }
    }
    float _527 = _455 * 0.715200006961822509765625;
    float _529 = 0.0 + _451;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    float _533 = fma(_453, 0.2125999927520751953125, _527);
    float _535 = fma(_457, 0.072200000286102294921875, _533);
    float _537 = 1.0 / _535;
    float _539 = _537 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _541 = precise::clamp(_539, 0.0, 1.0);
    float _543 = fma(_541, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _545 = _453 * _543;
    float _547 = _455 * _543;
    float _549 = _457 * _543;
    out.m_50.x = _545;
    out.m_50.y = _547;
    out.m_50.z = _549;
    out.m_50.w = _531;
    return out;
}

