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
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _536 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_536, float2(0.0), isnan(_536))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_33.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_35.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_37.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_39.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _69 * _90;
    float _112 = _69 * _96;
    float _114 = _69 * _102;
    float _116 = _69 * _108;
    float _118 = in.m_41.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_43.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_37.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_37.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_37.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = -_110;
    float _150 = fma(_84, _112, _148);
    float _152 = _114 * _150;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _154 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * _116;
    bool _164 = _160 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _172 = _168 || _170;
    float _174 = in.m_41.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_41.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_172)
    {
        discard_fragment();
    }
    float _186 = _69 * _122;
    float _188 = -_82;
    float _190 = _188 + 1.0;
    float _192 = _69 * _178;
    float _194 = _69 * _184;
    float _196 = _192 * _192;
    float _198 = fma(_186, _186, _196);
    float _200 = fma(_194, _194, _198);
    float _202 = rsqrt(_200);
    float _204 = _192 * _202;
    float _206 = _186 * _202;
    float _208 = _194 * _202;
    float _210 = _204 * _204;
    float _212 = fma(_206, _206, _210);
    float _214 = fma(_208, _208, _212);
    float _216 = rsqrt(_214);
    float _218 = _204 * _216;
    float _220 = _206 * _216;
    float _222 = _208 * _216;
    float _224 = _218 * _218;
    float _226 = in.m_43.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = fma(_220, _220, _224);
    float _234 = fma(_222, _222, _232);
    float _236 = rsqrt(_234);
    float _238 = _220 * _236;
    float _240 = _218 * _236;
    float _242 = _222 * _236;
    float _244 = in.m_43.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _69 * _230;
    float _252 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _254 = _250 + _252;
    float _256 = _69 * _128;
    float _258 = _254 * _254;
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _262 = _256 + _260;
    float _264 = _69 * _248;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _268 = _264 + _266;
    float _270 = fma(_268, _268, _258);
    float _272 = fma(_262, _262, _270);
    float _274 = rsqrt(_272);
    float _276 = _254 * _274;
    float _278 = _268 * _274;
    float _280 = _262 * _274;
    float _282 = _242 * 0.577381789684295654296875;
    float _284 = _240 * _276;
    float _286 = in.m_33.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = fma(_240, 0.816474258899688720703125, _282);
    float _294 = fma(_238, _278, _284);
    float _296 = 0.0 + _292;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = fma(_242, _280, _294);
    float _302 = fma(_240, 0.5, 0.5);
    float _304 = in.m_33.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_33.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _318 = _316 + 1.0;
    float _320 = fma(_302, -0.1500000059604644775390625, 0.5);
    float _322 = fma(_302, 0.1500000059604644775390625, 0.5);
    float _324 = abs(_300);
    float _326 = -_324;
    float _328 = _326 + 1.0;
    float _330 = fma(_298, _318, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _332 = fma(_302, 0.25, 0.5);
    float _334 = fma(_302, -0.25, 0.5);
    float _336 = fma(_330, _322, _320);
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = fma(_302, 0.7000000476837158203125, 0.5);
    float _342 = fma(_302, -0.7000000476837158203125, 0.5);
    float _344 = fma(_330, _334, _332);
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = -_78;
    float _350 = _348 + 1.0;
    float _352 = fma(_292, 0.5, 0.5);
    float _354 = fma(_330, _342, _340);
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _69 * _134;
    float _360 = _69 * _140;
    float _362 = _69 * _146;
    float _364 = -_80;
    float _366 = _364 + 1.0;
    float _368 = _358 * _350;
    float _370 = _328 * _328;
    float _372 = _362 * _190;
    float _374 = _360 * _366;
    float _376 = _69 * _290;
    float _378 = _370 * _352;
    float _380 = fma(_82, _376, _372);
    float _382 = _69 * _308;
    float _384 = _69 * _314;
    float _386 = fma(_78, _382, _368);
    float _388 = fma(_80, _384, _374);
    float _390 = fma(_380, _378, _380);
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = fma(_386, _378, _386);
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = fma(_388, _378, _388);
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _356 * _392;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _338 * _396;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _346 * _400;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    if (!_172)
    {
        out.m_46.x = _408;
        out.m_46.y = _412;
        out.m_46.z = _404;
        out.m_46.w = _158;
        return out;
    }
    float _414 = in.m_48.w;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = _69 * _418;
    bool _422 = _420 != 1.0;
    bool _424 = isnan(_420);
    bool _426 = _422 || _424;
    bool _428 = isnan(1.0);
    bool _430 = _426 || _428;
    bool _432 = !_430;
    if (!_432)
    {
        float _434 = gl_FragCoord.x;
        float _436 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _438 = _434 / _436;
        float _440 = gl_FragCoord.y;
        float _442 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _444 = _440 / _442;
        float _446 = _420 * 256.0;
        float _448 = trunc(_446);
        int _451 = int(_448);
        float _453 = trunc(_438);
        int _455 = int(_453);
        float _457 = trunc(_444);
        int _459 = int(_457);
        int _461 = _455 + 2;
        int _463 = _461 >> 1;
        uint _466 = uint(int(uint(_459) >> uint(1)));
        int _468 = _463 ^ int(_466);
        int _470 = _468 << 16;
        int _472 = _470 ^ _463;
        int _474 = 983055 & _472;
        int _476 = _474 << 6;
        int _478 = _476 + _474;
        int _480 = _478 & 13369548;
        uint _482 = uint(int(uint(_480) >> uint(3)));
        int _484 = _480 | int(_482);
        uint _486 = uint(int(uint(_451) >> uint(7)));
        int _488 = int(_486) + _451;
        int _490 = _484 & 5570560;
        int _492 = _484 & 85;
        uint _494 = uint(int(uint(_490) >> uint(15)));
        int _496 = int(_494) + _492;
        bool _498 = uint(_488) > uint(_496);
        if (!_498)
        {
            discard_fragment();
        }
        if (!_498)
        {
            out.m_46.x = _408;
            out.m_46.y = _412;
            out.m_46.z = _404;
            out.m_46.w = _160;
            return out;
        }
    }
    float _500 = 0.0 + _160;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    out.m_46.x = 1.0;
    out.m_46.y = 1.0;
    out.m_46.z = 1.0;
    out.m_46.w = _502;
    return out;
}

