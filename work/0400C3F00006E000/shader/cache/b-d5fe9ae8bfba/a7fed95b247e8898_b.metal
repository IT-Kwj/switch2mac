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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texturecube<float> fp_t_tcb_1E [[id(3)]];
    sampler fp_t_tcb_1ESmplr [[id(4)]];
    sampler fp_t_tcb_1ESmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_33.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float _81 = 0.0 + _77;
    float _83 = precise::clamp(_81, 0.0, 1.0);
    float _85 = _83 * _79;
    bool _88 = _85 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _90 = isnan(_85);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _96 = _92 || _94;
    float _98 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _100 = in.m_41.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_41.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_41.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    if (!_96)
    {
        discard_fragment();
    }
    float _118 = in.m_33.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_33.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_33.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    bool _136 = as_type<int>(_98) != 0;
    float _138 = _75 * _104;
    float _140 = _75 * _110;
    bool _142 = !_136;
    float _144 = -_138;
    float _146 = _142 ? _144 : _138;
    float _148 = _75 * _116;
    bool _150 = !_136;
    float _152 = -_140;
    float _154 = _150 ? _152 : _140;
    float _156 = _146 * _146;
    bool _158 = !_136;
    float _160 = -_148;
    float _162 = _158 ? _160 : _148;
    float _164 = fma(_154, _154, _156);
    float _166 = _75 * _128;
    float _168 = fma(_162, _162, _164);
    float _170 = _75 * _122;
    float _172 = _75 * _134;
    float _174 = rsqrt(_168);
    float _176 = _154 * _174;
    float _178 = _146 * _174;
    float _180 = _162 * _174;
    if (!_96)
    {
        out.m_44.x = _170;
        out.m_44.y = _166;
        out.m_44.z = _172;
        out.m_44.w = _77;
        return out;
    }
    float _182 = abs(_176);
    float _184 = abs(_178);
    float _186 = precise::max(_182, _184);
    float _188 = abs(_180);
    float _190 = precise::max(_188, _186);
    float _192 = 1.0 / _190;
    float _194 = -_192;
    float _196 = _180 * _194;
    float _198 = _176 * _192;
    float _200 = _178 * _192;
    float3 _646 = float3(_198, _200, _196);
    float3 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_646, float3(0.0), isnan(_646)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_646, float3(0.0), isnan(_646)), level(0.0)).xyz;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _178 * _178;
    float _214 = in.m_46.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_46.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_46.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = fma(_176, _176, _212);
    float _234 = in.m_48.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_48.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = fma(_180, _180, _232);
    float _248 = in.m_50.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_50.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_50.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = rsqrt(_246);
    bool _268 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _270 = _178 * _266;
    float _272 = _75 * _218;
    float _274 = fma(_270, -0.5, 0.5);
    float _276 = _75 * _224;
    float _278 = _75 * _230;
    float _280 = in.m_52.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = _274 * _272;
    float _288 = _274 * _276;
    float _290 = in.m_48.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = _274 * _278;
    float _298 = _286 * 0.715200006961822509765625;
    float _300 = in.m_52.w;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_52.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = 0.0 + _85;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = fma(_288, 0.2125999927520751953125, _298);
    float _318 = fma(_296, 0.072200000286102294921875, _316);
    float _320 = in.m_52.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = 1.0 / _318;
    float _328 = _75 * _284;
    float _330 = _326 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _75 * _294;
    float _336 = fma(_332, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _338 = _75 * _238;
    float _340 = _75 * _244;
    float _342 = _75 * _304;
    float _344 = _288 * _336;
    float _346 = _286 * _336;
    float _348 = _296 * _336;
    float _350 = _75 * _324;
    float _352 = fma(_206, 0.20999999344348907470703125, _334);
    float _354 = fma(_208, 0.20999999344348907470703125, _338);
    float _356 = fma(_210, 0.20999999344348907470703125, _340);
    float _358 = _75 * _252;
    float _360 = _75 * _258;
    float _362 = _75 * _264;
    float _364 = _352 + _358;
    float _366 = _354 + _360;
    float _368 = _356 + _362;
    float _370 = _75 * _310;
    float _372 = fma(_170, _364, _344);
    float _374 = fma(_166, _366, _346);
    float _376 = fma(_172, _368, _348);
    float _378 = fma(_372, _342, _328);
    float _380 = fma(_374, _342, _370);
    float _382 = fma(_376, _342, _350);
    bool _384 = !_268;
    float _386 = _314;
    if (!_384)
    {
        float _388 = in.m_54.w;
        float _390 = gl_FragCoord.w;
        float _392 = _388 * _390;
        float _394 = in.m_54.z;
        float _396 = gl_FragCoord.w;
        float _398 = _394 * _396;
        float _400 = _75 * _392;
        float _402 = _75 * _398;
        float _404 = 1.0 / _400;
        float _406 = _402 * _404;
        float _408 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _410 = fma(_406, (*spvDescriptorSet0.fp_c8)._m0[30].w, _408);
        float _412 = 1.0 / _410;
        float _414 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _418 = fma(_412, _414, _416);
        float _420 = _418 * 8.0;
        float _422 = precise::clamp(_420, 0.0, 1.0);
        float _424 = _314 * _422;
        _386 = _424;
    }
    float _426 = _386;
    float _428 = 0.0 + _426;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    out.m_44.x = _378;
    out.m_44.y = _380;
    out.m_44.z = _382;
    out.m_44.w = _430;
    return out;
}

