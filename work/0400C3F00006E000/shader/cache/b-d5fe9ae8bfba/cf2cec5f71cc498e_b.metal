#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _520 = float2(_69, _71);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_520, float2(0.0), isnan(_520))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_520, float2(0.0), isnan(_520))).xw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _67 * _85;
    float _101 = in.m_35.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _67 * _97;
    float _109 = _67 * _105;
    float _111 = _99 * _79;
    float _113 = _67 * _91;
    float _115 = 0.0 + _111;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _117 * _113;
    bool _123 = _119 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _125 = isnan(_119);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _131 = _127 || _129;
    if (!_131)
    {
        discard_fragment();
    }
    float2 _610;
    _610.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_107, _109));
    _610.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_107, _109));
    float _133 = _610.x;
    float _135 = _133 * 256.0;
    int _138 = int(_135);
    float _140 = float(uint(_138));
    float _142 = _140 * 0.00390625;
    float _144 = precise::min(_142, 2.0);
    float2 _629 = float2(_107, _109);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_629, float2(0.0), isnan(_629)), level(_144)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_629, float2(0.0), isnan(_629)), level(_144)).w;
    float _148 = in.m_37.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_37.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_37.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _67 * _152;
    float _168 = _67 * _158;
    float _170 = _67 * _164;
    float _172 = -_168;
    float _174 = _166 + _172;
    bool _176 = _166 >= _168;
    bool _178 = isnan(_166);
    bool _180 = _176 || _178;
    bool _182 = isnan(_168);
    bool _184 = _180 || _182;
    float _186 = float(_184);
    float _188 = fma(_186, _174, _168);
    float _190 = -_166;
    float _192 = _190 + _168;
    float _194 = -_170;
    float _196 = _194 + _188;
    bool _198 = _170 >= _188;
    bool _200 = isnan(_170);
    bool _202 = _198 || _200;
    bool _204 = isnan(_188);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = fma(_186, _192, _166);
    float _212 = -_188;
    float _214 = _170 + _212;
    float _216 = _166 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _218 = fma(_208, _196, _170);
    float _220 = fma(_208, _214, _188);
    float _222 = -_186;
    float _224 = _222 + 0.666666686534881591796875;
    float _226 = precise::min(_210, _218);
    float _228 = -_210;
    float _230 = _228 + _218;
    float _232 = -_226;
    float _234 = _220 + _232;
    float _236 = fma(_234, 6.0, 1.0000000133514319600180897396058e-10);
    float _238 = _186 + (-1.0);
    float _240 = spvFAdd(_220, 1.0000000133514319600180897396058e-10);
    float _242 = -_224;
    float _244 = _238 + _242;
    float _246 = 1.0 / _236;
    float _248 = fma(_208, _244, _224);
    float _250 = 1.0 / _240;
    float _252 = fma(_230, _246, _248);
    float _254 = in.m_41.w;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = abs(_252);
    float _262 = _260 + 0.07999999821186065673828125;
    float _264 = abs(_252);
    float _266 = _264 + 0.7466666698455810546875;
    float _268 = abs(_252);
    float _270 = _268 + 0.413333356380462646484375;
    float _272 = abs(_252);
    float _274 = fma(_272, 6.0, 0.4799999892711639404296875);
    float _276 = abs(_252);
    float _278 = fma(_276, 6.0, 4.480000019073486328125);
    float _280 = abs(_252);
    float _282 = fma(_280, 6.0, 2.480000019073486328125);
    float _284 = floor(_262);
    float _286 = _234 * _250;
    float _288 = _168 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _290 = _77 * _77;
    float _292 = _286 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _294 = floor(_266);
    float _296 = floor(_270);
    float _298 = fma(_284, -6.0, _274);
    float _300 = in.m_41.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _298 + (-3.0);
    float _308 = fma(_294, -6.0, _278);
    float _310 = abs(_306);
    float _312 = _310 + (-1.0);
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = in.m_41.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = _67 * _258;
    float _324 = _308 + (-3.0);
    float _326 = _314 + (-1.0);
    float _328 = fma(_296, -6.0, _282);
    float _330 = abs(_324);
    float _332 = _330 + (-1.0);
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = in.m_41.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = fma(_292, _326, 1.0);
    float _344 = _328 + (-3.0);
    float _346 = _334 + (-1.0);
    float _348 = abs(_344);
    float _350 = _348 + (-1.0);
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = fma(_292, _346, 1.0);
    float _356 = _352 + (-1.0);
    float _358 = -_216;
    float _360 = fma(_220, _354, _358);
    float _362 = fma(_292, _356, 1.0);
    float _364 = _170 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _366 = fma(_290, _360, _216);
    float _368 = -_288;
    float _370 = fma(_220, _362, _368);
    float _372 = -_364;
    float _374 = fma(_220, _342, _372);
    float _376 = _366 + 0.310000002384185791015625;
    float _378 = fma(_290, _370, _288);
    float _380 = fma(_290, _374, _364);
    float _382 = _67 * _304;
    float _384 = _378 + 0.23999999463558197021484375;
    float _386 = _380 + 0.3400000035762786865234375;
    bool _388 = _146 >= _322;
    bool _390 = isnan(_146);
    bool _392 = _388 || _390;
    bool _394 = isnan(_322);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _67 * _320;
    float _402 = _67 * _340;
    float _404 = _398 * (*spvDescriptorSet0.fp_c9)._m0[192].x;
    float _406 = fma(_400, _404, _386);
    float _408 = fma(_402, _404, _376);
    float _410 = fma(_382, _404, _384);
    if (!_131)
    {
        out.m_44.x = _406;
        out.m_44.y = _408;
        out.m_44.z = _410;
        out.m_44.w = _111;
        return out;
    }
    float _412 = _408 * 0.715200006961822509765625;
    float _414 = 0.0 + _119;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = fma(_406, 0.2125999927520751953125, _412);
    bool _420 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _422 = fma(_410, 0.072200000286102294921875, _418);
    float _424 = 1.0 / _422;
    float _426 = _424 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = fma(_428, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _432 = _406 * _430;
    float _434 = _408 * _430;
    float _436 = _410 * _430;
    float _438 = _430;
    if (!_420)
    {
        _438 = _416;
    }
    float _440 = _438;
    bool _442 = !_420;
    float _444 = _440;
    if (!_442)
    {
        float _446 = in.m_46.w;
        float _448 = gl_FragCoord.w;
        float _450 = _446 * _448;
        float _452 = in.m_46.z;
        float _454 = gl_FragCoord.w;
        float _456 = _452 * _454;
        float _458 = _67 * _450;
        float _460 = _67 * _456;
        float _462 = 1.0 / _458;
        float _464 = _460 * _462;
        float _466 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _468 = fma(_464, (*spvDescriptorSet0.fp_c8)._m0[30].w, _466);
        float _470 = 1.0 / _468;
        float _472 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _474 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _476 = fma(_470, _472, _474);
        float _478 = _476 * 8.0;
        float _480 = precise::clamp(_478, 0.0, 1.0);
        float _482 = _416 * _480;
        _444 = _482;
    }
    float _484 = _444;
    float _486 = 0.0 + _484;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    out.m_44.x = _432;
    out.m_44.y = _434;
    out.m_44.z = _436;
    out.m_44.w = _488;
    return out;
}

