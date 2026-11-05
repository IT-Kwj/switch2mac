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
    float2 _535 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_535, float2(0.0), isnan(_535))).w;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _79;
    float _95 = in.m_35.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _67 * _91;
    float _103 = _67 * _99;
    float _105 = _73 * _73;
    float _107 = _93 * _105;
    float _109 = _67 * _85;
    float _111 = 0.0 + _107;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _113 * _109;
    bool _119 = _115 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _121 = isnan(_115);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _127 = _123 || _125;
    if (!_127)
    {
        discard_fragment();
    }
    float2 _624;
    _624.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_103, _101));
    _624.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_103, _101));
    float _129 = _624.x;
    float _131 = _129 * 256.0;
    int _134 = int(_131);
    float _136 = float(uint(_134));
    float _138 = _136 * 0.00390625;
    float _140 = precise::min(_138, 2.0);
    float2 _643 = float2(_103, _101);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_643, float2(0.0), isnan(_643)), level(_140)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_643, float2(0.0), isnan(_643)), level(_140)).w;
    float _144 = in.m_37.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_37.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_37.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = 0.0 + _73;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = precise::max(_164, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _168 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _170 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _168;
    float _172 = 1.0 / _170;
    float _174 = _67 * _148;
    float _176 = _67 * _154;
    float _178 = _67 * _160;
    float _180 = -_176;
    float _182 = _174 + _180;
    bool _184 = _174 >= _176;
    bool _186 = isnan(_174);
    bool _188 = _184 || _186;
    bool _190 = isnan(_176);
    bool _192 = _188 || _190;
    float _194 = float(_192);
    float _196 = fma(_194, _182, _176);
    float _198 = -_174;
    float _200 = _198 + _176;
    float _202 = -_178;
    float _204 = _202 + _196;
    bool _206 = _178 >= _196;
    bool _208 = isnan(_178);
    bool _210 = _206 || _208;
    bool _212 = isnan(_196);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = fma(_194, _200, _174);
    float _220 = _174 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _222 = fma(_216, _204, _178);
    float _224 = -_196;
    float _226 = _178 + _224;
    float _228 = precise::min(_218, _222);
    float _230 = fma(_216, _226, _196);
    float _232 = -_218;
    float _234 = _232 + _222;
    float _236 = -_228;
    float _238 = _230 + _236;
    float _240 = _194 + (-1.0);
    float _242 = -_194;
    float _244 = _242 + 0.666666686534881591796875;
    float _246 = fma(_238, 6.0, 1.0000000133514319600180897396058e-10);
    float _248 = -_244;
    float _250 = _240 + _248;
    float _252 = 1.0 / _246;
    float _254 = fma(_216, _250, _244);
    float _256 = spvFAdd(_230, 1.0000000133514319600180897396058e-10);
    float _258 = 1.0 / _256;
    float _260 = fma(_234, _252, _254);
    float _262 = abs(_260);
    float _264 = _262 + 0.7466666698455810546875;
    float _266 = abs(_260);
    float _268 = _266 + 0.413333356380462646484375;
    float _270 = abs(_260);
    float _272 = _270 + 0.07999999821186065673828125;
    float _274 = abs(_260);
    float _276 = fma(_274, 6.0, 0.4799999892711639404296875);
    float _278 = _238 * _258;
    float _280 = abs(_260);
    float _282 = fma(_280, 6.0, 4.480000019073486328125);
    float _284 = floor(_264);
    float _286 = abs(_260);
    float _288 = fma(_286, 6.0, 2.480000019073486328125);
    float _290 = _278 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _292 = floor(_268);
    float _294 = floor(_272);
    float _296 = fma(_284, -6.0, _282);
    float _298 = in.m_41.w;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _296 + (-3.0);
    float _306 = fma(_292, -6.0, _288);
    float _308 = in.m_41.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_41.z;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = abs(_304);
    float _322 = _320 + (-1.0);
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _306 + (-3.0);
    float _328 = precise::min(_166, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _330 = _324 + (-1.0);
    float _332 = fma(_294, -6.0, _276);
    float _334 = abs(_326);
    float _336 = _334 + (-1.0);
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = in.m_41.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_290, _330, 1.0);
    float _348 = _332 + (-3.0);
    float _350 = _338 + (-1.0);
    float _352 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _354 = _328 + _352;
    float _356 = _176 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _358 = abs(_348);
    float _360 = _358 + (-1.0);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_220;
    float _366 = fma(_230, _346, _364);
    float _368 = _354 * _172;
    float _370 = _362 + (-1.0);
    float _372 = fma(_368, _366, _220);
    float _374 = fma(_290, _370, 1.0);
    float _376 = _178 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _378 = fma(_290, _350, 1.0);
    float _380 = _372 + 0.310000002384185791015625;
    float _382 = -_376;
    float _384 = fma(_230, _374, _382);
    float _386 = _67 * _302;
    float _388 = -_356;
    float _390 = fma(_230, _378, _388);
    float _392 = fma(_368, _384, _376);
    float _394 = _67 * _318;
    float _396 = fma(_368, _390, _356);
    float _398 = _392 + 0.3400000035762786865234375;
    float _400 = _396 + 0.23999999463558197021484375;
    bool _402 = _142 >= _386;
    bool _404 = isnan(_142);
    bool _406 = _402 || _404;
    bool _408 = isnan(_386);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _67 * _312;
    float _416 = _67 * _344;
    float _418 = _412 * (*spvDescriptorSet0.fp_c9)._m0[192].x;
    float _420 = fma(_414, _418, _398);
    float _422 = fma(_416, _418, _380);
    float _424 = fma(_394, _418, _400);
    if (!_127)
    {
        out.m_44.x = _420;
        out.m_44.y = _422;
        out.m_44.z = _424;
        out.m_44.w = _107;
        return out;
    }
    float _426 = _422 * 0.715200006961822509765625;
    float _428 = 0.0 + _115;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = fma(_420, 0.2125999927520751953125, _426);
    bool _434 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _436 = fma(_424, 0.072200000286102294921875, _432);
    float _438 = 1.0 / _436;
    float _440 = _438 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = fma(_442, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _446 = _420 * _444;
    float _448 = _422 * _444;
    float _450 = _424 * _444;
    float _452 = _444;
    if (!_434)
    {
        _452 = _430;
    }
    float _454 = _452;
    bool _456 = !_434;
    float _458 = _454;
    if (!_456)
    {
        float _460 = in.m_46.w;
        float _462 = gl_FragCoord.w;
        float _464 = _460 * _462;
        float _466 = in.m_46.z;
        float _468 = gl_FragCoord.w;
        float _470 = _466 * _468;
        float _472 = _67 * _464;
        float _474 = _67 * _470;
        float _476 = 1.0 / _472;
        float _478 = _474 * _476;
        float _480 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _482 = fma(_478, (*spvDescriptorSet0.fp_c8)._m0[30].w, _480);
        float _484 = 1.0 / _482;
        float _486 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _490 = fma(_484, _486, _488);
        float _492 = _490 * 8.0;
        float _494 = precise::clamp(_492, 0.0, 1.0);
        float _496 = _430 * _494;
        _458 = _496;
    }
    float _498 = _458;
    float _500 = 0.0 + _498;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    out.m_44.x = _446;
    out.m_44.y = _448;
    out.m_44.z = _450;
    out.m_44.w = _502;
    return out;
}

