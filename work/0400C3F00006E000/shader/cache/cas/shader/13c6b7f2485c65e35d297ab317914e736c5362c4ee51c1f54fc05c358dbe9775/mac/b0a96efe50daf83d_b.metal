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
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_27.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_27.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _37;
    float _77 = _75 * _43;
    float _79 = _75 * _67;
    float _81 = _75 * _73;
    float _83 = _77 * 0.15915493667125701904296875;
    float _85 = _75 * _49;
    float _87 = rint(_79);
    float _89 = precise::max(_87, 0.0);
    uint _92 = uint(_89);
    uint _94 = clamp(_92, 0u, 65535u);
    float _96 = _85 * 0.15915493667125701904296875;
    float _98 = _75 * _55;
    float _100 = _98 * 0.15915493667125701904296875;
    float _102 = _83 * 6.283185482025146484375;
    float _104 = cos(_102);
    float _106 = _75 * _61;
    float _108 = _106 * 0.15915493667125701904296875;
    float _110 = _96 * 6.283185482025146484375;
    float _112 = cos(_110);
    float _114 = _100 * 6.283185482025146484375;
    float _116 = sin(_114);
    float _118 = _104 * _104;
    float _120 = _108 * 6.283185482025146484375;
    float _122 = cos(_120);
    float _124 = _118 * _112;
    float _126 = _116 * 0.0199999995529651641845703125;
    float _128 = _124 * _122;
    float _130 = fma(_128, 0.5, _126);
    float _132 = in.m_27.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _130 * 16.0;
    float _140 = floor(_138);
    float _142 = -_140;
    float _144 = _138 + _142;
    float _146 = _144 * 2.0;
    bool _150 = _146 >= 1.0;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = _75 * _136;
    int _163 = as_type<int>(_138);
    int _165 = as_type<int>(_146);
    int _167 = as_type<int>(_112);
    int _169 = as_type<int>(_136);
    int _171 = as_type<int>(_160);
    int _173 = 16;
    if (_158)
    {
        float3 _579 = float3(_81, _160, float(int(_94)));
        float3 _583 = select(_579, float3(0.0), isnan(_579));
        float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _583.xy, uint(rint(_583.z)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _583.xy, uint(rint(_583.z)), int2(1, 0)).xyzw;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        float _184 = _176.w;
        _163 = as_type<int>(_178);
        _165 = as_type<int>(_180);
        _167 = as_type<int>(_182);
        _169 = as_type<int>(_184);
    }
    int _186 = _163;
    int _188 = _165;
    int _190 = _167;
    int _192 = _169;
    int _194 = as_type<int>(_100);
    int _196 = as_type<int>(_55);
    int _198 = as_type<int>(_83);
    int _200 = as_type<int>(_108);
    if (!_158)
    {
        float3 _626 = float3(_81, _160, float(int(_94)));
        float3 _628 = select(_626, float3(0.0), isnan(_626));
        float4 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _628.xy, uint(rint(_628.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _628.xy, uint(rint(_628.z))).xyzw;
        float _204 = _202.x;
        float _206 = _202.y;
        float _208 = _202.z;
        float _210 = _202.w;
        _194 = as_type<int>(_204);
        _196 = as_type<int>(_206);
        _198 = as_type<int>(_208);
        _200 = as_type<int>(_210);
    }
    int _212 = _194;
    int _214 = _196;
    int _216 = _198;
    int _218 = _200;
    int _220 = 0;
    int _222 = 0;
    if (!_158)
    {
        float3 _661 = float3(_81, _160, float(int(_94)));
        float3 _663 = select(_661, float3(0.0), isnan(_661));
        float4 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _663.xy, uint(rint(_663.z)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _663.xy, uint(rint(_663.z)), int2(0, 1)).xyzw;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        float _232 = _224.w;
        _220 = as_type<int>(_226);
        _222 = as_type<int>(_228);
        _171 = as_type<int>(_230);
        _173 = as_type<int>(_232);
    }
    int _234 = _220;
    int _236 = _222;
    int _238 = _171;
    int _240 = _173;
    int _242 = 0;
    int _244 = 0;
    int _246 = as_type<int>(_160);
    int _248 = 17;
    if (_158)
    {
        float3 _699 = float3(_81, _160, float(int(_94)));
        float3 _701 = select(_699, float3(0.0), isnan(_699));
        float4 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _701.xy, uint(rint(_701.z)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _701.xy, uint(rint(_701.z)), int2(1)).xyzw;
        float _252 = _250.x;
        float _254 = _250.y;
        float _256 = _250.z;
        float _258 = _250.w;
        _242 = as_type<int>(_252);
        _244 = as_type<int>(_254);
        _246 = as_type<int>(_256);
        _248 = as_type<int>(_258);
    }
    int _260 = _242;
    int _262 = _244;
    int _264 = _246;
    int _266 = _248;
    float _268 = in.m_23.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_23.w;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_25.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_25.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = _75 * _272;
    float _294 = _292 * 0.15915493667125701904296875;
    float _296 = _75 * _278;
    float _298 = _296 * 0.15915493667125701904296875;
    float _300 = _75 * _284;
    float _302 = _294 * 6.283185482025146484375;
    float _304 = sin(_302);
    float _306 = _75 * _290;
    float _308 = _300 * 0.15915493667125701904296875;
    float _310 = _306 * 0.15915493667125701904296875;
    float _312 = _298 * 6.283185482025146484375;
    float _314 = sin(_312);
    float _316 = _308 * 6.283185482025146484375;
    float _318 = sin(_316);
    float _320 = _304 * _304;
    float _322 = _310 * 6.283185482025146484375;
    float _324 = cos(_322);
    float _326 = _320 * _314;
    float _328 = _326 * _318;
    float _330 = _324 * 0.0199999995529651641845703125;
    float _332 = fma(_328, 0.5, _330);
    float _334 = _332 * 16.0;
    float _336 = floor(_334);
    float _338 = -_336;
    float _340 = _334 + _338;
    float _342 = _340 * 2.0;
    bool _344 = _342 >= 1.0;
    bool _346 = isnan(_342);
    bool _348 = _344 || _346;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = !_158;
    int _356 = _354 ? _212 : _186;
    bool _358 = !_158;
    int _360 = _358 ? _214 : _188;
    bool _362 = !_158;
    int _364 = _362 ? _216 : _190;
    bool _366 = !_158;
    int _368 = _366 ? _218 : _192;
    int _370 = _356;
    int _372 = _360;
    int _374 = _364;
    int _376 = _368;
    if (_352)
    {
        bool _378 = !_158;
        int _380 = _378 ? _234 : _260;
        _370 = _380;
    }
    int _382 = _370;
    if (_352)
    {
        bool _384 = !_158;
        int _386 = _384 ? _236 : _262;
        _372 = _386;
    }
    int _388 = _372;
    if (_352)
    {
        bool _390 = !_158;
        int _392 = _390 ? _238 : _264;
        _374 = _392;
    }
    int _394 = _374;
    if (_352)
    {
        bool _396 = !_158;
        int _398 = _396 ? _240 : _266;
        _376 = _398;
    }
    int _400 = _376;
    out.m_30.x = as_type<float>(_382);
    out.m_30.y = as_type<float>(_388);
    out.m_30.z = as_type<float>(_394);
    out.m_30.w = as_type<float>(_400);
    return out;
}


struct main0_out_u
{
    uint4 m_30 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_25.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_25.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_27.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_27.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _37;
    float _77 = _75 * _43;
    float _79 = _75 * _67;
    float _81 = _75 * _73;
    float _83 = _77 * 0.15915493667125701904296875;
    float _85 = _75 * _49;
    float _87 = rint(_79);
    float _89 = precise::max(_87, 0.0);
    uint _92 = uint(_89);
    uint _94 = clamp(_92, 0u, 65535u);
    float _96 = _85 * 0.15915493667125701904296875;
    float _98 = _75 * _55;
    float _100 = _98 * 0.15915493667125701904296875;
    float _102 = _83 * 6.283185482025146484375;
    float _104 = cos(_102);
    float _106 = _75 * _61;
    float _108 = _106 * 0.15915493667125701904296875;
    float _110 = _96 * 6.283185482025146484375;
    float _112 = cos(_110);
    float _114 = _100 * 6.283185482025146484375;
    float _116 = sin(_114);
    float _118 = _104 * _104;
    float _120 = _108 * 6.283185482025146484375;
    float _122 = cos(_120);
    float _124 = _118 * _112;
    float _126 = _116 * 0.0199999995529651641845703125;
    float _128 = _124 * _122;
    float _130 = fma(_128, 0.5, _126);
    float _132 = in.m_27.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _130 * 16.0;
    float _140 = floor(_138);
    float _142 = -_140;
    float _144 = _138 + _142;
    float _146 = _144 * 2.0;
    bool _150 = _146 >= 1.0;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = _75 * _136;
    int _163 = as_type<int>(_138);
    int _165 = as_type<int>(_146);
    int _167 = as_type<int>(_112);
    int _169 = as_type<int>(_136);
    int _171 = as_type<int>(_160);
    int _173 = 16;
    if (_158)
    {
        float3 _579 = float3(_81, _160, float(int(_94)));
        float3 _583 = select(_579, float3(0.0), isnan(_579));
        float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _583.xy, uint(rint(_583.z)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _583.xy, uint(rint(_583.z)), int2(1, 0)).xyzw;
        float _178 = _176.x;
        float _180 = _176.y;
        float _182 = _176.z;
        float _184 = _176.w;
        _163 = as_type<int>(_178);
        _165 = as_type<int>(_180);
        _167 = as_type<int>(_182);
        _169 = as_type<int>(_184);
    }
    int _186 = _163;
    int _188 = _165;
    int _190 = _167;
    int _192 = _169;
    int _194 = as_type<int>(_100);
    int _196 = as_type<int>(_55);
    int _198 = as_type<int>(_83);
    int _200 = as_type<int>(_108);
    if (!_158)
    {
        float3 _626 = float3(_81, _160, float(int(_94)));
        float3 _628 = select(_626, float3(0.0), isnan(_626));
        float4 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _628.xy, uint(rint(_628.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _628.xy, uint(rint(_628.z))).xyzw;
        float _204 = _202.x;
        float _206 = _202.y;
        float _208 = _202.z;
        float _210 = _202.w;
        _194 = as_type<int>(_204);
        _196 = as_type<int>(_206);
        _198 = as_type<int>(_208);
        _200 = as_type<int>(_210);
    }
    int _212 = _194;
    int _214 = _196;
    int _216 = _198;
    int _218 = _200;
    int _220 = 0;
    int _222 = 0;
    if (!_158)
    {
        float3 _661 = float3(_81, _160, float(int(_94)));
        float3 _663 = select(_661, float3(0.0), isnan(_661));
        float4 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _663.xy, uint(rint(_663.z)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _663.xy, uint(rint(_663.z)), int2(0, 1)).xyzw;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        float _232 = _224.w;
        _220 = as_type<int>(_226);
        _222 = as_type<int>(_228);
        _171 = as_type<int>(_230);
        _173 = as_type<int>(_232);
    }
    int _234 = _220;
    int _236 = _222;
    int _238 = _171;
    int _240 = _173;
    int _242 = 0;
    int _244 = 0;
    int _246 = as_type<int>(_160);
    int _248 = 17;
    if (_158)
    {
        float3 _699 = float3(_81, _160, float(int(_94)));
        float3 _701 = select(_699, float3(0.0), isnan(_699));
        float4 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _701.xy, uint(rint(_701.z)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _701.xy, uint(rint(_701.z)), int2(1)).xyzw;
        float _252 = _250.x;
        float _254 = _250.y;
        float _256 = _250.z;
        float _258 = _250.w;
        _242 = as_type<int>(_252);
        _244 = as_type<int>(_254);
        _246 = as_type<int>(_256);
        _248 = as_type<int>(_258);
    }
    int _260 = _242;
    int _262 = _244;
    int _264 = _246;
    int _266 = _248;
    float _268 = in.m_23.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_23.w;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_25.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_25.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = _75 * _272;
    float _294 = _292 * 0.15915493667125701904296875;
    float _296 = _75 * _278;
    float _298 = _296 * 0.15915493667125701904296875;
    float _300 = _75 * _284;
    float _302 = _294 * 6.283185482025146484375;
    float _304 = sin(_302);
    float _306 = _75 * _290;
    float _308 = _300 * 0.15915493667125701904296875;
    float _310 = _306 * 0.15915493667125701904296875;
    float _312 = _298 * 6.283185482025146484375;
    float _314 = sin(_312);
    float _316 = _308 * 6.283185482025146484375;
    float _318 = sin(_316);
    float _320 = _304 * _304;
    float _322 = _310 * 6.283185482025146484375;
    float _324 = cos(_322);
    float _326 = _320 * _314;
    float _328 = _326 * _318;
    float _330 = _324 * 0.0199999995529651641845703125;
    float _332 = fma(_328, 0.5, _330);
    float _334 = _332 * 16.0;
    float _336 = floor(_334);
    float _338 = -_336;
    float _340 = _334 + _338;
    float _342 = _340 * 2.0;
    bool _344 = _342 >= 1.0;
    bool _346 = isnan(_342);
    bool _348 = _344 || _346;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = !_158;
    int _356 = _354 ? _212 : _186;
    bool _358 = !_158;
    int _360 = _358 ? _214 : _188;
    bool _362 = !_158;
    int _364 = _362 ? _216 : _190;
    bool _366 = !_158;
    int _368 = _366 ? _218 : _192;
    int _370 = _356;
    int _372 = _360;
    int _374 = _364;
    int _376 = _368;
    if (_352)
    {
        bool _378 = !_158;
        int _380 = _378 ? _234 : _260;
        _370 = _380;
    }
    int _382 = _370;
    if (_352)
    {
        bool _384 = !_158;
        int _386 = _384 ? _236 : _262;
        _372 = _386;
    }
    int _388 = _372;
    if (_352)
    {
        bool _390 = !_158;
        int _392 = _390 ? _238 : _264;
        _374 = _392;
    }
    int _394 = _374;
    if (_352)
    {
        bool _396 = !_158;
        int _398 = _396 ? _240 : _266;
        _376 = _398;
    }
    int _400 = _376;
    out.m_30.x = as_type<float>(_382);
    out.m_30.y = as_type<float>(_388);
    out.m_30.z = as_type<float>(_394);
    out.m_30.w = as_type<float>(_400);
    return main0_out_u{as_type<uint4>(out.m_30)};
}

