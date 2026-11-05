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
    constant _16* fp_c3 [[id(1)]];
    texture3d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.x;
    float _39 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _41 = _37 / _39;
    float _43 = gl_FragCoord.y;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _51 = _49 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _53 = _41 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _55 = fma(_53, 1.2000000476837158203125, -0.20000000298023223876953125);
    float _57 = _47 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _59 = -_55;
    float _61 = fma(_59, _55, 1.0);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    float _65 = fma(_57, _51, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _67 = sqrt(_63);
    int _70 = 0;
    float _72 = 0.0;
    float _74 = 0.0;
    float _76 = 0.0;
    float _78 = 0.0;
    bool _82;
    bool _154;
    float _404;
    float _406;
    float _408;
    do
    {
        int _84 = _70;
        float _86 = _72;
        float _88 = _74;
        float _90 = _76;
        float _92 = _78;
        float _94 = 1.0 / _51;
        float _96 = float(_84);
        float _98 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _100 = _65 + _98;
        float _102 = _65 * _65;
        float _104 = fma(_96, 0.098174773156642913818359375, 0.0490873865783214569091796875);
        float _106 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _108 = 1.0 + _106;
        int _110 = _84 + 1;
        float _112 = _104 * 0.15915493667125701904296875;
        float _114 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _116 = _100 * _94;
        float _118 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
        float _120 = 1.0 + _118;
        float _122 = _112 * 6.283185482025146484375;
        float _124 = cos(_122);
        float _126 = -_114;
        float _128 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _126);
        float _130 = _116 * _120;
        float _132 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[6].x;
        bool _134 = _110 >= 64;
        float _136 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _130);
        float _138 = sqrt(_128);
        float _140 = _67 * _124;
        _70 = _110;
        int _142 = 0;
        float _144 = _90;
        float _146 = _92;
        float _148 = _86;
        float _150 = _88;
        float _152 = _90;
        do
        {
            int _156 = _142;
            float _158 = _144;
            float _160 = _146;
            float _162 = _148;
            float _164 = _150;
            float _166 = _152;
            float _168 = precise::max(_55, -0.19750000536441802978515625);
            float _170 = -_114;
            float _172 = _170 + _102;
            float _174 = float(_156);
            float _176 = _168 * 5.34962368011474609375;
            float _178 = fma(_174, 0.098174773156642913818359375, 0.0490873865783214569091796875);
            float _180 = sqrt(_172);
            float _182 = abs(_176);
            bool _184 = _182 > 1.0;
            float _186 = _178 * 0.15915493667125701904296875;
            float _188 = abs(_176);
            bool _190 = _188 > as_type<float>(0x7f800000u /* inf */);
            bool _192 = isnan(_188);
            bool _194 = _190 || _192;
            bool _196 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _198 = _194 || _196;
            float _200 = _186 * 6.283185482025146484375;
            float _202 = cos(_200);
            float _204 = _158;
            float _206 = _160;
            float _208 = _176;
            if (!_184)
            {
                float _210 = abs(_176);
                float _212 = (-0.0) + _210;
                _204 = _212;
            }
            float _214 = _204;
            float _216 = _186 * 6.283185482025146484375;
            float _218 = sin(_216);
            float _220 = _214;
            if (_184)
            {
                float _222 = abs(_176);
                float _224 = 1.0 / _222;
                _220 = _224;
            }
            float _226 = _220;
            float _228 = _65 * _202;
            float _230 = -_102;
            float _232 = fma(_228, _228, _230);
            float _234 = _114 + _232;
            float _236 = -_114;
            bool _238 = _232 > _236;
            bool _240 = _228 < 0.0;
            bool _242 = _240 && _238;
            float _244 = _226 * _226;
            float _246 = _244 + 11.33538818359375;
            float _248 = fma(_244, -0.82336294651031494140625, -5.674867153167724609375);
            float _250 = fma(_244, _246, 28.84246826171875);
            float _252 = fma(_244, _248, -6.565555095672607421875);
            float _254 = _244;
            if (_242)
            {
                _206 = 0.0;
            }
            float _256 = _206;
            float _258 = fma(_244, _250, 19.6966705322265625);
            float _260 = _256;
            if (!_242)
            {
                _260 = _128;
            }
            float _262 = _260;
            float _264 = _244 * _252;
            float _266 = _55 * _202;
            if (_242)
            {
                _254 = 0.0;
            }
            float _268 = _254;
            float _270 = 1.0 / _258;
            float _272 = _234 + _262;
            float _274 = _264 * _226;
            float _276 = fma(_218, _140, _266);
            float _278 = _268;
            if (!_242)
            {
                _278 = _138;
            }
            float _280 = _278;
            float _282 = fma(_276, 0.5, 0.5);
            float _284 = sqrt(_272);
            float _286 = _180 + _280;
            float _288 = _282 * _132;
            float _290 = fma(_274, _270, _226);
            int _292 = as_type<int>(_176) & int(0x80000000);
            float _294 = 1.0 / _286;
            int _296 = as_type<int>(_290);
            float _298 = _286;
            if (_242)
            {
                _208 = 1.0;
            }
            float _300 = _208;
            float _302 = _300;
            if (_184)
            {
                float _304 = -_290;
                float _306 = _304 + 1.57079637050628662109375;
                _296 = as_type<int>(_306);
            }
            int _308 = _296;
            float _310 = as_type<float>(_308);
            if (!_242)
            {
                _302 = -1.0;
            }
            float _312 = _302;
            if (!_198)
            {
                int _314 = _292 | _308;
                _310 = as_type<float>(_314);
            }
            float _316 = _310;
            float _318 = fma(_228, _312, _284);
            float _320 = floor(_288);
            if (_242)
            {
                float _322 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _324 = fma(_322, 0.5, 0.5);
                _298 = _324;
            }
            float _326 = _298;
            float _328 = _326;
            if (!_242)
            {
                float _330 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
                _328 = _330;
            }
            float _332 = _328;
            float _334 = fma(0.454545438289642333984375, _316, 0.37000000476837158203125);
            float _336 = _334 * _108;
            float _338 = _318 * _294;
            float _340 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _342 = _340 + 0.5;
            float _344 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[5].y, _336);
            float _346 = fma(_338, _342, _332);
            float _348 = _344 + _320;
            float _350 = _348 + 1.0;
            float _352 = _348 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _354 = _350 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float3 _840 = float3(_352, _346, _136);
            float3 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_840, float3(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_840, float3(0.0), isnan(_840))).xyz;
            float _360 = _358.x;
            float _362 = _358.y;
            float _364 = _358.z;
            float3 _857 = float3(_354, _346, _136);
            float3 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_857, float3(0.0), isnan(_857))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_857, float3(0.0), isnan(_857))).xyz;
            float _368 = _366.x;
            float _370 = _366.y;
            float _372 = _366.z;
            int _374 = _156 + 1;
            float _376 = _218 * 0.00963828526437282562255859375;
            float _378 = -_320;
            float _380 = _288 + _378;
            bool _382 = _374 >= 16;
            float _384 = _202 * _376;
            float _386 = -_360;
            float _388 = _386 + _368;
            float _390 = -_362;
            float _392 = _390 + _370;
            float _394 = -_364;
            float _396 = _394 + _372;
            float _398 = fma(_380, _388, _360);
            float _400 = fma(_380, _392, _362);
            float _402 = fma(_380, _396, _364);
            _404 = fma(_398, _384, _162);
            _406 = fma(_400, _384, _164);
            _408 = fma(_402, _384, _166);
            _154 = !_382;
            _78 = _396;
            _142 = _374;
            _144 = _360;
            _146 = _396;
            _148 = _404;
            _150 = _406;
            _152 = _408;
        } while (_154);
        _82 = !_134;
        _72 = _404;
        _74 = _406;
        _76 = _408;
    } while (_82);
    out.m_30.x = _404;
    out.m_30.y = _406;
    out.m_30.z = _408;
    out.m_30.w = 0.0;
    return out;
}

