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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_34 [[id(12)]];
    sampler fp_t_tcb_34Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_36 [[id(14)]];
    sampler fp_t_tcb_36Smplr [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_34Smplr_w [[id(20)]];
    sampler fp_t_tcb_36Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0), flat]];
    float4 m_57 [[user(locn1)]];
    float4 m_55 [[user(locn2), flat]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_49 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_45.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_45.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_45.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _67;
    float _89 = _87 * _73;
    float _91 = _87 * _79;
    float _93 = _87 * _85;
    float _95 = 1.0 / _89;
    float _97 = _91 * _95;
    float _99 = _93 * _95;
    float2 _1702 = float2(_97, _99);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1702, float2(0.0), isnan(_1702))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1702, float2(0.0), isnan(_1702))).x;
    float _103 = in.m_45.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_47.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _87 * _107;
    float _117 = _115 * _95;
    float _119 = _87 * _113;
    float _121 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _123 = fma(_117, (*spvDescriptorSet0.fp_c8)._m0[30].w, _121);
    float _125 = 1.0 / _123;
    float _127 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _129 = _125 * _127;
    float _131 = in.m_49.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_49.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_49.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_51.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _87 * _135;
    float _157 = _87 * _141;
    float _159 = _87 * _147;
    float _161 = -_157;
    float _163 = _161 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _165 = _87 * _153;
    float _167 = _165 + 0.5;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _171 = fma(_101, (*spvDescriptorSet0.fp_c8)._m0[30].w, _169);
    float _173 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _175 = 1.0 / _171;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _179 = -_129;
    float _181 = fma(_175, _177, _179);
    float _183 = _181 * _173;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _185 * _119;
    bool _191 = _187 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _193 = isnan(_187);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _199 = _195 || _197;
    float _201 = _129;
    if (!_199)
    {
        discard_fragment();
    }
    float _203 = -_155;
    float _205 = _203 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _207 = _205 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _209 = _205 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _211 = _205 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _213 = fma(_163, (*spvDescriptorSet0.fp_c10)._m0[8].x, _207);
    float _215 = fma(_163, (*spvDescriptorSet0.fp_c10)._m0[8].y, _209);
    float _217 = fma(_163, (*spvDescriptorSet0.fp_c10)._m0[8].z, _211);
    float _219 = -_159;
    float _221 = _219 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _223 = fma(_221, (*spvDescriptorSet0.fp_c10)._m0[10].x, _213);
    float _225 = fma(_221, (*spvDescriptorSet0.fp_c10)._m0[10].y, _215);
    float _227 = fma(_221, (*spvDescriptorSet0.fp_c10)._m0[10].z, _217);
    float _229 = in.m_51.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = -_223;
    float _237 = _167 + _235;
    bool _239 = _167 >= _223;
    bool _241 = isnan(_167);
    bool _243 = _239 || _241;
    bool _245 = isnan(_223);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _237;
    float _253 = -_167;
    float _255 = _253 + _249;
    float _257 = _255 * _251;
    float _259 = _87 * _233;
    float _261 = _259 + 0.5;
    float _263 = -_225;
    float _265 = _261 + _263;
    bool _267 = _261 >= _225;
    bool _269 = isnan(_261);
    bool _271 = _267 || _269;
    bool _273 = isnan(_225);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = 1.0 / _265;
    float _281 = -_261;
    float _283 = _281 + _277;
    float _285 = _283 * _279;
    float _287 = precise::min(_257, _285);
    float _289 = -_227;
    float _291 = _289 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _293 = -_227;
    float _295 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    bool _297 = _293 >= _295;
    bool _299 = isnan(_293);
    bool _301 = _297 || _299;
    bool _303 = isnan(_295);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _291;
    float _311 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _313 = _307 + _311;
    float _315 = _313 * _309;
    float _317 = precise::min(_315, _287);
    float _319 = fma(_237, _317, _167);
    float _321 = fma(_265, _317, _261);
    float _323 = fma(_291, _317, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _325 = fma(_319, -2.0, 1.0);
    float _327 = fma(_319, 2.0, -1.0);
    float _329 = fma(_321, -2.0, 1.0);
    float _331 = fma(_321, 2.0, -1.0);
    bool _333 = _325 >= 0.999000012874603271484375;
    bool _335 = isnan(_325);
    bool _337 = _333 || _335;
    bool _339 = isnan(0.999000012874603271484375);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_321;
    float _347 = _345 + 1.0;
    bool _349 = _327 >= 0.999000012874603271484375;
    bool _351 = isnan(_327);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.999000012874603271484375);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _329 >= 0.999000012874603271484375;
    bool _363 = isnan(_329);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.999000012874603271484375);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _321 * _343;
    bool _375 = _331 >= 0.999000012874603271484375;
    bool _377 = isnan(_331);
    bool _379 = _375 || _377;
    bool _381 = isnan(0.999000012874603271484375);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = fma(_347, _359, _373);
    float _389 = _371 * 0.4000000059604644775390625;
    float _391 = -_319;
    float _393 = _391 + 1.0;
    float _395 = _319 * _385;
    float _397 = _343 + _359;
    float _399 = fma(_343, -0.25, _389);
    float _401 = fma(_371, _393, _395);
    float _403 = fma(_385, -0.4000000059604644775390625, _399);
    float _405 = _371 + _385;
    float _407 = _387 + _401;
    float _409 = _397 + _405;
    float _411 = in.m_53.y;
    float _413 = fma(_411, (*spvDescriptorSet0.fp_c9)._m0[191].z, _403);
    float _415 = fma(_323, (*spvDescriptorSet0.fp_c9)._m0[191].y, _413);
    float _417 = _415 * _409;
    float2 _2168 = float2(_407, _417);
    float2 _421 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2168, float2(0.0), isnan(_2168))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2168, float2(0.0), isnan(_2168))).xw;
    float _423 = _421.x;
    float _425 = _421.y;
    float2 _2180 = float2(_407, _417);
    float2 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2180, float2(0.0), isnan(_2180))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2180, float2(0.0), isnan(_2180))).xy;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = fma(_411, 0.01200000010430812835693359375, _423);
    float _435 = floor(_433);
    float _437 = fma(_431, 0.5, 0.5);
    float _439 = fma(_429, 0.5, 0.5);
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = -_435;
    float _445 = _433 + _443;
    float _447 = _437 + _445;
    float2 _2213;
    _2213.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_441, _447));
    _2213.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_441, _447));
    float _449 = _2213.x;
    float _451 = _449 * 256.0;
    int _454 = int(_451);
    float _456 = _155 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _458 = _155 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _460 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _462 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _464 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _466 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _464;
    float _468 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _470 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _472 = _470 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _474 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _460);
    float _476 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _468);
    float _478 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _462);
    float _480 = 1.0 / _466;
    float _482 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[1].x, _456);
    float _484 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _476);
    float _486 = _155 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _488 = 0.0 + _445;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[2].x, _458);
    float _494 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _474);
    float _496 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[0].x, _486);
    float _498 = 1.0 / _472;
    float _500 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _478);
    float _502 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _504 = _490 + _502;
    float _506 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[0].z, _496);
    float _508 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _510 = _490 + _508;
    float _512 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[1].z, _482);
    float _514 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[2].z, _492);
    float _516 = _504 * _480;
    float _518 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _520 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _518;
    float _522 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _524 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _522;
    float _526 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _528 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _526;
    float _530 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _534 = _510 * _498;
    bool _536 = _490 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _538 = isnan(_490);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _550 = _548 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    bool _552 = _490 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _554 = isnan(_490);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _566 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _564;
    float _568 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _570 = _568 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _572 = -_546;
    float _574 = _572 + 1.0;
    float _576 = fma(_520, _516, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _578 = fma(_524, _516, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _580 = fma(_528, _516, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _582 = fma(_532, _534, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _584 = fma(_550, _534, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _586 = 1.0 / _566;
    float _588 = _562 * _574;
    float _590 = fma(_570, _534, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _592 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _594 = _592 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _596 = _490 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _598 = isnan(_490);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _578 * _588;
    float _610 = _580 * _588;
    float _612 = _576 * _588;
    float _614 = -_562;
    float _616 = _614 + 1.0;
    float _618 = 1.0 / _594;
    float _620 = -_606;
    float _622 = _620 + 1.0;
    float _624 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _626 = _490 + _624;
    float _628 = fma(_616, (*spvDescriptorSet0.fp_c9)._m0[107].y, _610);
    float _630 = _546 * _622;
    float _632 = fma(_616, (*spvDescriptorSet0.fp_c9)._m0[107].x, _608);
    float _634 = _626 * _586;
    float _636 = fma(_616, (*spvDescriptorSet0.fp_c9)._m0[107].z, _612);
    float _638 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _640 = _490 + _638;
    float _642 = fma(_584, _630, _632);
    float _644 = fma(_582, _630, _628);
    float _646 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _648 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _646;
    float _650 = fma(_590, _630, _636);
    float _652 = _640 * _618;
    float _654 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _656 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _654;
    float _658 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _660 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _658;
    float _662 = fma(_648, _634, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _664 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _666 = _664 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _668 = fma(_656, _634, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _670 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _672 = _670 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    bool _674 = _490 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _676 = isnan(_490);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_660, _634, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _688 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _690 = _688 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _692 = fma(_672, _652, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _694 = fma(_666, _652, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _696 = -_684;
    float _698 = _696 + 1.0;
    float _700 = _500 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _702 = fma(_690, _652, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _704 = _606 * _698;
    float _706 = _514 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _708 = fma(_668, _704, _642);
    float _710 = (*spvDescriptorSet0.fp_c10)._m0[9].z * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _712 = _484 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _714 = _494 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _716 = fma((*spvDescriptorSet0.fp_c10)._m0[8].z, (*spvDescriptorSet0.fp_c8)._m0[0].x, _710);
    float _718 = fma((*spvDescriptorSet0.fp_c10)._m0[10].z, (*spvDescriptorSet0.fp_c8)._m0[0].z, _716);
    float _720 = (*spvDescriptorSet0.fp_c10)._m0[9].z * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _722 = (*spvDescriptorSet0.fp_c10)._m0[9].z * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _724 = fma(_718, -7.0, _714);
    float _726 = fma((*spvDescriptorSet0.fp_c10)._m0[8].z, (*spvDescriptorSet0.fp_c8)._m0[1].x, _720);
    float _728 = fma((*spvDescriptorSet0.fp_c10)._m0[8].z, (*spvDescriptorSet0.fp_c8)._m0[2].x, _722);
    float _730 = fma((*spvDescriptorSet0.fp_c10)._m0[10].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _726);
    float _732 = fma((*spvDescriptorSet0.fp_c10)._m0[10].z, (*spvDescriptorSet0.fp_c8)._m0[2].z, _728);
    float _734 = fma(_730, -7.0, _700);
    float _736 = (*spvDescriptorSet0.fp_c10)._m0[9].y * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _738 = (*spvDescriptorSet0.fp_c10)._m0[9].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _740 = fma(_732, -7.0, _712);
    float _742 = _512 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _744 = fma((*spvDescriptorSet0.fp_c10)._m0[8].y, (*spvDescriptorSet0.fp_c8)._m0[0].x, _736);
    float _746 = fma((*spvDescriptorSet0.fp_c10)._m0[8].y, (*spvDescriptorSet0.fp_c8)._m0[1].x, _738);
    float _748 = fma((*spvDescriptorSet0.fp_c10)._m0[10].y, (*spvDescriptorSet0.fp_c8)._m0[0].z, _744);
    float _750 = fma((*spvDescriptorSet0.fp_c10)._m0[10].y, (*spvDescriptorSet0.fp_c8)._m0[1].z, _746);
    float _752 = abs(_748);
    float _754 = abs(_750);
    float _756 = precise::max(_752, _754);
    bool _758 = _756 >= 16.0;
    float _760 = 1.0 / _706;
    float _762 = _748;
    float _764 = _750;
    int _766 = as_type<int>(_718);
    float _768 = _512;
    int _770 = as_type<int>(_742);
    if (_758)
    {
        float _772 = _748 * 0.0625;
        _762 = _772;
    }
    float _774 = _762;
    if (_758)
    {
        float _776 = _750 * 0.0625;
        _764 = _776;
    }
    float _778 = _764;
    float _780 = abs(_774);
    bool _782 = _780 != 0.0;
    bool _784 = isnan(_780);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _740 * _760;
    float _794 = abs(_778);
    bool _796 = _794 == 0.0;
    float _798 = abs(_778);
    bool _800 = _798 == 0.0;
    bool _802 = !_790;
    bool _804 = _800 && _802;
    float _806 = -_734;
    float _808 = fma(_742, _792, _806);
    bool _810 = false;
    if (_804)
    {
        bool _812 = as_type<int>(_778) >= 0;
        _810 = _812;
    }
    bool _814 = _810;
    int _816 = _814 ? (-1) : 0;
    bool _818 = _814;
    if (_804)
    {
        int _820 = _814 ? 0 : 1078530011;
        _766 = _820;
    }
    int _822 = _766;
    if (_804)
    {
        int _824 = int(0x80000000) & as_type<int>(_774);
        int _826 = _822 | _824;
        _768 = as_type<float>(_826);
    }
    float _828 = _768;
    bool _830 = !_790;
    bool _832 = _830 && _796;
    float _834 = _828;
    float _836 = _828;
    if (!_832)
    {
        float _838 = abs(_774);
        bool _840 = _838 != as_type<float>(0x7f800000u /* inf */);
        bool _842 = isnan(_838);
        bool _844 = _840 || _842;
        bool _846 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _848 = _844 || _846;
        float _850 = abs(_778);
        bool _852 = _850 == as_type<float>(0x7f800000u /* inf */);
        float _854 = abs(_778);
        bool _856 = _854 == as_type<float>(0x7f800000u /* inf */);
        bool _858 = !_848;
        bool _860 = _856 && _858;
        if (_860)
        {
            bool _862 = as_type<int>(_778) >= 0;
            _816 = _862 ? (-1) : 0;
        }
        int _864 = _816;
        _818 = _864 != 0;
        if (_860)
        {
            _770 = 1075235812;
        }
        int _866 = _770;
        int _868 = _866;
        if (_860)
        {
            int _870 = ~_864;
            int _872 = (_870 != 0) ? _866 : 1061752795;
            _868 = _872;
        }
        int _874 = _868;
        if (_860)
        {
            int _876 = int(0x80000000) & as_type<int>(_774);
            int _878 = _874 | _876;
            _834 = as_type<float>(_878);
        }
        float _880 = _834;
        bool _882 = !_848;
        bool _884 = _882 && _852;
        _836 = _880;
        if (!_884)
        {
            float _886 = abs(_774);
            float _888 = abs(_778);
            float _890 = precise::max(_886, _888);
            float _892 = abs(_774);
            float _894 = abs(_778);
            float _896 = precise::min(_892, _894);
            float _898 = 1.0 / _890;
            float _900 = abs(_774);
            float _902 = abs(_778);
            bool _904 = _900 > _902;
            bool _906 = as_type<int>(_778) >= 0;
            float _908 = _896 * _898;
            float _910 = _908 * _908;
            float _912 = _910 + 11.33538818359375;
            float _914 = fma(_910, _912, 28.84246826171875);
            float _916 = fma(_910, _914, 19.6966705322265625);
            float _918 = fma(_910, -0.82336294651031494140625, -5.674867153167724609375);
            float _920 = fma(_910, _918, -6.565555095672607421875);
            float _922 = 1.0 / _916;
            float _924 = _910 * _920;
            float _926 = abs(_774);
            float _928 = abs(_778);
            float _930 = _926 + _928;
            int _932 = as_type<int>(_774) & int(0x80000000);
            float _934 = _908 * _924;
            bool _936 = _930 > as_type<float>(0x7f800000u /* inf */);
            bool _938 = isnan(_930);
            bool _940 = _936 || _938;
            bool _942 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _944 = _940 || _942;
            float _946 = fma(_934, _922, _908);
            float _948 = _946;
            _836 = _930;
            _818 = _906;
            if (_904)
            {
                float _950 = -_946;
                float _952 = _950 + 1.57079637050628662109375;
                _948 = _952;
            }
            float _954 = _948;
            int _956 = as_type<int>(_954);
            if (!_906)
            {
                float _958 = -_954;
                float _960 = _958 + 3.1415927410125732421875;
                _956 = as_type<int>(_960);
            }
            int _962 = _956;
            if (!_944)
            {
                int _964 = _932 | _962;
                _836 = as_type<float>(_964);
            }
        }
    }
    float _966 = _836;
    bool _968 = _818;
    float _970 = _966 * (-0.15915493667125701904296875);
    float _972 = _506 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _974 = _808 * (-0.3300000131130218505859375);
    float _976 = _411 * 0.1599999964237213134765625;
    float _978 = _970 * 6.283185482025146484375;
    float _980 = cos(_978);
    float _982 = -_724;
    float _984 = fma(_972, _792, _982);
    float _986 = _984 * 0.3300000131130218505859375;
    float _988 = _970 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _974 * _980;
    float _994 = _974 * _990;
    float _996 = fma(_986, _990, _992);
    float _998 = -_994;
    float _1000 = fma(_986, _980, _998);
    float _1002 = _976 * 0.15915493667125701904296875;
    float _1004 = _996 + (-0.1500000059604644775390625);
    float _1006 = _1004 * _1004;
    float _1008 = _1002 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = abs(_1000);
    float _1014 = abs(_1004);
    float _1016 = precise::max(_1012, _1014);
    float _1018 = fma(_1000, _1000, _1006);
    bool _1020 = _1016 >= 16.0;
    float _1022 = sqrt(_1018);
    float _1024 = fma(_1010, 0.0500000007450580596923828125, 1.0);
    float _1026 = _1004;
    float _1028 = _1000;
    bool _1030 = _968;
    int _1032 = as_type<int>(_1010);
    int _1034 = as_type<int>(_996);
    if (_1020)
    {
        float _1036 = fma(_996, 0.0625, -0.00937500037252902984619140625);
        _1026 = _1036;
    }
    float _1038 = _1026;
    float _1040 = fma(_1000, _1024, 0.5);
    if (_1020)
    {
        float _1042 = _1000 * 0.0625;
        _1028 = _1042;
    }
    float _1044 = _1028;
    float _1046 = fma(_1010, -0.0500000007450580596923828125, 1.0);
    float _1048 = abs(_1038);
    bool _1050 = _1048 != 0.0;
    bool _1052 = isnan(_1048);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.0);
    bool _1058 = _1054 || _1056;
    float _1060 = abs(_1044);
    bool _1062 = _1060 == 0.0;
    float _1064 = fma(_996, _1046, 0.300000011920928955078125);
    float _1066 = abs(_1044);
    bool _1068 = _1066 == 0.0;
    bool _1070 = !_1058;
    bool _1072 = _1068 && _1070;
    if (_1072)
    {
        bool _1074 = as_type<int>(_1044) >= 0;
        _1030 = _1074;
    }
    bool _1076 = _1030;
    int _1078 = _1076 ? (-1) : 0;
    if (_1072)
    {
        int _1080 = _1076 ? 0 : 1078530011;
        _1032 = _1080;
    }
    int _1082 = _1032;
    if (_1072)
    {
        int _1084 = int(0x80000000) & as_type<int>(_1038);
        int _1086 = _1082 | _1084;
        _1034 = _1086;
    }
    int _1088 = _1034;
    bool _1090 = !_1058;
    bool _1092 = _1090 && _1062;
    int _1094 = _1088;
    float _1096 = as_type<float>(_1088);
    if (!_1092)
    {
        float _1098 = abs(_1038);
        bool _1100 = _1098 != as_type<float>(0x7f800000u /* inf */);
        bool _1102 = isnan(_1098);
        bool _1104 = _1100 || _1102;
        bool _1106 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1108 = _1104 || _1106;
        float _1110 = abs(_1044);
        bool _1112 = _1110 == as_type<float>(0x7f800000u /* inf */);
        float _1114 = abs(_1044);
        bool _1116 = _1114 == as_type<float>(0x7f800000u /* inf */);
        bool _1118 = !_1108;
        bool _1120 = _1116 && _1118;
        if (_1120)
        {
            bool _1122 = as_type<int>(_1044) >= 0;
            _1078 = _1122 ? (-1) : 0;
        }
        int _1124 = _1078;
        if (_1120)
        {
            _1094 = 1075235812;
        }
        int _1126 = _1094;
        int _1128 = _1126;
        if (_1120)
        {
            int _1130 = ~_1124;
            int _1132 = (_1130 != 0) ? _1126 : 1061752795;
            _1128 = _1132;
        }
        int _1134 = _1128;
        float _1136 = as_type<float>(_1134);
        if (_1120)
        {
            int _1138 = int(0x80000000) & as_type<int>(_1038);
            int _1140 = _1134 | _1138;
            _1136 = as_type<float>(_1140);
        }
        float _1142 = _1136;
        bool _1144 = !_1108;
        bool _1146 = _1144 && _1112;
        _1096 = _1142;
        if (!_1146)
        {
            float _1148 = abs(_1038);
            float _1150 = abs(_1044);
            float _1152 = precise::max(_1148, _1150);
            float _1154 = abs(_1038);
            float _1156 = abs(_1044);
            float _1158 = precise::min(_1154, _1156);
            float _1160 = 1.0 / _1152;
            float _1162 = abs(_1038);
            float _1164 = abs(_1044);
            bool _1166 = _1162 > _1164;
            bool _1168 = as_type<int>(_1044) >= 0;
            float _1170 = _1158 * _1160;
            float _1172 = _1170 * _1170;
            float _1174 = _1172 + 11.33538818359375;
            float _1176 = fma(_1172, _1174, 28.84246826171875);
            float _1178 = fma(_1172, _1176, 19.6966705322265625);
            float _1180 = fma(_1172, -0.82336294651031494140625, -5.674867153167724609375);
            float _1182 = fma(_1172, _1180, -6.565555095672607421875);
            float _1184 = 1.0 / _1178;
            float _1186 = _1172 * _1182;
            float _1188 = abs(_1038);
            float _1190 = abs(_1044);
            float _1192 = _1188 + _1190;
            int _1194 = as_type<int>(_1038) & int(0x80000000);
            float _1196 = _1170 * _1186;
            bool _1198 = _1192 > as_type<float>(0x7f800000u /* inf */);
            bool _1200 = isnan(_1192);
            bool _1202 = _1198 || _1200;
            bool _1204 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1206 = _1202 || _1204;
            float _1208 = fma(_1196, _1184, _1170);
            float _1210 = _1208;
            _1096 = _1192;
            if (_1166)
            {
                float _1212 = -_1208;
                float _1214 = _1212 + 1.57079637050628662109375;
                _1210 = _1214;
            }
            float _1216 = _1210;
            int _1218 = as_type<int>(_1216);
            if (!_1168)
            {
                float _1220 = -_1216;
                float _1222 = _1220 + 3.1415927410125732421875;
                _1218 = as_type<int>(_1222);
            }
            int _1224 = _1218;
            if (!_1206)
            {
                int _1226 = _1194 | _1224;
                _1096 = as_type<float>(_1226);
            }
        }
    }
    float _1228 = _1096;
    float _1230 = float(uint(_454));
    float _1232 = _411 * (-0.00999999977648258209228515625);
    float _1234 = _1228 * 0.6366198062896728515625;
    float _1236 = _1230 * 0.00390625;
    float _1238 = fma(_1022, 0.300000011920928955078125, _1232);
    float _1240 = precise::min(_1236, 2.0);
    float2 _3483 = float2(_441, _447);
    float3 _1244 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3483, float2(0.0), isnan(_3483)), level(_1240)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3483, float2(0.0), isnan(_3483)), level(_1240)).xyz;
    float _1246 = _1244.x;
    float _1248 = _1244.y;
    float _1250 = _1244.z;
    float2 _3498 = float2(_1040, _1064);
    float4 _1253 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_3498, float2(0.0), isnan(_3498))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_3498, float2(0.0), isnan(_3498))).xyzw;
    float _1255 = _1253.x;
    float _1257 = _1253.y;
    float _1259 = _1253.z;
    float _1261 = _1253.w;
    float2 _3514 = float2(_1234, _1238);
    float _1263 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_3514, float2(0.0), isnan(_3514))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_3514, float2(0.0), isnan(_3514))).w;
    float _1265 = fma(_319, 2.0, -1.0);
    float _1267 = fma(_321, 2.0, -1.0);
    float _1269 = abs(_165);
    float _1271 = _1269 * 2.0;
    bool _1273 = _490 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _1275 = isnan(_490);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = fma(_686, _704, _650);
    float _1287 = abs(_1265);
    float _1289 = precise::max(_1287, 0.699999988079071044921875);
    float _1291 = abs(_1267);
    float _1293 = precise::max(_1291, 0.699999988079071044921875);
    float _1295 = abs(_1271);
    float _1297 = log2(_1295);
    float _1299 = precise::min(_1289, 0.98500001430511474609375);
    float _1301 = precise::min(_1293, 0.98500001430511474609375);
    float _1303 = abs(_1265);
    bool _1305 = _1303 >= 0.98500001430511474609375;
    bool _1307 = isnan(_1303);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan(0.98500001430511474609375);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = fma(_1299, 3.5087716579437255859375, -2.456140041351318359375);
    float _1319 = abs(_1267);
    bool _1321 = _1319 >= 0.98500001430511474609375;
    bool _1323 = isnan(_1319);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.98500001430511474609375);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = fma(_1301, 3.5087716579437255859375, -2.456140041351318359375);
    float _1335 = _1317 * _1333;
    float _1337 = _1335 * _1335;
    float _1339 = _1297 * 4.0;
    float _1341 = in.m_55.y;
    float _1343 = _1337 * 0.100000001490116119384765625;
    float _1345 = abs(_259);
    float _1347 = _1345 * 2.0;
    float _1349 = exp2(_1339);
    float _1351 = fma(_1315, _1331, _1343);
    float _1353 = _323 * 0.3333333432674407958984375;
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = fma(_323, -0.3333333432674407958984375, 1.0);
    float _1359 = precise::clamp(_1357, 0.0, 1.0);
    float _1361 = fma(_1355, -2.0, 3.0);
    float _1363 = _1355 * _1355;
    float _1365 = abs(_1347);
    float _1367 = log2(_1365);
    float _1369 = fma(_1359, -2.0, 3.0);
    float _1371 = _1359 * _1359;
    float _1373 = _1361 * _1363;
    float _1375 = _1369 * _1371;
    float _1377 = _1367 * 4.0;
    float _1379 = in.m_57.z;
    float _1381 = gl_FragCoord.w;
    float _1383 = _1379 * _1381;
    float _1385 = -_1341;
    float _1387 = _1385 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _1389 = exp2(_1377);
    float _1391 = _1387 * _1387;
    float _1393 = precise::max(_1349, _1389);
    float _1395 = fma(_662, _704, _644);
    float _1397 = in.m_57.y;
    float _1399 = gl_FragCoord.w;
    float _1401 = _1397 * _1399;
    float _1403 = -_1393;
    float _1405 = _1403 + 1.0;
    float _1407 = in.m_57.x;
    float _1409 = gl_FragCoord.w;
    float _1411 = _1407 * _1409;
    float _1413 = _1373 * _1405;
    float _1415 = in.m_55.x;
    float _1417 = _87 * _1401;
    float _1419 = -_1415;
    float _1421 = _1419 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _1423 = fma(_1421, _1421, _1391);
    float _1425 = in.m_55.z;
    float _1427 = -_1425;
    float _1429 = _1427 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _1431 = fma(_1429, _1429, _1423);
    float _1433 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _1435 = sqrt(_1431);
    float _1437 = _1433 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _1439 = _1435 * _1437;
    float _1441 = precise::max(_1435, 25.0);
    float _1443 = precise::max(_1439, 6.0);
    float _1445 = precise::min(_1441, 80.0);
    float _1447 = precise::min(_1443, 8.0);
    float _1449 = -_1283;
    float _1451 = _1449 + 1.0;
    float _1453 = fma(_1445, 0.001090909005142748355865478515625, -0.02727272547781467437744140625);
    float _1455 = _684 * _1451;
    float _1457 = fma(_1447, 0.5, -3.0);
    float _1459 = fma(_692, _1455, _708);
    float _1461 = fma(_694, _1455, _1395);
    float _1463 = fma(_1445, 0.01818181760609149932861328125, -0.454545438289642333984375);
    float _1465 = precise::max(0.0, _1022);
    float _1467 = fma(_1463, 0.20000000298023223876953125, 1.60000002384185791015625);
    float _1469 = precise::max(_1022, 0.100000001490116119384765625);
    float _1471 = _87 * _1383;
    float _1473 = 1.0 / _1467;
    float _1475 = precise::min(_1469, 0.89999997615814208984375);
    float _1477 = precise::min(_1467, _1465);
    float _1479 = fma(_1475, -1.25000011920928955078125, 1.125);
    float _1481 = _87 * _1411;
    float _1483 = fma(_1445, 0.01818181760609149932861328125, -0.204545438289642333984375);
    float _1485 = _1479 * _1479;
    float _1487 = -_1477;
    float _1489 = fma(_1487, _1473, 1.0);
    float _1491 = fma(_702, _1455, _1285);
    float _1493 = fma(_1283, (*spvDescriptorSet0.fp_c9)._m0[111].x, _1459);
    float _1495 = fma(_1283, (*spvDescriptorSet0.fp_c9)._m0[111].y, _1461);
    float _1497 = _1479 * _1485;
    float _1499 = _1489 * _1489;
    float _1501 = fma(_1283, (*spvDescriptorSet0.fp_c9)._m0[111].z, _1491);
    float _1503 = _1246 * _1246;
    float _1505 = _1248 * _1248;
    float _1507 = _1250 * _1250;
    float _1509 = _425 * _1503;
    float _1511 = _425 * _1505;
    float _1513 = _425 * _1507;
    float _1515 = _1489 * _1499;
    float _1517 = _1509 * _1493;
    float _1519 = _1511 * _1495;
    float _1521 = -_1481;
    float _1523 = _1521 + 2.0;
    float _1525 = _1255 * _1255;
    float _1527 = -_1261;
    float _1529 = _1527 + 1.0;
    float _1531 = _1513 * _1501;
    float _1533 = _1259 * _1259;
    float _1535 = fma(_1525, _1523, _1481);
    float _1537 = _1529 * _1375;
    float _1539 = -_1417;
    float _1541 = _1539 + 2.0;
    float _1543 = _1257 * _1257;
    float _1545 = _1261 * _1535;
    float _1547 = _1481 * _1351;
    float _1549 = _1417 * _1351;
    float _1551 = -_1471;
    float _1553 = _1551 + 2.0;
    float _1555 = _1471 * _1351;
    float _1557 = _1453 * _1537;
    float _1559 = fma(_1543, _1541, _1417);
    float _1561 = fma(_1517, _1529, _1547);
    float _1563 = fma(_1519, _1529, _1549);
    float _1565 = fma(_1263, _1515, _1497);
    float _1567 = fma(_1533, _1553, _1471);
    float _1569 = fma(_1531, _1529, _1555);
    float _1571 = _1481 * _1557;
    float _1573 = _1417 * _1557;
    float _1575 = _1471 * _1557;
    float _1577 = _1261 * _1559;
    float _1579 = _1261 * _1567;
    float _1581 = fma(_1561, _1413, _1571);
    float _1583 = _1565 * _1483;
    float _1585 = fma(_1563, _1413, _1573);
    float _1587 = fma(_1569, _1413, _1575);
    float _1589 = fma(_1581, _1457, _1545);
    float _1591 = _1529 * _1583;
    float _1593 = fma(_1585, _1457, _1577);
    float _1595 = fma(_1587, _1457, _1579);
    float _1597 = fma(_1481, _1591, _1589);
    float _1599 = fma(_1417, _1591, _1593);
    float _1601 = fma(_1471, _1591, _1595);
    float _1603 = _1581;
    if (!_199)
    {
        out.m_60.x = _1597;
        out.m_60.y = _1599;
        out.m_60.z = _1601;
        out.m_60.w = 1.0;
        return out;
    }
    float _1605 = _1599 * 0.715200006961822509765625;
    float _1607 = fma(_1597, 0.2125999927520751953125, _1605);
    float _1609 = fma(_1601, 0.072200000286102294921875, _1607);
    bool _1611 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1613 = 1.0 / _1609;
    float _1615 = 0.0 + _187;
    float _1617 = precise::clamp(_1615, 0.0, 1.0);
    float _1619 = _1617;
    if (_1611)
    {
        float _1621 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1623 = _129 + _1621;
        _201 = _1623;
    }
    float _1625 = _201;
    float _1627 = _1613 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    if (_1611)
    {
        float _1631 = _1625 * 8.0;
        float _1633 = precise::clamp(_1631, 0.0, 1.0);
        _1603 = _1633;
    }
    float _1635 = _1603;
    float _1637 = fma(_1629, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_1611)
    {
        float _1639 = _1617 * _1635;
        _1619 = _1639;
    }
    float _1641 = _1619;
    float _1643 = _1597 * _1637;
    float _1645 = _1599 * _1637;
    float _1647 = _1601 * _1637;
    float _1649 = 0.0 + _1641;
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    out.m_60.x = _1643;
    out.m_60.y = _1645;
    out.m_60.z = _1647;
    out.m_60.w = _1651;
    return out;
}

