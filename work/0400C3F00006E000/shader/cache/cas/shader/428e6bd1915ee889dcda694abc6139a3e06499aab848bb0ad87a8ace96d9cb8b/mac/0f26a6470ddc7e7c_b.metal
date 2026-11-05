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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
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
    float _77 = in.m_45.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_45.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_45.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_45.y;
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
    float2 _627 = float2(_116, _112);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_627, float2(0.0), isnan(_627))).w;
    float3 _640 = float3(_114, _118, float(int(_110)));
    float3 _644 = select(_640, float3(0.0), isnan(_640));
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _644.xy, uint(rint(_644.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _644.xy, uint(rint(_644.z))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float _133 = in.m_47.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_49.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_51.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _101 * _137;
    float _153 = _101 * _143;
    float _155 = _101 * _149;
    float _157 = in.m_47.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_49.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_49.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_49.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _101 * _161;
    float _183 = _101 * _167;
    float _185 = _101 * _173;
    float _187 = -_151;
    float _189 = fma(_131, _120, _187);
    float _191 = _153 * _189;
    float _193 = 0.0 + _191;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = _195 * _155;
    bool _201 = _197 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _203 = isnan(_197);
    bool _205 = _201 || _203;
    bool _207 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _209 = _205 || _207;
    float _211 = in.m_47.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_47.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    if (!_209)
    {
        discard_fragment();
    }
    float _223 = fma(_125, _181, _183);
    float _225 = _101 * _215;
    float _227 = _101 * _221;
    float _229 = _101 * _179;
    float _231 = fma(_127, _225, _185);
    float _233 = fma(_129, _227, _229);
    if (!_209)
    {
        out.m_54.x = _223;
        out.m_54.y = _231;
        out.m_54.z = _233;
        out.m_54.w = _191;
        return out;
    }
    float _235 = in.m_56.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = _101 * _239;
    bool _243 = _241 != 1.0;
    bool _245 = isnan(_241);
    bool _247 = _243 || _245;
    bool _249 = isnan(1.0);
    bool _251 = _247 || _249;
    bool _253 = !_251;
    if (!_253)
    {
        float _255 = gl_FragCoord.x;
        float _257 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _259 = _255 / _257;
        float _261 = gl_FragCoord.y;
        float _263 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _265 = _261 / _263;
        float _267 = _241 * 256.0;
        float _269 = trunc(_267);
        int _272 = int(_269);
        float _274 = trunc(_259);
        int _276 = int(_274);
        float _278 = trunc(_265);
        int _280 = int(_278);
        int _282 = _276 + 2;
        int _284 = _282 >> 1;
        uint _286 = uint(int(uint(_280) >> uint(1)));
        int _288 = _284 ^ int(_286);
        int _290 = _288 << 16;
        int _292 = _290 ^ _284;
        int _294 = 983055 & _292;
        int _296 = _294 << 6;
        int _298 = _296 + _294;
        int _300 = _298 & 13369548;
        uint _302 = uint(int(uint(_300) >> uint(3)));
        int _304 = _300 | int(_302);
        uint _306 = uint(int(uint(_272) >> uint(7)));
        int _308 = int(_306) + _272;
        int _310 = _304 & 5570560;
        int _312 = _304 & 85;
        uint _314 = uint(int(uint(_310) >> uint(15)));
        int _316 = int(_314) + _312;
        bool _318 = uint(_308) > uint(_316);
        if (!_318)
        {
            discard_fragment();
        }
        if (!_318)
        {
            out.m_54.x = _223;
            out.m_54.y = _231;
            out.m_54.z = _233;
            out.m_54.w = _197;
            return out;
        }
    }
    float _320 = in.m_58.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_58.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_58.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_56.x;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _101 * _324;
    float _346 = _101 * _330;
    float _348 = _101 * _336;
    float _350 = _344 * _344;
    float _352 = fma(_346, _346, _350);
    float _354 = fma(_348, _348, _352);
    float _356 = rsqrt(_354);
    float _358 = _346 * _356;
    float _360 = _344 * _356;
    float _362 = _348 * _356;
    float _364 = abs(_358);
    float _366 = abs(_360);
    float _368 = precise::max(_364, _366);
    float _370 = abs(_362);
    float _372 = precise::max(_370, _368);
    float _374 = _101 * _342;
    float _376 = 1.0 / _372;
    float _378 = precise::min(_374, 1.0);
    float _380 = -_376;
    float _382 = _362 * _380;
    float _384 = _358 * _376;
    float _386 = _360 * _376;
    float3 _1036 = float3(_384, _386, _382);
    float3 _390 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1036, float3(0.0), isnan(_1036)), level(_378)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1036, float3(0.0), isnan(_1036)), level(_378)).xyz;
    float _392 = _390.x;
    float _394 = _390.y;
    float _396 = _390.z;
    float _398 = in.m_60.x;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_60.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_60.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_62.z;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_62.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_62.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_64.x;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_64.w;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_64.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_64.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = _101 * _402;
    float _460 = _101 * _408;
    float _462 = _101 * _414;
    bool _464 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _466 = fma(_396, 0.20999999344348907470703125, _460);
    float _468 = fma(_392, 0.20999999344348907470703125, _458);
    float _470 = _101 * _420;
    float _472 = fma(_394, 0.20999999344348907470703125, _462);
    float _474 = _101 * _426;
    float _476 = _101 * _432;
    float _478 = _466 + _470;
    float _480 = _468 + _474;
    float _482 = _472 + _476;
    float _484 = _233 * _478;
    float _486 = 0.0 + _197;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = _223 * _480;
    float _492 = _101 * _438;
    float _494 = _101 * _444;
    float _496 = _231 * _482;
    float _498 = _101 * _450;
    float _500 = _101 * _456;
    float _502 = fma(_490, _494, _492);
    float _504 = _492;
    if (!_464)
    {
        _504 = _488;
    }
    float _506 = _504;
    float _508 = fma(_496, _494, _498);
    float _510 = fma(_484, _494, _500);
    bool _512 = !_464;
    float _514 = _506;
    if (!_512)
    {
        float _516 = in.m_66.w;
        float _518 = gl_FragCoord.w;
        float _520 = _516 * _518;
        float _522 = in.m_66.z;
        float _524 = gl_FragCoord.w;
        float _526 = _522 * _524;
        float _528 = _101 * _520;
        float _530 = _101 * _526;
        float _532 = 1.0 / _528;
        float _534 = _530 * _532;
        float _536 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _538 = fma(_534, (*spvDescriptorSet0.fp_c8)._m0[30].w, _536);
        float _540 = 1.0 / _538;
        float _542 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _544 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _546 = fma(_540, _542, _544);
        float _548 = _546 * 8.0;
        float _550 = precise::clamp(_548, 0.0, 1.0);
        float _552 = _488 * _550;
        _514 = _552;
    }
    float _554 = _514;
    float _556 = 0.0 + _554;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    out.m_54.x = _502;
    out.m_54.y = _508;
    out.m_54.z = _510;
    out.m_54.w = _558;
    return out;
}

