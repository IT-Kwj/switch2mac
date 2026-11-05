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
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texturecube<float> fp_t_tcb_1E [[id(4)]];
    sampler fp_t_tcb_1ESmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_1ESmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_36 [[user(locn1), flat]];
    float4 m_55 [[user(locn2)]];
    float4 m_34 [[user(locn3)]];
    float4 m_38 [[user(locn4), flat]];
    float4 m_40 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_42 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_46 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_34.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_36.y;
    float _74 = in.m_38.y;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _64;
    float _90 = _88 * _70;
    float _92 = _88 * _86;
    float _94 = _90 * 78.233001708984375;
    float _96 = fma(_72, 12.98980045318603515625, _94);
    float _98 = _96 * 0.15915493667125701904296875;
    float _100 = _98 * 6.283185482025146484375;
    float _102 = sin(_100);
    float _104 = _102 * 43758.546875;
    float _106 = floor(_104);
    float _108 = -_106;
    float _110 = _104 + _108;
    float _112 = fma(_74, 0.0062500000931322574615478515625, _110);
    float _114 = floor(_112);
    float _116 = -_114;
    float _118 = _112 + _116;
    float _120 = _118 * 16.0;
    float _122 = _88 * _80;
    float _124 = rint(_120);
    float _126 = precise::max(_124, 0.0);
    uint _129 = uint(_126);
    uint _131 = clamp(_129, 0u, 65535u);
    float3 _665 = float3(_92, _122, float(int(_131)));
    float3 _669 = select(_665, float3(0.0), isnan(_665));
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _669.xy, uint(rint(_669.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _669.xy, uint(rint(_669.z))).w;
    float _135 = in.m_42.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_42.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _88 * _139;
    float _149 = _88 * _145;
    float _151 = in.m_44.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _147 + (-0.119999997317790985107421875);
    float _159 = fma(_149, 0.699999988079071044921875, -0.3499999940395355224609375);
    float _161 = _157 * _157;
    float _163 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _165 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _163;
    float _167 = fma(_159, _159, _161);
    float _169 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _171 = _169 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _173 = 1.0 / _165;
    float _175 = sqrt(_167);
    float _177 = 1.0 / _171;
    float _179 = precise::max(_175, 0.3499999940395355224609375);
    float _181 = in.m_46.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = precise::min(_179, 0.60000002384185791015625);
    float _189 = _88 * _155;
    float _191 = fma(_187, -3.999999523162841796875, 2.3999998569488525390625);
    float _193 = _133 * _189;
    float _195 = 0.0 + _133;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = in.m_48.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = _193 * _191;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _211 = _197 + _209;
    float _213 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _215 = _197 + _213;
    bool _219 = _197 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _221 = isnan(_197);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = _211 * _173;
    float _233 = _215 * _177;
    float _235 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _237 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _235;
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _241 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _239;
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _245 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _243;
    bool _247 = _197 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _249 = isnan(_197);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -_229;
    float _261 = _259 + 1.0;
    float _263 = fma(_237, _231, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _265 = fma(_241, _231, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _267 = fma(_245, _231, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _269 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _271 = _269 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _273 = _197 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _275 = isnan(_197);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _257 * _261;
    float _287 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _289 = _287 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _291 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _293 = _291 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _295 = fma(_271, _233, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _297 = _267 * _285;
    float _299 = _88 * _185;
    float _301 = fma(_293, _233, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _303 = fma(_289, _233, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _305 = -_257;
    float _307 = _305 + 1.0;
    float _309 = _263 * _285;
    bool _311 = _299 != 1.0;
    bool _313 = isnan(_299);
    bool _315 = _311 || _313;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    float _321 = _265 * _285;
    float _323 = -_283;
    float _325 = _323 + 1.0;
    float _327 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[107].x, _309);
    float _329 = _88 * _203;
    float _331 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[107].y, _321);
    float _333 = _229 * _325;
    float _335 = fma(_307, (*spvDescriptorSet0.fp_c9)._m0[107].z, _297);
    float _337 = _207 * _329;
    float _339 = fma(_301, _333, _327);
    float _341 = fma(_295, _333, _331);
    float _343 = fma(_303, _333, _335);
    float _345 = fma(_283, (*spvDescriptorSet0.fp_c9)._m0[109].x, _339);
    float _347 = fma(_283, (*spvDescriptorSet0.fp_c9)._m0[109].y, _341);
    float _349 = fma(_283, (*spvDescriptorSet0.fp_c9)._m0[109].z, _343);
    bool _351 = !_319;
    if (!_351)
    {
        float _353 = gl_FragCoord.x;
        float _355 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _357 = _353 / _355;
        float _359 = gl_FragCoord.y;
        float _361 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _363 = _359 / _361;
        float _365 = trunc(_357);
        int _368 = int(_365);
        float _370 = trunc(_363);
        int _372 = int(_370);
        int _374 = _368 + 2;
        int _376 = _374 >> 1;
        uint _378 = uint(int(uint(_372) >> uint(1)));
        int _380 = _376 ^ int(_378);
        int _382 = _380 << 16;
        int _384 = _382 ^ _376;
        int _386 = 983055 & _384;
        float _388 = _299 * 256.0;
        int _390 = _386 << 6;
        int _392 = _390 + _386;
        float _394 = trunc(_388);
        int _396 = int(_394);
        int _398 = _392 & 13369548;
        uint _400 = uint(int(uint(_398) >> uint(3)));
        int _402 = _398 | int(_400);
        int _404 = _402 & 5570560;
        int _406 = _402 & 85;
        uint _408 = uint(int(uint(_396) >> uint(7)));
        int _410 = int(_408) + _396;
        uint _412 = uint(int(uint(_404) >> uint(15)));
        int _414 = int(_412) + _406;
        bool _416 = uint(_410) > uint(_414);
        if (!_416)
        {
            discard_fragment();
        }
        if (!_416)
        {
            out.m_51.x = _345;
            out.m_51.y = _347;
            out.m_51.z = _349;
            out.m_51.w = _337;
            return out;
        }
    }
    float _418 = in.m_53.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_53.x;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_53.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_46.x;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = _88 * _422;
    float _444 = _88 * _428;
    float _446 = _88 * _434;
    float _448 = _442 * _442;
    float _450 = fma(_444, _444, _448);
    float _452 = fma(_446, _446, _450);
    float _454 = rsqrt(_452);
    float _456 = _444 * _454;
    float _458 = _442 * _454;
    float _460 = _446 * _454;
    float _462 = abs(_456);
    float _464 = abs(_458);
    float _466 = precise::max(_462, _464);
    float _468 = abs(_460);
    float _470 = precise::max(_468, _466);
    float _472 = _88 * _440;
    float _474 = 1.0 / _470;
    float _476 = _456 * _474;
    float _478 = _458 * _474;
    float _480 = -_474;
    float _482 = _460 * _480;
    float _484 = precise::min(_472, 1.0);
    float3 _1216 = float3(_476, _478, _482);
    float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1216, float3(0.0), isnan(_1216)), level(_484)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1216, float3(0.0), isnan(_1216)), level(_484)).xyz;
    float _490 = _488.x;
    float _492 = _488.y;
    float _494 = _488.z;
    float _496 = in.m_55.x;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_55.y;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_55.z;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_57.x;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_57.y;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_57.z;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = 0.0 + _337;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = _88 * _500;
    float _538 = _88 * _506;
    float _540 = _88 * _512;
    float _542 = _88 * _518;
    float _544 = _88 * _524;
    float _546 = _88 * _530;
    float _548 = fma(_492, 0.20999999344348907470703125, _538);
    float _550 = fma(_490, 0.20999999344348907470703125, _536);
    float _552 = fma(_494, 0.20999999344348907470703125, _540);
    float _554 = _548 + _544;
    float _556 = _550 + _542;
    float _558 = _552 + _546;
    float _560 = _347 * _554;
    float _562 = _345 * _556;
    float _564 = _349 * _558;
    out.m_51.x = _562;
    out.m_51.y = _560;
    out.m_51.z = _564;
    out.m_51.w = _534;
    return out;
}

