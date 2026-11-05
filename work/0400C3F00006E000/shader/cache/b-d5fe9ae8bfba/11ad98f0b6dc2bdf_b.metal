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

struct spvDescriptorSetBuffer0
{
    texture2d_array<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    texture2d_array<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
    float4 m_25 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_25.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_25.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_25.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_25.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_27.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_27.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_27.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_27.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _41;
    float _93 = _91 * _47;
    float _95 = _91 * _53;
    float _97 = _91 * _59;
    float _99 = _91 * _65;
    float _101 = _91 * _71;
    float _103 = _91 * _77;
    float _105 = rint(_93);
    float _107 = precise::max(_105, 0.0);
    uint _110 = uint(_107);
    uint _112 = clamp(_110, 0u, 65535u);
    float _114 = _91 * _83;
    float _116 = _91 * _89;
    float _118 = rint(_116);
    float _120 = precise::max(_118, 0.0);
    uint _122 = uint(_120);
    uint _124 = clamp(_122, 0u, 65535u);
    float3 _483 = float3(_95, _99, float(int(_112)));
    float3 _487 = select(_483, float3(0.0), isnan(_483));
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _487.xy, uint(rint(_487.z)), level(_97)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _487.xy, uint(rint(_487.z)), level(_97)).w;
    float3 _497 = float3(_95, _99, float(int(_112)));
    float3 _499 = select(_497, float3(0.0), isnan(_497));
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _499.xy, uint(rint(_499.z)), level(_97), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _499.xy, uint(rint(_499.z)), level(_97), int2(1)).w;
    float3 _511 = float3(_95, _99, float(int(_112)));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _513.xy, uint(rint(_513.z)), level(_97), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _513.xy, uint(rint(_513.z)), level(_97), int2(1, 0)).w;
    float3 _524 = float3(_95, _99, float(int(_112)));
    float3 _526 = select(_524, float3(0.0), isnan(_524));
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _526.xy, uint(rint(_526.z)), level(_97), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _526.xy, uint(rint(_526.z)), level(_97), int2(0, 1)).w;
    float3 _537 = float3(_101, _103, float(int(_124)));
    float3 _539 = select(_537, float3(0.0), isnan(_537));
    float3 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _539.xy, uint(rint(_539.z)), level(_114)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _539.xy, uint(rint(_539.z)), level(_114)).xyz;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = in.m_29.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_29.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_29.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_31.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_31.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_29.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_31.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_31.w;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _91 * _148;
    float _194 = _91 * _160;
    float _196 = _192 * 0.15915493667125701904296875;
    float _198 = _91 * _154;
    float _200 = _194 * 0.15915493667125701904296875;
    float _202 = _198 * 0.15915493667125701904296875;
    float _204 = _91 * _166;
    float _206 = _196 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = _204 * 0.15915493667125701904296875;
    float _212 = _91 * _172;
    float _214 = _200 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = _212 * 0.15915493667125701904296875;
    float _220 = _91 * _178;
    float _222 = _220 * 0.15915493667125701904296875;
    float _224 = _91 * _184;
    float _226 = _210 * 6.283185482025146484375;
    float _228 = cos(_226);
    float _230 = _91 * _190;
    float _232 = _224 * 0.15915493667125701904296875;
    float _234 = _230 * 0.15915493667125701904296875;
    float _236 = _218 * 6.283185482025146484375;
    float _238 = sin(_236);
    float _240 = _216 * _216;
    float _242 = _240 * _208;
    float _244 = _202 * 6.283185482025146484375;
    float _246 = sin(_244);
    float _248 = _242 * _228;
    float _250 = _222 * 6.283185482025146484375;
    float _252 = sin(_250);
    float _254 = _238 * 0.0199999995529651641845703125;
    float _256 = fma(_248, 0.5, _254);
    float _258 = _232 * 6.283185482025146484375;
    float _260 = sin(_258);
    float _262 = _246 * _246;
    float _264 = _256 * 16.0;
    float _266 = _234 * 6.283185482025146484375;
    float _268 = cos(_266);
    float _270 = _262 * _252;
    float _272 = floor(_264);
    float _274 = _270 * _260;
    float _276 = _268 * 0.0199999995529651641845703125;
    float _278 = fma(_274, 0.5, _276);
    float _280 = _278 * 16.0;
    float _282 = -_272;
    float _284 = _264 + _282;
    float _286 = floor(_280);
    float _288 = fma(_284, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    float _290 = -_286;
    float _292 = _280 + _290;
    float _294 = fma(_292, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    bool _298 = _126 == _128;
    float _300 = float(_298);
    bool _302 = _130 == _128;
    float _304 = float(_302);
    bool _306 = _130 == _132;
    float _308 = float(_306);
    bool _310 = _126 == _132;
    float _312 = float(_310);
    float _314 = _300 + _304;
    bool _316 = _132 == _128;
    float _318 = float(_316);
    bool _320 = _126 == _130;
    float _322 = float(_320);
    float _324 = _312 + _308;
    float _326 = _318 + _314;
    float _328 = _322 + _312;
    float _330 = _322 + _308;
    float _332 = _318 + _324;
    float _334 = _288 + _326;
    float _336 = _300 + _328;
    float _338 = _304 + _330;
    bool _340 = _332 > _334;
    float _342 = _288 + _338;
    float _344 = _340 ? _332 : _326;
    bool _346 = _336 > _342;
    float _348 = _294 + _344;
    float _350 = _346 ? _336 : _338;
    float _352 = _346 ? _126 : _130;
    bool _354 = _350 > _348;
    float _356 = _352;
    if (!_354)
    {
        float _358 = _340 ? _132 : _128;
        _356 = _358;
    }
    float _360 = _356;
    float _362 = fma(_360, 510.0, 0.25);
    float _364 = floor(_362);
    float _366 = fma(_364, 0.00196078442968428134918212890625, 3.9215687138494104146957397460938e-05);
    out.m_34.x = _138;
    out.m_34.y = _140;
    out.m_34.z = _142;
    out.m_34.w = _366;
    return out;
}

