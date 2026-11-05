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
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5), flat]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _57;
    float _75 = rint(_59);
    float _77 = precise::max(_75, 0.0);
    uint _80 = uint(_77);
    uint _82 = clamp(_80, 0u, 65535u);
    float _84 = _73 * _65;
    float _86 = _73 * _71;
    float3 _447 = float3(_84, _86, float(int(_82)));
    float3 _451 = select(_447, float3(0.0), isnan(_447));
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _451.xy, uint(rint(_451.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _451.xy, uint(rint(_451.z))).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_39.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _73 * _103;
    float _119 = _73 * _109;
    float _121 = in.m_37.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_41.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_41.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = _73 * _115;
    float _141 = _73 * _125;
    float _143 = _73 * _131;
    float _145 = _73 * _137;
    float _147 = -_143;
    float _149 = _141 + _147;
    float _151 = _97 * _117;
    float _153 = 0.0 + _151;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _155 * _119;
    bool _161 = _157 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _163 = isnan(_157);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _169 = _165 || _167;
    float _171 = in.m_41.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_37.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    if (!_169)
    {
        discard_fragment();
    }
    float _183 = fma(_93, _149, _143);
    float _185 = _73 * _175;
    float _187 = _73 * _181;
    float _189 = -_185;
    float _191 = _139 + _189;
    float _193 = -_145;
    float _195 = _187 + _193;
    float _197 = fma(_91, _191, _185);
    float _199 = fma(_95, _195, _145);
    if (!_169)
    {
        out.m_44.x = _197;
        out.m_44.y = _183;
        out.m_44.z = _199;
        out.m_44.w = _151;
        return out;
    }
    float _201 = in.m_46.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _73 * _205;
    bool _209 = _207 != 1.0;
    bool _211 = isnan(_207);
    bool _213 = _209 || _211;
    bool _215 = isnan(1.0);
    bool _217 = _213 || _215;
    bool _219 = !_217;
    if (!_219)
    {
        float _221 = gl_FragCoord.x;
        float _223 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _225 = _221 / _223;
        float _227 = gl_FragCoord.y;
        float _229 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _231 = _227 / _229;
        float _233 = _207 * 256.0;
        float _235 = trunc(_233);
        int _238 = int(_235);
        float _240 = trunc(_225);
        int _242 = int(_240);
        float _244 = trunc(_231);
        int _246 = int(_244);
        int _248 = _242 + 2;
        int _250 = _248 >> 1;
        uint _252 = uint(int(uint(_246) >> uint(1)));
        int _254 = _250 ^ int(_252);
        int _256 = _254 << 16;
        int _258 = _256 ^ _250;
        int _260 = 983055 & _258;
        int _262 = _260 << 6;
        int _264 = _262 + _260;
        int _266 = _264 & 13369548;
        uint _268 = uint(int(uint(_266) >> uint(3)));
        int _270 = _266 | int(_268);
        uint _272 = uint(int(uint(_238) >> uint(7)));
        int _274 = int(_272) + _238;
        int _276 = _270 & 5570560;
        int _278 = _270 & 85;
        uint _280 = uint(int(uint(_276) >> uint(15)));
        int _282 = int(_280) + _278;
        bool _284 = uint(_274) > uint(_282);
        if (!_284)
        {
            discard_fragment();
        }
        if (!_284)
        {
            out.m_44.x = _197;
            out.m_44.y = _183;
            out.m_44.z = _199;
            out.m_44.w = _157;
            return out;
        }
    }
    float _286 = _183 * 0.715200006961822509765625;
    float _288 = in.m_48.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_48.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_48.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_197, 0.2125999927520751953125, _286);
    float _308 = in.m_48.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_199, 0.072200000286102294921875, _306);
    bool _316 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _318 = 1.0 / _314;
    float _320 = _318 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = fma(_322, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _326 = _73 * _292;
    float _328 = _73 * _298;
    float _330 = _324 * _326;
    float _332 = 0.0 + _157;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _73 * _304;
    float _338 = _73 * _312;
    float _340 = fma(_199, _330, _328);
    float _342 = fma(_197, _330, _336);
    float _344 = fma(_183, _330, _338);
    float _346 = _328;
    if (!_316)
    {
        _346 = _334;
    }
    float _348 = _346;
    bool _350 = !_316;
    float _352 = _348;
    if (!_350)
    {
        float _354 = in.m_50.w;
        float _356 = gl_FragCoord.w;
        float _358 = _354 * _356;
        float _360 = in.m_50.z;
        float _362 = gl_FragCoord.w;
        float _364 = _360 * _362;
        float _366 = _73 * _358;
        float _368 = _73 * _364;
        float _370 = 1.0 / _366;
        float _372 = _368 * _370;
        float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _376 = fma(_372, (*spvDescriptorSet0.fp_c8)._m0[30].w, _374);
        float _378 = 1.0 / _376;
        float _380 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _384 = fma(_378, _380, _382);
        float _386 = _384 * 8.0;
        float _388 = precise::clamp(_386, 0.0, 1.0);
        float _390 = _334 * _388;
        _352 = _390;
    }
    float _392 = _352;
    float _394 = 0.0 + _392;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    out.m_44.x = _342;
    out.m_44.y = _344;
    out.m_44.z = _340;
    out.m_44.w = _396;
    return out;
}

