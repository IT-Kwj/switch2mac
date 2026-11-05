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
    constant _16* fp_c8 [[id(3)]];
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_43 [[user(locn6), flat]];
    float4 m_58 [[user(locn7)]];
    float4 m_62 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_43.x;
    float _77 = in.m_45.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_45.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_45.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_45.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _73;
    float _103 = rint(_75);
    float _105 = precise::max(_103, 0.0);
    uint _108 = uint(_105);
    uint _110 = clamp(_108, 0u, 65535u);
    float _112 = _101 * _81;
    float _114 = _101 * _87;
    float _116 = _101 * _93;
    float _118 = _101 * _99;
    float3 _643 = float3(_114, _112, float(int(_110)));
    float3 _647 = select(_643, float3(0.0), isnan(_643));
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _647.xy, uint(rint(_647.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _647.xy, uint(rint(_647.z))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float2 _662 = float2(_116, _118);
    float4 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_662, float2(0.0), isnan(_662))).xyzw;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float _139 = _131.w;
    float _141 = in.m_47.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_49.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_51.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _101 * _145;
    float _161 = _101 * _151;
    float _163 = in.m_49.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_47.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_49.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_49.z;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = -_159;
    float _189 = fma(_129, _139, _187);
    float _191 = _101 * _157;
    float _193 = _161 * _189;
    float _195 = 0.0 + _193;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _191;
    bool _203 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _205 = isnan(_199);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _211 = _207 || _209;
    float _213 = in.m_47.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_47.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    if (!_211)
    {
        discard_fragment();
    }
    float _225 = _123 * _133;
    float _227 = _125 * _135;
    float _229 = _127 * _137;
    float _231 = _101 * _167;
    float _233 = _101 * _179;
    float _235 = _101 * _185;
    float _237 = _101 * _217;
    float _239 = _101 * _173;
    float _241 = _101 * _223;
    float _243 = fma(_225, _237, _231);
    float _245 = fma(_227, _239, _233);
    float _247 = fma(_229, _241, _235);
    if (!_211)
    {
        out.m_54.x = _243;
        out.m_54.y = _245;
        out.m_54.z = _247;
        out.m_54.w = _193;
        return out;
    }
    float _249 = in.m_56.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = _101 * _253;
    bool _257 = _255 != 1.0;
    bool _259 = isnan(_255);
    bool _261 = _257 || _259;
    bool _263 = isnan(1.0);
    bool _265 = _261 || _263;
    bool _267 = !_265;
    if (!_267)
    {
        float _269 = gl_FragCoord.x;
        float _271 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _273 = _269 / _271;
        float _275 = gl_FragCoord.y;
        float _277 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _279 = _275 / _277;
        float _281 = _255 * 256.0;
        float _283 = trunc(_281);
        int _286 = int(_283);
        float _288 = trunc(_273);
        int _290 = int(_288);
        float _292 = trunc(_279);
        int _294 = int(_292);
        int _296 = _290 + 2;
        int _298 = _296 >> 1;
        uint _300 = uint(int(uint(_294) >> uint(1)));
        int _302 = _298 ^ int(_300);
        int _304 = _302 << 16;
        int _306 = _304 ^ _298;
        int _308 = 983055 & _306;
        uint _310 = uint(int(uint(_286) >> uint(7)));
        int _312 = int(_310) + _286;
        int _314 = _308 << 6;
        int _316 = _314 + _308;
        int _318 = _316 & 13369548;
        uint _320 = uint(int(uint(_318) >> uint(3)));
        int _322 = _318 | int(_320);
        int _324 = _322 & 5570560;
        int _326 = _322 & 85;
        uint _328 = uint(int(uint(_324) >> uint(15)));
        int _330 = int(_328) + _326;
        bool _332 = uint(_312) > uint(_330);
        if (!_332)
        {
            discard_fragment();
        }
        if (!_332)
        {
            out.m_54.x = _243;
            out.m_54.y = _245;
            out.m_54.z = _247;
            out.m_54.w = _199;
            return out;
        }
    }
    float _334 = in.m_58.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_58.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_58.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_56.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = _101 * _338;
    float _360 = _101 * _344;
    float _362 = _101 * _350;
    float _364 = _358 * _358;
    float _366 = fma(_360, _360, _364);
    float _368 = fma(_362, _362, _366);
    float _370 = rsqrt(_368);
    float _372 = _360 * _370;
    float _374 = _358 * _370;
    float _376 = _362 * _370;
    float _378 = abs(_372);
    float _380 = abs(_374);
    float _382 = precise::max(_378, _380);
    float _384 = abs(_376);
    float _386 = precise::max(_384, _382);
    float _388 = _101 * _356;
    float _390 = 1.0 / _386;
    float _392 = precise::min(_388, 1.0);
    float _394 = -_390;
    float _396 = _376 * _394;
    float _398 = _372 * _390;
    float _400 = _374 * _390;
    float3 _1067 = float3(_398, _400, _396);
    float3 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1067, float3(0.0), isnan(_1067)), level(_392)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1067, float3(0.0), isnan(_1067)), level(_392)).xyz;
    float _406 = _404.x;
    float _408 = _404.y;
    float _410 = _404.z;
    float _412 = in.m_60.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_60.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_60.z;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_62.y;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_62.z;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_62.x;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_64.x;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_64.w;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_64.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_64.z;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    bool _472 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _474 = _101 * _416;
    float _476 = _101 * _422;
    float _478 = _101 * _428;
    float _480 = fma(_408, 0.20999999344348907470703125, _476);
    float _482 = fma(_410, 0.20999999344348907470703125, _478);
    float _484 = fma(_406, 0.20999999344348907470703125, _474);
    float _486 = _101 * _434;
    float _488 = _101 * _440;
    float _490 = _101 * _446;
    float _492 = _480 + _486;
    float _494 = _482 + _488;
    float _496 = _484 + _490;
    float _498 = 0.0 + _199;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _245 * _492;
    float _504 = _247 * _494;
    float _506 = _243 * _496;
    float _508 = _101 * _452;
    float _510 = _101 * _458;
    float _512 = _101 * _464;
    float _514 = _101 * _470;
    float _516 = fma(_506, _510, _508);
    float _518 = fma(_502, _510, _512);
    float _520 = fma(_504, _510, _514);
    float _522 = _508;
    if (!_472)
    {
        _522 = _500;
    }
    float _524 = _522;
    bool _526 = !_472;
    float _528 = _524;
    if (!_526)
    {
        float _530 = in.m_66.w;
        float _532 = gl_FragCoord.w;
        float _534 = _530 * _532;
        float _536 = in.m_66.z;
        float _538 = gl_FragCoord.w;
        float _540 = _536 * _538;
        float _542 = _101 * _534;
        float _544 = _101 * _540;
        float _546 = 1.0 / _542;
        float _548 = _544 * _546;
        float _550 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _552 = fma(_548, (*spvDescriptorSet0.fp_c8)._m0[30].w, _550);
        float _554 = 1.0 / _552;
        float _556 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _558 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _560 = fma(_554, _556, _558);
        float _562 = _560 * 8.0;
        float _564 = precise::clamp(_562, 0.0, 1.0);
        float _566 = _500 * _564;
        _528 = _566;
    }
    float _568 = _528;
    float _570 = 0.0 + _568;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    out.m_54.x = _516;
    out.m_54.y = _518;
    out.m_54.z = _520;
    out.m_54.w = _572;
    return out;
}

