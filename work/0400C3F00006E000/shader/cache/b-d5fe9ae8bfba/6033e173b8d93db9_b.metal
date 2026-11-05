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
    constant _16* fp_c13 [[id(3)]];
    texture2d_array<float> fp_t_tcb_18 [[id(4)]];
    sampler fp_t_tcb_18Smplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_1A [[id(8)]];
    sampler fp_t_tcb_1ASmplr [[id(9)]];
    sampler fp_t_tcb_18Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    sampler fp_t_tcb_1ASmplr_w [[id(12)]];
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
    float4 m_43 [[user(locn2), flat]];
    float4 m_56 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_43.y;
    float _75 = in.m_43.x;
    float _77 = in.m_45.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_47.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_49.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = (*spvDescriptorSet0.fp_c9)._m0[194].z * 0.15915493667125701904296875;
    float _103 = in.m_49.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_47.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_49.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _101 * 6.283185482025146484375;
    float _123 = cos(_121);
    float _125 = in.m_51.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _101 * 6.283185482025146484375;
    float _133 = sin(_131);
    float _135 = 1.0 / _71;
    float _137 = _73 * _123;
    float _139 = fma(_75, _133, _137);
    float _141 = (*spvDescriptorSet0.fp_c9)._m0[194].w + (-5.0);
    float _143 = (*spvDescriptorSet0.fp_c9)._m0[194].w + 5.0;
    float _145 = precise::max(_141, _139);
    float _147 = _135 * _81;
    float _149 = precise::min(_143, _145);
    float _151 = _135 * _93;
    float _153 = _135 * _113;
    float _155 = _135 * _119;
    bool _159 = _147 != 1.0;
    bool _161 = isnan(_147);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = -_141;
    float _171 = _169 + _149;
    float _173 = _135 * _87;
    float _175 = _135 * _99;
    float _177 = _135 * _107;
    float _179 = -_153;
    float _181 = _179 + _155;
    float _183 = -_173;
    float _185 = _183 + _151;
    float _187 = _171 * 0.100000001490116119384765625;
    float _189 = -_175;
    float _191 = _189 + _177;
    float _193 = fma(_187, _185, _173);
    float _195 = fma(_187, _191, _175);
    float _197 = fma(_187, _181, _153);
    float _199 = _135 * _129;
    bool _201 = !_167;
    if (!_201)
    {
        float _203 = gl_FragCoord.x;
        float _205 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _207 = _203 / _205;
        float _209 = gl_FragCoord.y;
        float _211 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _213 = _209 / _211;
        float _215 = trunc(_207);
        int _218 = int(_215);
        float _220 = trunc(_213);
        int _222 = int(_220);
        int _224 = _218 + 2;
        int _226 = _224 >> 1;
        uint _229 = uint(int(uint(_222) >> uint(1)));
        int _231 = _226 ^ int(_229);
        int _233 = _231 << 16;
        int _235 = _233 ^ _226;
        int _237 = 983055 & _235;
        float _239 = _147 * 256.0;
        int _241 = _237 << 6;
        int _243 = _241 + _237;
        float _245 = trunc(_239);
        int _247 = int(_245);
        int _249 = _243 & 13369548;
        uint _251 = uint(int(uint(_249) >> uint(3)));
        int _253 = _249 | int(_251);
        int _255 = _253 & 5570560;
        int _257 = _253 & 85;
        uint _259 = uint(int(uint(_247) >> uint(7)));
        int _261 = int(_259) + _247;
        uint _263 = uint(int(uint(_255) >> uint(15)));
        int _265 = int(_263) + _257;
        bool _267 = uint(_261) > uint(_265);
        if (!_267)
        {
            discard_fragment();
        }
        if (!_267)
        {
            out.m_54.x = _193;
            out.m_54.y = _195;
            out.m_54.z = _197;
            out.m_54.w = _199;
            return out;
        }
    }
    float _269 = in.m_56.w;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_56.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_56.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _135 * _273;
    float _289 = _135 * _279;
    float _291 = _135 * _285;
    float _293 = 1.0 / _287;
    float _295 = _289 * _293;
    float _297 = _291 * _293;
    float3 _854 = float3(_297, _295, float(0));
    float3 _859 = select(_854, float3(0.0), isnan(_854));
    float3 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _859.xy, uint(rint(_859.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _859.xy, uint(rint(_859.z))).xyw;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float _309 = in.m_58.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_58.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_58.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = _135 * _313;
    float _329 = _135 * _319;
    float _331 = _135 * _325;
    float _333 = _327 * _327;
    float _335 = fma(_329, _329, _333);
    float _337 = fma(_331, _331, _335);
    float _339 = rsqrt(_337);
    float _341 = _329 * _339;
    float _343 = _327 * _339;
    float _345 = _331 * _339;
    float _347 = abs(_341);
    float _349 = abs(_343);
    float _351 = precise::max(_347, _349);
    float _353 = abs(_345);
    float _355 = precise::max(_353, _351);
    float _357 = 1.0 / _355;
    float _359 = _341 * _357;
    float _361 = _343 * _357;
    float _363 = -_357;
    float _365 = _345 * _363;
    float _367 = -_307;
    float _369 = _367 + 1.0;
    float _371 = _303 * _305;
    float _373 = -_369;
    float _375 = fma(_373, (*spvDescriptorSet0.fp_c15)._m0[24].w, 1.0);
    float _377 = -_371;
    float _379 = fma(_377, _375, 1.0);
    float _381 = _379 * (*spvDescriptorSet0.fp_c13)._m0[1].w;
    float _383 = precise::min(_381, 1.0);
    float3 _974 = float3(_359, _361, _365);
    float3 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_974, float3(0.0), isnan(_974)), level(_383)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_974, float3(0.0), isnan(_974)), level(_383)).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    float2 _990 = float2(_297, _295);
    float4 _394 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_990, float2(0.0), isnan(_990))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_990, float2(0.0), isnan(_990))).xyzw;
    float _396 = _394.x;
    float _398 = _394.y;
    float _400 = _394.z;
    float _402 = _394.w;
    float _404 = in.m_60.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_60.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_60.z;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_62.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_62.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_62.z;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_64.x;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_64.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_64.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_64.w;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = 0.0 + _199;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = _135 * _408;
    float _470 = _135 * _414;
    float _472 = _135 * _420;
    float _474 = _135 * _462;
    float _476 = fma(_387, 0.20999999344348907470703125, _468);
    float _478 = fma(_389, 0.20999999344348907470703125, _470);
    float _480 = fma(_391, 0.20999999344348907470703125, _472);
    float _482 = _135 * _426;
    float _484 = _135 * _432;
    float _486 = _135 * _438;
    float _488 = _476 + _482;
    float _490 = _478 + _484;
    float _492 = _480 + _486;
    float _494 = _135 * _444;
    float _496 = _135 * _450;
    float _498 = _135 * _456;
    float _500 = _195 * _490;
    float _502 = fma(_402, _494, _396);
    float _504 = fma(_402, _496, _398);
    float _506 = _193 * _488;
    float _508 = _197 * _492;
    float _510 = _402 * _474;
    float _512 = fma(_402, _498, _400);
    float _514 = fma(_506, _510, _502);
    float _516 = fma(_500, _510, _504);
    float _518 = fma(_508, _510, _512);
    out.m_54.x = _514;
    out.m_54.y = _516;
    out.m_54.z = _518;
    out.m_54.w = _466;
    return out;
}

