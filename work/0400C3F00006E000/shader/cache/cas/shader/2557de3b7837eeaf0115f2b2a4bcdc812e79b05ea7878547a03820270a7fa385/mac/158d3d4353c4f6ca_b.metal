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
    constant _16* fp_c3 [[id(0)]];
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_27 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = in.m_27.x;
    float _47 = in.m_27.y;
    bool _51 = 0.0 <= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _53 = fma(_45, _45, 1.0);
    float _55 = fma(_47, _47, _53);
    float _57 = rsqrt(_55);
    float _59 = _45 * _57;
    float _61 = _47 * _57;
    float _63 = -_47;
    float _65 = _63 + 0.00340000004507601261138916015625;
    float _67 = _45 + (-0.007199999876320362091064453125);
    float _69 = _59 * 0.00340000004507601261138916015625;
    float _71 = _57 * _65;
    float _73 = _57 * _67;
    float _75 = -_69;
    float _77 = fma(_61, 0.007199999876320362091064453125, _75);
    float _79 = _77 * _77;
    float _81 = fma(_71, _71, _79);
    float _83 = fma(_73, _73, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _71 * _85;
    float _91 = _77 * _85;
    bool _93 = !_51;
    float _95 = 0.0;
    float _97 = 0.0;
    float _99 = 0.0;
    float _101 = 0.0;
    float _103 = 0.0;
    float _105 = 0.0;
    float _107 = 0.0;
    float _109 = 0.0;
    if (!_93)
    {
        float _111 = gl_FragCoord.w;
        float _113 = _57 * _87;
        float _115 = _61 * _89;
        float _117 = _59 * _91;
        float _119 = -_113;
        float _121 = fma(_61, _91, _119);
        float _123 = -_115;
        float _125 = fma(_59, _87, _123);
        float _127 = -_117;
        float _129 = fma(_57, _89, _127);
        float _131 = 1.0 / _111;
        float _133 = 0.0;
        bool _135;
        bool _258;
        do
        {
            float _137 = _133;
            float _139 = _95;
            float _141 = _97;
            float _143 = _99;
            float _145 = _101;
            float _147 = in.m_31.x;
            float _149 = gl_FragCoord.w;
            float _151 = _147 * _149;
            float _153 = in.m_31.y;
            float _155 = gl_FragCoord.w;
            float _157 = _153 * _155;
            float _159 = in.m_31.z;
            float _161 = gl_FragCoord.w;
            float _163 = _159 * _161;
            float _165 = in.m_33.x;
            float _167 = gl_FragCoord.w;
            float _169 = _165 * _167;
            float _171 = in.m_33.y;
            float _173 = gl_FragCoord.w;
            float _175 = _171 * _173;
            float _177 = in.m_33.z;
            float _179 = gl_FragCoord.w;
            float _181 = _177 * _179;
            float _183 = in.m_35.x;
            float _185 = gl_FragCoord.w;
            float _187 = _183 * _185;
            float _189 = in.m_35.y;
            float _191 = gl_FragCoord.w;
            float _193 = _189 * _191;
            float _195 = in.m_35.z;
            float _197 = gl_FragCoord.w;
            float _199 = _195 * _197;
            float _201 = _137 * 0.15915493667125701904296875;
            float _203 = rint((*spvDescriptorSet0.fp_c3)._m0[0].z);
            float _205 = precise::max(_203, 0.0);
            uint _208 = uint(_205);
            uint _210 = clamp(_208, 0u, 65535u);
            float _212 = _201 * 6.283185482025146484375;
            float _214 = cos(_212);
            float _216 = _201 * 6.283185482025146484375;
            float _218 = sin(_216);
            float _220 = _131 * _151;
            float _222 = _131 * _157;
            float _224 = _131 * _163;
            float _226 = precise::max(0.0, _214);
            float _228 = _214 * _214;
            float _230 = _59 * _214;
            float _232 = _57 * _214;
            float _234 = _131 * _169;
            float _236 = _131 * _175;
            float _238 = _131 * _181;
            float _240 = _131 * _187;
            float _242 = _131 * _193;
            float _244 = _131 * _199;
            float _246 = _61 * _214;
            float _248 = -3.1415927410125732421875;
            float _250 = _139;
            float _252 = _141;
            float _254 = _143;
            float _256 = _145;
            do
            {
                float _260 = _248;
                float _262 = _250;
                float _264 = _252;
                float _266 = _254;
                float _268 = _256;
                float _270 = _260 * 0.15915493667125701904296875;
                float _272 = _270 * 6.283185482025146484375;
                float _274 = cos(_272);
                float _276 = _270 * 6.283185482025146484375;
                float _278 = sin(_276);
                float _280 = _218 * _274;
                float _282 = fma(_280, _280, _228);
                float _284 = _218 * _278;
                float _286 = fma(_284, _284, _282);
                float _288 = rsqrt(_286);
                float _290 = _280 * _288;
                float _292 = _288 * _232;
                float _294 = _284 * _288;
                float _296 = _288 * _230;
                float _298 = _288 * _246;
                float _300 = fma(_91, _290, _292);
                float _302 = fma(_89, _290, _296);
                float _304 = fma(_87, _290, _298);
                float _306 = fma(_125, _294, _300);
                float _308 = fma(_121, _294, _302);
                float _310 = fma(_129, _294, _304);
                float _312 = _306 * _236;
                float _314 = _306 * _222;
                float _316 = _306 * _242;
                float _318 = fma(_308, _234, _312);
                float _320 = fma(_308, _220, _314);
                float _322 = fma(_308, _240, _316);
                float _324 = fma(_310, _238, _318);
                float _326 = fma(_310, _224, _320);
                float _328 = fma(_310, _244, _322);
                float _330 = abs(_324);
                float _332 = abs(_326);
                float _334 = precise::max(_330, _332);
                float _336 = abs(_328);
                float _338 = precise::max(_336, _334);
                float _340 = 1.0 / _338;
                float _342 = _326 * _340;
                float _344 = _324 * _340;
                float _346 = -_340;
                float _348 = _328 * _346;
                float4 _794 = float4(_344, _342, _348, float(int(_210)));
                float4 _798 = select(_794, float4(0.0), isnan(_794));
                float3 _352 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _798.xyz, uint(rint(_798.w)), level((*spvDescriptorSet0.fp_c3)._m0[2].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _798.xyz, uint(rint(_798.w)), level((*spvDescriptorSet0.fp_c3)._m0[2].x)).xyz;
                float _354 = _352.x;
                float _356 = _352.y;
                float _358 = _352.z;
                float _360 = _260 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
                float _362 = _226 + _262;
                bool _364 = _360 >= 3.1415927410125732421875;
                bool _366 = isnan(_360);
                bool _368 = _364 || _366;
                bool _370 = isnan(3.1415927410125732421875);
                bool _372 = _368 || _370;
                float _374 = fma(_226, _354, _264);
                float _376 = fma(_226, _356, _266);
                float _378 = fma(_226, _358, _268);
                _258 = !_372;
                _95 = _362;
                _97 = _374;
                _99 = _376;
                _101 = _378;
                _248 = _360;
                _250 = _362;
                _252 = _374;
                _254 = _376;
                _256 = _378;
                _103 = _362;
                _105 = _374;
                _107 = _376;
                _109 = _378;
            } while (_258);
            float _380 = _137 + (*spvDescriptorSet0.fp_c3)._m0[1].y;
            bool _382 = _380 > (*spvDescriptorSet0.fp_c3)._m0[1].x;
            bool _384 = isnan(_380);
            bool _386 = _382 || _384;
            bool _388 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
            bool _390 = _386 || _388;
            _135 = !_390;
            _133 = _380;
        } while (_135);
    }
    float _392 = _103;
    float _394 = _105;
    float _396 = _107;
    float _398 = _109;
    float _400 = 1.0 / _392;
    float _402 = _400 * _394;
    float _404 = _400 * _396;
    float _406 = _400 * _398;
    out.m_38.x = _402;
    out.m_38.y = _404;
    out.m_38.z = _406;
    out.m_38.w = 1.0;
    return out;
}

